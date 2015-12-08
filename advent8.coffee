input = require('fs').readFileSync('advent8.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

total1 = 0
total2 = 0
for line in input
  total1 += line.length - eval(line).length
  total2 += JSON.stringify(line).length - line.length

console.log "Part 1: #{total1}", "Part 2: #{total2}"
