var _ = require('underscore'),
    fs = require('fs');

if(typeof(String.prototype.trim) === "undefined") {
  String.prototype.trim = function(){
    return String(this).replace(/^\s+|\s+$/g, '');
  };
}

exports.dataFile = function(file, callback) {
  fs.readFile(file, function(err, data){
    if (err) throw err;
    if (typeof callback === 'function')
      callback(data);
  });
}

exports._ = _;
_(global).extend(exports);
