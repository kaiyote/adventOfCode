data = require('fs').readFileSync('advent13.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

shuffle = (array) ->
  out = []
  while array.length
    index = Math.floor do Math.random * array.length
    out.push array.splice(index, 1)[0]
  out

routes = data.reduce (mem, line) ->
  line = line.replace('gain ', '').replace('lose ', '-').replace '.', ''
  [from, other] = line.split ' would '
  [units, to] = other.split ' happiness units by sitting next to '
  mem[from] = mem[from] or {}
  mem.me = mem.me or {}
  mem[from][to] = +units
  mem.me[from] = 0
  mem[from].me = 0
  mem
, {}

people = Object.keys(routes).filter (item) -> item isnt 'me'
allPeople = Object.keys routes
max = no
maxAll = no

for i in [0...100000]
  people = shuffle people
  allPeople = shuffle allPeople

  len = 0
  for p in [0...people.length] by 1
    from = people[p]
    to = people[p + 1] or people[0]

    len += routes[from][to]
    len += routes[to][from]

  lenAll = 0
  for p in [0...allPeople.length] by 1
    from = allPeople[p]
    to = allPeople[p + 1] or allPeople[0]

    lenAll += routes[from][to]
    lenAll += routes[to][from]

  max = Math.max(max, len) or len
  maxAll = Math.max(maxAll, lenAll) or lenAll

console.log "Part 1: #{max}", "Part 2: #{maxAll}"
