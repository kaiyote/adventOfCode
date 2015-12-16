data = require('fs').readFileSync('advent16.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

oneTrueAunt =
  children: 3
  cats: 7
  samoyeds: 2
  pomeranians: 3
  akitas: 0
  vizslas: 0
  goldfish: 5
  trees: 3
  cars: 2
  perfumes: 1

aunts = data.map (line, index) ->
  matches = line.match /(\d+): (.+)/
  result =
    index: +matches[1]
  for match in matches[2].match(/((\w+): (\d+))/g)
    parts = match.split ': '
    result[parts[0]] = +parts[1]

  result

for aunt in aunts
  for key, value of aunt
    continue if key is 'index'
    if value isnt oneTrueAunt[key]
      aunt.fake = yes

realAunt1 = (aunts.filter (a) -> not a.fake)[0]

for aunt in aunts
  aunt.fake = no

for aunt in aunts
  for key, value of aunt
    continue if key is 'index' or key is 'fake'
    if key is 'cats' or key is 'trees'
      if value <= oneTrueAunt[key]
        aunt.fake = yes
    else if key is 'pomeranians' or key is 'goldfish'
      if value >= oneTrueAunt[key]
        aunt.fake = yes
    else
      if value isnt oneTrueAunt[key]
        aunt.fake = yes

realAunt2 = (aunts.filter (a) -> not a.fake)[0]

console.log "Part 1: #{realAunt1.index}", "Part 2: #{realAunt2.index}"
