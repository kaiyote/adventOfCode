data = require('fs').readFileSync('advent15.txt', {encoding: 'utf8'}).trim().split '\r\n' # stupid windoze

randomize = (ingredients) ->
  total = 100
  recipe = {}
  last = Object.keys(ingredients).length - 1
  for key, index in Object.keys ingredients
    if index is last
      recipe[key] = total
    else
      recipe[key] = Math.floor do Math.random * (total + 1)
      total -= recipe[key]
  recipe

ingredients = {}
for line in data
  regex = /(.+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/
  [_, name, cap, dur, fla, tex, cal] = line.match regex
  ingredients[name] =
    capacity: +cap
    durability: +dur
    flavor: +fla
    texture: +tex
    calories: +cal

score = no
calScore = no
recipe1 = {}
recipe2 = {}
for i in [0...10000000]
  recipeScore = {}
  recipe = randomize ingredients
  for key, value of recipe
    for key2, value2 of ingredients[key]
      recipeScore[key2] = recipeScore[key2] or 0
      recipeScore[key2] += value2 * value
  recipeScore[key] = Math.max 0, value for key, value of recipeScore

  calories = recipeScore.calories
  delete recipeScore.calories

  myScore = 1
  myScore *= value for key, value of recipeScore
  score = Math.max(score, myScore) or myScore
  calScore = Math.max(calScore, myScore) or myScore if calories is 500

console.log "Part 1: #{score}", "Part 2: #{calScore}"
