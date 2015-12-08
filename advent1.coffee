data = require('fs').readFileSync 'advent1.txt', {encoding: 'utf8'}

floor = 0
position = 0
for char, index in data
  floor += if char is '(' then 1 else if char is ')' then -1 else 0 # part 1
  position = index + 1 if position is 0 and floor is -1 # part 2

console.log "Part 1: #{floor}", "Part 2: #{position}"
