"use strict";

/** @lint */

/**
 *  @module orb/promo/footer
 *  @requires orbController/lib/_$
 *  @example
 *        require(['orb/async/_footerpromo'], function (promo) {
 *            promo.load({
 *                url: thaturl,
 *                node: thatdiv,
 *                onSuccess: function(){},
 *                onError: function(){},
 *                onAlways: function(){}
 *            });
 *       });
 */
define('orb/async/_footerpromo', ['orb/lib/_$', 'istats-1', 'orb/cookies'], function ($, istats, bbccookies) {
  'use strict';

  var LOAD_TIMEOUT = 60000; // ms

  /**
   *  @desc Handles the insertion of the CSS and HTML.
   *  @param {HTMLElement} node
   *  @param {string} css
   *  @param {string} html
   *  @returns {boolean}  Indicates whether CSS and HTML were added.
   **/

  var insertPromo = function insertPromo(node, css, html) {
    return $.addCSS(css) && $.addHTML(node, html);
  };

  var makeUrl = function makeUrl(baseUrl, pageProperties, win) {
    var loc = win ? win.location : window.location,
        proto = loc.protocol;
    var params = Object.keys(pageProperties).filter(function (m) {
      return pageProperties[m];
    }).map(function (m) {
      return "".concat(m, "=").concat(pageProperties[m]);
    }).join('&');
    var url = baseUrl + '/card?' + params;

    if (proto.match(/s:/i)) {
      url = url.replace('http://www.', 'https://ssl.');
    }

    return url;
  };

  var exports = {
    init: function init(baseUrl, variant) {
      var _this = this;

      var properties = {
        istats: istats.getSite(),
        section: bbcpage.getSection(),
        producer: bbcpage.getProducer(),
        destination: bbcpage.getDestination(),
        page: bbcpage.getName(),
        variant: variant
      };
      var keys = Object.keys(properties);
      var promises = keys.map(function (key) {
        return properties[key];
      });
      Promise.all(promises).then(function (properties) {
        var pageProperties = {};
        properties.forEach(function (site, i) {
          pageProperties[keys[i]] = site;
        });

        _this.loadPromo(pageProperties, baseUrl);
      }).catch(function () {
        _this.loadPromo({
          variant: variant
        }, baseUrl);
      });
    },
    loadPromo: function loadPromo(pageProperties, baseUrl) {
      var url = makeUrl(baseUrl, pageProperties, window);
      var node = document.getElementById('navp-orb-footer-promo');
      this.load(url, {
        onSuccess: function onSuccess(e) {
          if (insertPromo(node, e.style, e.html)) {
            node.parentNode.className = node.parentNode.className + ' orb-footer-promo-loaded';

            require(['require', e.jsPath], function (require, navpromo) {
              require(['require', 'navpromo-slider'], function (require, navpromo) {
                navpromo.load(document.querySelectorAll('.navp-container'), e.istatsVariables);
              });
            });
          }
        },
        onError: function onError() {
          istats.log('error', 'orb-footer-promo-failed');
          var failureCount = parseInt(bbccookies.get('ckns_nav_promofail')) || 0;
          failureCount++;
          bbccookies.set('ckns_nav_promofail=' + failureCount + '; expires=' + new Date(new Date().getTime() + 1000 * 60 * 10).toGMTString() + ';path=/;');
        }
      });
    },

    /**
     *  @param {object} opts
     *  @param {string} opts.url
     *  @param {function} [opts.onSuccess] Fired when the promo feed returns a successful response.
     *  @param {function} [opts.onError] Fired when the promo feed fails to return a successful response.
     *  @param {function} [opts.onAlways] Fired when the request to the promo feed returns anything or when it times out.
     */
    load: function load(url, opts) {
      var onSuccess = opts.onSuccess || function () {},
          onError = opts.onError || function () {},
          onAlways = opts.onAlways || function () {},
          jsonpCallback,
          jsonpOptions;

      jsonpCallback = function jsonpCallback(response) {
        if (response) {
          if (response.status === 'none') {
            bbccookies.del('ckns_nav_promofail');
          } else if (response.status === 'success') {
            onSuccess(response);
            bbccookies.del('ckns_nav_promofail');
          } else {
            onError();
          }
        } else {
          onError();
        }

        onAlways();
      };

      jsonpOptions = {
        timeout: LOAD_TIMEOUT,
        // ms
        error: function error() {
          onError();
          onAlways();
        },
        callbackName: 'navpromo'
      };
      $.script.jsonp(url, jsonpCallback, jsonpOptions);
    }
  };
  return exports;
});
define("_footerpromo", function () {});