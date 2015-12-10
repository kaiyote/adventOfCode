data = do require('fs').readFileSync('advent10.txt', {encoding: 'utf8'}).trim

apply = (runs) ->
  input = data
  for i in [0...runs]
    ctr = 0
    current = ''
    newData = ''
    for char in input
      if char isnt current
        newData += "#{ctr}#{current}" if current isnt ''
        [current, ctr] = [char, 1]
      else
        ctr++
    newData += "#{ctr}#{current}"
    input = newData
  input

console.log "Part 1: #{apply(40).length}", "Part 2: #{apply(50).length}"
