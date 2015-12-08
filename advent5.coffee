data = require('fs').readFileSync('advent5.txt', {encoding: 'utf8'}).trim().split /\r\n/ # silly windoze

hasBadString = (input) ->
  for s in ['ab', 'cd', 'pq', 'xy']
    return yes if -1 isnt input.indexOf s
  no

hasThreeVowels = (input) ->
  vowels = ['a','e','i','o','u']
  seen = []
  for char in input
    if char in vowels
      seen.push char
      return yes if seen.length >= 3
  no

hasDoubleLetter = (input) ->
  for char, index in input
    if char is input[index + 1]
      return yes
  no

hasDoublePair = (input) ->
  for char, index in input
    if index + 1 < input.lastIndexOf char + input[index + 1]
      return yes
  no

hasEyePair = (input) ->
  for char, index in input
    if char isnt input[index + 1] and char is input[index + 2]
      return yes
  no

nice1 = 0
nice2 = 0
for s in data
  nice1++ if not hasBadString(s) and hasThreeVowels(s) and hasDoubleLetter s
  nice2++ if hasDoublePair(s) and hasEyePair s

console.log "Part 1: #{nice1}", "Part 2: #{nice2}"
