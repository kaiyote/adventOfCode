crypto = require 'crypto'
key = do require('fs').readFileSync('advent4.txt', {encoding: 'utf8'}).trim

index = 0
part1 = 0
part2 = 0
while ++index
  data = key + index
  hash = crypto.createHash('md5').update(data).digest 'hex'
  part1 = index if part1 is 0 and 0 is hash.indexOf '00000'
  part2 = index if part2 is 0 and 0 is hash.indexOf '000000'
  break if part1 isnt 0 and part2 isnt 0

console.log "Part 1: #{part1}", "Part 2: #{part2}"
