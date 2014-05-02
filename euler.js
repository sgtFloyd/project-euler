var _ = require('underscore'),
    fs = require('fs');

exports.dataFile = function(file, callback) {
  fs.readFile(file, function(err, data){
    if (err) throw err;
    if (typeof callback === 'function')
      callback(data);
  });
}

_(global).extend(exports);
