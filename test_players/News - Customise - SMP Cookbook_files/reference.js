define(['jquery'], function($) {
    var getKey = function(key, prefix) {
        if (typeof prefix !== 'undefined' && prefix !== '') {
            return prefix + '.' + key;
        } else {
            return key;
        }
    };

    var getTextareaJson = function(textarea) {
        try {
            var data = JSON.parse(textarea.val());
            textarea.val(JSON.stringify(data, null, 2));
            return data;
        } catch (e) {
            return false;
        }
    };

    /**
     * Given a full key (e.g. mediator.host), see if it exists
     * in the given textarea. Returns false if not in the area or invalid JSON
     * return start and end position of the value in the json text otherwise.
     */
    var findCursorLocationForValueInTextarea = function(textarea, key, value) {
        var data = getTextareaJson(textarea);

        if (!data) {
            return false;
        }

        var path = key.replace('[]', '').split('.');
        var indentLevel = path.length * 2;
        var location = data;
        for (var i = 0; i < path.length; i++) {
            if (Array.isArray(location) && location.length > 0) {
                location = location[0];
                i--;
            } else if (typeof location[path[i]] === 'undefined') {
                return false;
            } else {
                location = location[path[i]];
            }
        }
        
        if (value === undefined) {
            value = location;
        }

        // If we got to here, the path exists
        // XXX: This really won't work well if there's multiple child keys of the same name
        var searchStr = ' '.repeat(indentLevel) + '"' + path[path.length-1] + '": ';
        var startOfValue = textarea.val().indexOf(searchStr) + searchStr.length;
        // This is the location before quotes, braces etc.
        if (typeof value === 'string') {
            // Add one to account for opening quote.
            // Use JSON.stringify() to get correct escaping for quotes and similar, BUT then need to subtract 2 to
            // account for inserted quotes.
            return [startOfValue + 1, startOfValue + JSON.stringify(value).length - 1];
        } else if (typeof value === 'boolean' || typeof value === 'number') {
            return [startOfValue, startOfValue + JSON.stringify(value).length];
        } else if (Array.isArray(value)) {
            // XXX: Currently there aren't any arrays with default values so I'm not going to implement that logic.
            // Sorry.
            return [startOfValue + 1, startOfValue + 1];
        } else if (typeof value === 'object') {
            // XXX: Same as above. Still sorry.
            return [startOfValue + 1, startOfValue + 1];
        }
        
        return [startOfValue, startOfValue];
    };

    var addItem = function(textarea, key, value, findString) {
        var data = getTextareaJson(textarea);
        if (!data) {
            return false;
        }

        var path = key.split('.');
        var rawPath;
        var location = data;
        for (var i = 0; i < path.length-1; i++) {
            rawPath = path[i].replace('[]', '');
            if (!location[rawPath]) {
                location[rawPath] = path[i] === rawPath ? {} : [];
            }
            location = location[rawPath];
        }

        var found = false;
        if (Array.isArray(location)) {
            if (location.length === 0) {
                location.push({});
            }
            for (var j = 0; j < location.length; j++) {
                if (typeof location[j][findString] !== "undefined") {
                    location = location[j];
                    found = true;
                    break;
                }
            }
            if (!found) {
                location = location[Math.min(0, j-1)];
            }
        }

        if (!location[path[i]]) {
            location[path[i]] = value;
        }

        if (findString) {
            delete location[findString];
        }

        textarea.val(JSON.stringify(data, null, 2));
        return findCursorLocationForValueInTextarea(textarea, key, value);
    };

    var getDefaultValue = function(value) {
        var defaultValue = value.default;
        if (typeof defaultValue === "undefined") {
            if (value.type === 'object') {
                defaultValue = {};
            }
            if (value.type === 'string') {
                defaultValue = "";
            }
            if (value.type === "boolean") {
                defaultValue = false;
            }
            if (value.type === 'number') {
                defaultValue = 0;
            }
            if (value.type === 'array') {
                defaultValue = [];
            }
            if (value.enum) {
                defaultValue = value.enum[0];
            }
        }
        return defaultValue;
    };

    /**
     * container: jQuery reference to DOM object to build reference in. Should be an ul.
     * schema: The description of the features
     * addTo: A textarea to bind editing links to (optional)
     */
    var build = function(container, schema, addTo, cb) {
        var visited = [];
        var loadedRemotes = {};
        var stack = 0;
        var resolveAndIterate = function(container, key, value, prefix) {
            var url;
            var skip;
            var isVisited = function(obj) {
                for (var i=0;i<visited.length;i++) {
                    if (visited[i] == obj) {
                        return true;
                    }
                }
                visited.push(obj);
                return false;
            };
            var define = function(orig, definition) {
                for (var def in definition) {
                    if (definition.hasOwnProperty(def)) {
                        orig[def] = definition[def];
                    }
                }
            };

            if (!isVisited(value)) {
                stack++;
                if (value.$ref) {
                    // Canonical references need to go load other things...
                    if (value.$ref.match(/^http(s)?:/)) {
                        url = value.$ref.split('#');
                        skip = value.skipRender;
                        if (!loadedRemotes[url[0]]) {
                            $.ajax({
                                url: url[0],
                                success: function(data) {
                                    var section = url[1];

                                    loadedRemotes[url] = data;

                                    if (section) {
                                        define(value, data.definitions[section]);
                                    } else {
                                        define(value, data.properties);
                                    }

                                    if (!skip) {
                                        iterate(container, key, value, prefix);
                                    }
                                },
                                complete: function() {
                                    stack--;
                                    if (stack === 0) {
                                        cb(schema);
                                    }
                                }
                            });
                        } else {
                            define(value, url[1] ? loadedRemotes[url[0]].definitions[url[1]] : loadedRemotes[url[0]].properties);
                            if (!skip && !isVisited(value)) {
                                iterate(container, key, value, prefix);
                            }
                            stack--;
                        }
                    } else {
                        define(value, schema.definitions[value.$ref]);
                        iterate(container, key, value, prefix);
                        stack--;
                    }
                } else {
                    iterate(container, key, value, prefix);
                    stack--;
                }
            }
            if (stack === 0) {
                cb(schema);
            }
        };

        var iterate = function(container, key, value, prefix) {
            if (key === '') {
                for (var prop in value) {
                    if (value.hasOwnProperty(prop)) {
                        resolveAndIterate(container, prop, value[prop], prefix);
                    }
                }
                return;
            }

            if (key === '$ref' || key === 'skipRender') {
                return;
            }

            var property = $('<li></li>').addClass('refcontainer panel panel-default');
            var header = $('<div></div>').addClass('refheading panel-heading');
            var content = $('<div></div>').addClass('refcontent panel-body');
            var fullKey = getKey(key, prefix);

            header.text(fullKey);
            if (addTo) {
                var addButton = $('<button>+</button>').attr('type', 'button').addClass('refbutton btn');
                addButton.on('click', function() {
                    var locations = findCursorLocationForValueInTextarea(addTo, fullKey);
                    if (locations !== false) {
                        addTo.focus()[0].setSelectionRange(locations[0], locations[1]);
                    } else {
                        var defaultValue = getDefaultValue(value);
                        locations = addItem(addTo, fullKey, defaultValue);
                        addTo.focus()[0].setSelectionRange(locations[0], locations[1]);
                    }
                });
                header.append(addButton);
            }

            var text = [$('<p></p>').html(value.description)];
            if (value.deprecated) {
                text.unshift($('<p></p>').html('<strong>DEPRECATED</strong>'));
            }

            if (value.contact) {
                text.push($('<p></p>').html('<strong>Please contact the SMP team using the details at the top of this page if you believe you need this option.</strong>'))
            }
            if (value.type) {
                text.push($('<div></div>').text('Type: ' + value.type));
            }
            if (value.default) {
                text.push($('<div></div>').text('Default: ' + value.default));
            }
            if (value.enum) {
                text.push($('<div></div>').text('Possible values: ' + value.enum.join(', ')));
            }
            content.html(text);

            property.append(header);
            property.append(content);

            if (value.type && value.type.toLowerCase() === 'object' && value.properties) {
                var children = $('<ul></ul>').addClass('reference');
                resolveAndIterate(children, '', value.properties, fullKey);
                property.append(children);
            }
            if (value.type && value.type.toLowerCase() === 'array' && value.items && value.items.type === 'object') {
                children = $('<ul></ul>').addClass('reference');
                resolveAndIterate(children, '', value.items.properties, fullKey + '[]');
                property.append(children);
            }

            container.append(property);
        };

        resolveAndIterate(container, '', schema.properties);
    };

    return {
        build: build,
        find: findCursorLocationForValueInTextarea,
        addItem: addItem,
        getKey: getKey,
        getDefaultValue: getDefaultValue
    };
});
