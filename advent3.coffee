data = do require('fs').readFileSync('advent3.txt', {encoding: 'utf8'}).trim

houses = new Set ['0,0']
doubleHouses = new Set ['0,0']
posX = 0
posY = 0
santaPosX = 0
santaPosY = 0
roboPosX = 0
roboPosY = 0

for char, index in data
  switch char
    when '>'
      posX += 1
      if index % 2 is 0 then santaPosX += 1 else roboPosX += 1
    when '<'
      posX -= 1
      if index % 2 is 0 then santaPosX -= 1 else roboPosX -= 1
    when '^'
      posY += 1
      if index % 2 is 0 then santaPosY += 1 else roboPosY += 1
    when 'v'
      posY -= 1
      if index % 2 is 0 then santaPosY -= 1 else roboPosY -= 1
  houses.add "#{posX},#{posY}" # part 1
  doubleHouses.add if index % 2 is 0 then "#{santaPosX},#{santaPosY}" else "#{roboPosX},#{roboPosY}" # part 2

console.log "Part 1: #{houses.size}", "Part 2: #{doubleHouses.size}"
