// In the 5 by 5 matrix below, the minimal path sum from the
// top left to the bottom right, by only moving to the right
// and down, is indicated by asterix and is equal to 2427.
//
//       *131*   673    234    103    18
//       *201*  *96 *  *342*   965    150
//        630    803   *746*  *422*   111
//        537    699    497   *121*   956
//        805    732    524   *37 *  *331*
//
// Find the minimal path sum, in data/81.txt, a 31K text file
// containing a 80 by 80 matrix, from the top left to the bottom
// right by only moving right and down.

require('./euler');

var processData = function(data){
  var rows = data.toString().trim().split("\n");
  return _.map(rows, function(row){
    return _.map(row.split(','), function(col){
      return parseInt(col);
    })
  })
}

var _shortestPath = {};
var shortestPath = function(x, y, grid){
  if( _([x, y]).contains(grid.length) ) return; // stay within grid bounds
  _shortestPath[[x, y]] = _shortestPath[[x, y]] ||
    grid[x][y] + _.chain([
      shortestPath(x+1, y, grid),
      shortestPath(x, y+1, grid)
    ]).compact().min().value();
  return _shortestPath[[x, y]];
}

dataFile('data/81.txt', function(data) {
  var grid = processData(data);
  _shortestPath[[79,79]] = grid[79][79];
  console.log(shortestPath(0,0,grid));
});

// => 427337
// real   0m0.131s
// user   0m0.119s
// sys    0m0.011s
