data = do require('fs').readFileSync('advent11.txt', {encoding: 'utf8'}).trim

String::replaceAt = (index, replacement) -> "#{@substr 0, index}#{replacement}#{@substr index + replacement.length}"

String::increment = ->
  copy = @
  if copy[copy.length - 1] is 'z'
    copy = copy.replaceAt copy.length - 1, 'a'
    copy = copy.replaceAt 0, do copy.substr(0, copy.length - 1).increment
  else
    copy = copy.replaceAt copy.length - 1, String.fromCharCode 1 + copy.charCodeAt copy.length - 1

  copy

containsTwoPairs = (input) -> !!input.match /(\w)\1.*?(\w)\2/

containsIllegalChars = (input) -> !!input.match /[iol]/

containsStraightRun = (input) ->
  for i in [0...input.length - 2] by 1
    if input.charCodeAt(i) + 1 is input.charCodeAt(i + 1) and input.charCodeAt(i) + 2 is input.charCodeAt i + 2
      return yes
  no

data = do data.increment
while not (containsTwoPairs(data) and containsStraightRun(data) and not containsIllegalChars data)
  data = do data.increment

data2 = do data.increment
while not (containsTwoPairs(data2) and containsStraightRun(data2) and not containsIllegalChars data2)
  data2 = do data2.increment

console.log data, data2
