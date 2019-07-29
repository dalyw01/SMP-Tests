define(function() {
    var data = {};

    function getData(type, cb) {
        if (!data[type]) {
            $.ajax({
                url: '/conf/' + type + '.json',
                dataType: 'json',
                success: function(content) {
                    data[type] = content;
                    cb(data[type]);
                },
                error: function(jqxhr, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        } else {
            cb(data[type]);
        }
    }

    return {
        schema: getData
    };
});
