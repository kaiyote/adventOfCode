data = require('fs').readFileSync('advent6.txt', {encoding: 'utf8'}).trim().split /\r\n/ # silly windoze

lights1 = []
lights2 = []
for i in [0...1000]
  lights1[i] = []
  lights2[i] = []

for line in data
  cmd = /.*?(on|off|toggle).*?(\d+),(\d+).*?(\d+),(\d+)/.exec line
  On = cmd[1] is 'on'
  toggle = cmd[1] is 'toggle'
  numbers = [+cmd[2], +cmd[3], +cmd[4], +cmd[5]]
  for i in [numbers[0]..numbers[2]]
    for j in [numbers[1]..numbers[3]]
      lights1[i][j] = if toggle then (if lights1[i][j] then 0 else 1) else if On then 1 else 0

      if not lights2[i][j] then lights2[i][j] = 0
      lights2[i][j] += if toggle then 2 else if On then 1 else -1
      if lights2[i][j] < 0 then lights2[i][j] = 0

ctr1 = 0
ctr2 = 0
for i in [0...1000]
  for j in [0...1000]
    ctr1 += lights1[i][j] or 0
    ctr2 += lights2[i][j] or 0

console.log ctr1, ctr2
