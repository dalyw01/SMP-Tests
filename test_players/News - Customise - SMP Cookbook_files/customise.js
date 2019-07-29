require(
    [
        'conf',
        'reference',
        'util',
        'jquery-textcomplete'
    ],
    function(conf, reference, util, $) {
        var finishHint = function(textarea) {
            var search = '"$$SEARCH$$"';
            var content = textarea.val();
            var caret = textarea[0].selectionStart;
            
            var result = content.substring(0, caret) + '":' + search + content.substring(caret);
            try {
                JSON.parse(result);
                return result;
            } catch(e) {
                return result.replace(search, search + ',');
            }
        };
        var findPropertyPath = function(json, key, prefix) {
            var result;
            if (!prefix) {
                prefix = [];
            }
            if (Array.isArray(json)) {
                for (var i = 0; i < json.length; i++) {
                    if (typeof json[i] === 'object') {
                        result = findPropertyPath(json[i], key, prefix);
                        if (result) {
                            return result;
                        }
                    }
                }
            } else {
                for (var k in json) {
                    if (json.hasOwnProperty(k)) {
                        if (typeof json[k] === 'object') {
                            if (Array.isArray(json[k])) {
                                prefix.push(k + '[]');
                            } else {
                                prefix.push(k);
                            }
                            result = findPropertyPath(json[k], key, prefix);
                            if (result) {
                                return result;
                            } else {
                                prefix.shift();
                            }
                        } else {
                            if (k === key && json[k] === "$$SEARCH$$") {
                                return prefix;
                            }
                        }
                    }
                }
            }
            return null;
        };
        var getSearchFunc = function(textarea, schema) {
            return function(term, callback, match) {
                var result = [];
                // Work out the current "path"
                var content = finishHint(textarea);
                try {
                    var path = findPropertyPath(JSON.parse(content), term);
                } catch(e) {
                    callback([]);
                    return;
                }
                if (!path) {
                    callback([]);
                    return;
                }

                // Find keys for that prefix, and
                var keys = schema.properties;
                var rawPath;
                for (var i = 0; i < path.length; i++) {
                    rawPath = path[i].replace('[]', '');
                    keys = keys[rawPath].properties || keys[rawPath].items.properties;
                }

                // Enrich with key name for template and filter for term
                for (var key in keys) {
                    if (keys.hasOwnProperty(key) && key.startsWith(term)) {
                        result.push($.extend({name: key, path: path.join('.'), match: match}, keys[key]));
                    }
                }
                callback(result);
            };
        };
        var getReplaceFunc = function(textarea) {
            return function(value) {
                textarea.val(textarea.val().replace(new RegExp('(,\s*\n\s*)?"' + value.match[2] + '(\n|}|\w|")'), "$1\"\$SEARCH\$\":null$2"));
                var results = reference.addItem(textarea, reference.getKey(value.name, value.path), reference.getDefaultValue(value), '$SEARCH$');
                textarea[0].setSelectionRange(results[0], results[1]);
            };
        };

        ['settings', 'playlist'].forEach(function(e) {
            conf.schema(e, function(schema) {
                var container = $('#' + e);
                reference.build($('#' + e + '_reference'), schema, container, function(schema) {
                    container.textcomplete([{
                        search: getSearchFunc(container, schema),
                        match: /(^|\s|{)"(\w+)$/,
                        replace: getReplaceFunc(container),
                        template: function(value) {
                            return reference.getKey(value.name, value.path) + '<br><small>' + (value.description || 'No description') + '</small>';
                        },
                        cache: false
                    }]);
                });
            });
        });

        $('#try').on('click', function(e) {
            try {
                var settings = util.jsonToParam($('#settings').val());
            } catch(err) {
                $('#settings').addClass('error');
            }
            try {
                var playlist = util.jsonToParam($('#playlist').val());
            } catch(err) {
                $('#playlist').addClass('error');
            }
            if(settings && playlist) {

                var query = util.queryObj(window.location.search.substr(1));

                query.settings = settings;

                query.playlist = playlist;

                var url = '/' + recipe_id + '?' + util.toQueryString(query);

                window.location = url;
            }
            e.preventDefault();
        });
    }
);
