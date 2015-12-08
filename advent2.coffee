data = require('fs').readFileSync('advent2.txt', {encoding: 'utf8'}).trim().split /\r\n/ # silly windoze

area = 0
length = 0
for line in data
  dim = line.split('x').sort (x, y) -> x - y
  area += 2 * dim[0] * dim[1] + 2 * dim[1] * dim[2] + 2 * dim[2] * dim[0] + dim[0] * dim[1] # part 1
  length += 2 * dim[0] + 2 * dim[1] + dim[0] * dim[1] * dim[2] # part 2

console.log "Part 1: #{area}", "Part 2: #{length}"
