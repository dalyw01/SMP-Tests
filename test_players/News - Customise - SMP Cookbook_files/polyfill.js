if (!String.prototype.repeat) {
  String.prototype.repeat = function (num) {
    var str = '';
    for (var i = 0; i < num; i++) {
        str = str + this;
    }
    return str;
  };
}
if (!String.prototype.startsWith) {
  String.prototype.startsWith = function(searchString, position) {
    position = position || 0;
    return this.indexOf(searchString, position) === position;
  };
}

if (!String.prototype.trim) {
  (function(){  
    // Make sure we trim BOM and NBSP
    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
    String.prototype.trim = function () {
      return this.replace(rtrim, "");
    }
  })();
}