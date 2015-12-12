data = do require('fs').readFileSync('advent12.txt', {encoding: 'utf8'}).trim
regex = /(-?\d+?)\b/g

stripRed = (json) ->
  if Array.isArray json
    for i in [0...json.length]
      delete json[i] if stripRed json[i]
  else if typeof json is 'object'
    for own key, value of json
      if value is 'red'
        return yes
      else
        delete json[key] if stripRed value
  no

sum1 = data.match(regex).reduce (prev, curr) -> +prev + +curr

json = JSON.parse data
stripRed json
data = JSON.stringify json

sum2 = data.match(regex).reduce (prev, curr) -> +prev + +curr

console.log "Part 1: #{sum1}", "Part 2: #{sum2}"


