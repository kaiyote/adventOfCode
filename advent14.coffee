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
    score: 0

for own key, value of reindeer
  i = 0
  while i < 2503
    value.travelled += value.duration * value.speed
    i += value.duration + value.rest

distances = Object.keys(reindeer).map (deer) -> reindeer[deer].travelled
part1 = Math.max distances...

for i in [0...2503]
  for own key, value of reindeer
    value.travelled += value.speed if i % (value.duration + value.rest) < value.duration
  distances = Object.keys(reindeer).map (deer) -> reindeer[deer].travelled
  winner = Math.max distances...

  for own key, value of reindeer
    value.score++ if value.travelled is winner

scores = Object.keys(reindeer).map (deer) -> reindeer[deer].score
part2 = Math.max scores...

console.log "Part 1: #{part1}", "Part 2: #{part2}"
