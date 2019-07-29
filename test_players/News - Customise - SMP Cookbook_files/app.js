var environment;
try { environment = sessionStorage.getItem('smpCookbookEnvironment'); } catch (e) {}
var environmentQuery = /\?(?:.+&)?environment=([^&#]+)/.exec(window.location.href);
if (environmentQuery) {
    if (environmentQuery[1] === 'live') {
        environment = '';
    } else if (environmentQuery[1] === 'int') {
        environment = 'int.tools.';
    } else {
        environment = environmentQuery[1] + '.';
    }
}

var bumpVersion;
try { bumpVersion = sessionStorage.getItem('smpCookbookBumpVersion'); } catch (e) {}
var bumpVersionQuery = /\?(?:.+&)?bumpVersion=([^&#]+)/.exec(window.location.href);
var bumpDebug="";
if (bumpVersionQuery) {
    if (bumpVersionQuery[1] === '4.debug') {
        bumpVersion = 4;
        bumpDebug=".debug";
    } else {
        if (bumpVersionQuery[1] === '4') {
            bumpVersion = '4';
        } else {
            bumpVersion = '3';
        }
    }
}

var domain = 'bbci.co.uk';
if (environment === 'int.tools.') {
    domain = 'bbc.co.uk';
}


// NB:
// bump-3 path could be both bump-3 and bump-4 (so we can switch inside the recipe)
// bump-4 path is always bump-4, we need it on the mixedBump page
// and yes... this should be done better!

var bumpVersionWithDebug = '';

if (bumpVersion === 4) {
    bumpVersionWithDebug = bumpVersion+bumpDebug;
} else {
    bumpVersionWithDebug = bumpVersion;
}

require({
    baseUrl: '/js',
    paths: {
        'jquery': '/jq/jquery.min',
        'jquery-1.9': '//static.bbc.co.uk/frameworks/jquery/0.3.0/sharedmodules/jquery-1.9.1',
        'jquery-textcomplete': '/tc/jquery.textcomplete.min',
        'swfobject-2': '//static.bbc.co.uk/frameworks/swfobject/0.1.10/sharedmodules/swfobject-2',
        'bump-3': ( '//emp.' + (environment || '') + domain + '/emp/bump-'+ (bumpVersion || 3) + '/bump-'+(bumpVersionWithDebug || 3) ),
        'bump-4': ( '//emp.' + (environment || '') + domain + '/emp/bump-4/bump-4'),
        'moment': '/m/moment.min'
    }
});



require(['jquery', 'util'], function($, util) {
    // Share button
    $('.recipe-share').on('click', function() {
        var button = this;
        $(button).addClass('disabled').off('click');
        button.textContent = 'Generating short URL...';
        require(['short'], function(short) {
            short(window.location.href, function(url) {
                if (!url) {
                    button.textContent = 'Error shortening URL';
                } else {
                    var urlInput = document.createElement('input');
                    urlInput.value = url;
                    button.textContent = 'Share ';
                    button.appendChild(urlInput);
                    $(button).removeClass('disabled').on('click', function() {
                        urlInput.select();
                        document.execCommand('copy');
                    });
                }
            });
        });
    });

    // Settings menu
    var query = util.queryObj(window.location.search.substr(1));

    // Player
    var player = util.cookie('bbcBumpForcePlayer') || '';
    $('.settings-player input[value="' + player + '"]').attr('checked', 'checked').parent().addClass('active');
    $('.settings-player input').on('change', function() {
        util.cookie('bbcBumpForcePlayer', this.value);
        window.location.reload();
    });
    if (query.player) {
        $('.settings-player').append('<br>This page locks the player to ' + query.player + '.');
        $('.settings-player input').attr('disabled', 'disabled');
        // Set the cookie, then clear it on navigate away
        // Maybe this should actually reset when the player is initialised?
        document.cookie = "bbcBumpForcePlayer=" + query.player + ";path=/";
        window.onbeforeunload = function() {
            document.cookie = "bbcBumpForcePlayer=" + player + ";path=/";
        }
    }

    // Environment
    var environment = '';
    try { environment = sessionStorage.getItem('smpCookbookEnvironment') || ''; } catch (e) {}
    $('.settings-environment input[value="' + environment + '"]').attr('checked', 'checked').parent().addClass('active');
    $('.settings-environment input').on('change', function() {
            try {
                sessionStorage.setItem('smpCookbookEnvironment', this.value);
                window.location.reload();
            } catch (e) {
                alert('session storage is required, use query string');
            }

    });
    if (environmentQuery) {
        $('.settings-environment').append('<br>This page locks the environment to ' + environmentQuery[1] + '.');
        $('.settings-environment input').attr('disabled', 'disabled');
    }

    // BUMP version
var bumpVersion = 3;
try {
    var bumpVersion = sessionStorage.getItem('smpCookbookBumpVersion') || 3;
} catch (e) {}
    $('.settings-bump input[value="' + bumpVersion + '"]').attr('checked', 'checked').parent().addClass('active');
    $('.settings-bump input').on('change', function() {
            try {
                sessionStorage.setItem('smpCookbookBumpVersion', this.value);
                window.location.reload();
            } catch (e) {
                alert('session storage is required, use query string');
            }
    });
    if (bumpVersionQuery) {
        $('.settings-bump').append('<br>This page locks the bump version to ' + bumpVersionQuery[1] + '.');
        $('.settings-bump input').attr('disabled', 'disabled');
    }

});
