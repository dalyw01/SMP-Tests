define(['jquery', 'base64'], function($, base64) {
    var minify = function(json) {
        return JSON.stringify(JSON.parse(json));
    };

    var getCookie = function(key) {
        var i = 0,
            cookies = document.cookie.split(';'),
            cookieValue,
            currentCookie,
            cookieName,
            parsedCookies = {};

        for (; i < cookies.length; i++) {
            currentCookie = $.trim(cookies[i]).split('=');
            cookieName = window.unescape(currentCookie.shift());
            cookieValue = window.unescape(currentCookie.join('='));
            parsedCookies[cookieName] = cookieValue;
        }
        return parsedCookies[key];
    };

    var util = {
        minify: minify,
        jsonToParam: function(string) {
            string = minify(string);
            return base64.encode(string);
        },
        paramToJson: function(string) {
            return base64.decode(string);
        },
        queryObj: function(query) {
            /** borrowed from https://github.com/bbc/responsive-web/blob/master/webapp/static-versioned/script/utils/url.js */
            var params = {},
            queryParams, i, queryParts, key;

            if (query) {
                if (query.indexOf('?') === 0) {
                    query = query.substring(1);
                }

                queryParams = query.split('&');

                for (i = 0; i < queryParams.length; i += 1) {
                    queryParts = $.map(queryParams[i].split('='), decodeURIComponent);
                    key = queryParts[0];
                    queryParts.splice(0, 1);
                    params[key] = queryParts.join('=');
                }
            }

            return params;
        },
        cookie: function(key, value) {
            if (value) {
                document.cookie = key + '=' + value + ';path=/;';
            } else {
                if (value === '') {
                    document.cookie = key + '=;path=/;expires=Thu, 01 Jan 1970 00:00:00 GMT';
                }
            }
            return getCookie(key);
        },
        setQueryParam: function(propName, propValue) {

            var query = this.queryObj(window.location.search.substr(1));

            query[propName] = propValue;

            var url = window.location.origin + window.location.pathname + '?';

            for(var prop in query) {
                url = url + encodeURIComponent(prop) + '=' + encodeURIComponent(query[prop]) + '&';
            }

            url = url.slice(0, -1);

            return url;

        },

        setQueryParams: function(props) {

            var url = window.location.origin + window.location.pathname + '?';

            url = url + util.toQueryString(props);

            url = url.slice(-1) === '?' ? url.slice(0, -1) : url;

            return url;

        },

        toQueryString: function(obj) {

            var string = '';

            for(var prop in obj) {
                string = string + encodeURIComponent(prop) + '=' + encodeURIComponent(obj[prop]) + '&';
            }

            string = string.slice(0, -1);

            return string;

        },

        convertChef: function(url, size) {
            if (url && url.replace) {
                return url.replace(/({recipe})|(\$recipe)/g, size);
            }
            return url;
        },

        addItemToLoadedItemsContainer: function(item, container, listener) {

            var thumbnailBlock  = listener ? $('<div class="switcher-item">') : $('<div class="switcher-item">');

            if(listener) {
                thumbnailBlock.on('click', listener);
            }

            thumbnailBlock.html('<img src="' + this.convertChef(item.image, '480x270') + '" alt=""/><h3>' + item.title + '</h3>');

            var features = $('<p class="tags"></p>');

            if(item.ident || (item.kind == 'ident')) {
                features.append('<span class="identTag">[IDENT]</span>');
            }

            if(item.guidance) {
                features.append('<span class="guidanceTag">[GUIDANCE]</span>');
            }

            if(item.kind == 'radioProgramme') {
                features.append('<span class="audioTag">[AUDIO]</span>');
            }

            if(item.vpid == 'p01zww19') {
                features.append('<span class="flashTag">[FLASH]</span>');
            }

            if(features.children().length > 0) {
                thumbnailBlock.append(features);
            }

            container.append(thumbnailBlock);

        },

        getMediatorID: function(item) {
            if (item.versionID) {
                return item.versionID;
            }

            if (item.serviceID) {
                return item.serviceID;
            }

            if (item.vpid) {
                return item.vpid;
            }

            return null;
        },

        setMediatorID: function(item, id) {
            if (item.versionID) {
                item.versionID = id;
            } else if (item.serviceID) {
                item.serviceID = id;
            } else {
                item.vpid = id;
            }

            return item;
        }



    };

    return util;
});
