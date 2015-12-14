data = require('fs').readFileSync('advent14.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

reindeer = {}
for line in data
  regex = /(\w+?)\b.+?(\d+)\b.+?(\d+)\b.+?(\d+)\b/
  [_, name, speed, duration, rest] = line.match regex
  reindeer[name] =
    speed: +speed
    duration: +duration
    rest: +rest
    travelled: 0
    left: +duration
    flying: yes

console.log reindeer

for own key, value of reindeer
  i = 0
  while i < 2503
    reindeer[key].travelled += value.duration * value.speed
    i += value.duration + value.rest

console.log reindeer
