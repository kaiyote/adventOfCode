data = require('fs').readFileSync('advent9.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

shuffle = (array) ->
  out = []
  while array.length
    index = Math.floor do Math.random * array.length
    out.push array.splice(index, 1)[0]
  out

routes = data.reduce (mem, line) ->
  [path, dist] = line.split ' = '
  [from, to] = path.split ' to '
  mem[from] = mem[from] or {}
  mem[to] = mem[to] or {}
  mem[from][to] = +dist
  mem[to][from] = +dist

  mem
, {}

locs = Object.keys routes
max = no
min = no

for i in [0...100000]
  locs = shuffle locs

  len = 0
  for l in [0...locs.length - 1] by 1
    from = locs[l]
    to = locs[l + 1]

    len += routes[from][to]

  max = Math.max(max, len) or len
  min = Math.min(min, len) or len

console.log "Part 1: #{min}", "Part 2: #{max}"
