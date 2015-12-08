input = require('fs').readFileSync('advent7.txt', {encoding: 'utf8'}).trim().split /\r\n/ # silly windoze

regex = /(?:([a-z0-9]+)? )?(?:(AND|OR|LSHIFT|RSHIFT|NOT)? )?(\w+) -> (\w+)/

findA = (data, values) ->
  while data.length
    for i in [data.length - 1..0] by -1
      cmd = regex.exec data[i]

      if (values.hasOwnProperty(cmd[4]) and cmd[4] isnt 'b') or
      (not /\d+/.test(cmd[3]) and not values.hasOwnProperty cmd[3]) or
      (cmd[1] and not /\d+/.test(cmd[1]) and not values.hasOwnProperty cmd[1])
        continue

      val1 = values[cmd[1]] or +cmd[1]
      val2 = values[cmd[3]] or +cmd[3]

      switch cmd[2]
        when 'AND' then val = val1 & val2
        when 'OR' then val = val1 | val2
        when 'RSHIFT' then val = val1 >> val2
        when 'LSHIFT' then val = val1 << val2
        when 'NOT' then val = ~val2
        else val = val2

      values[cmd[4]] = val
      data.splice i, 1
  values.a

a = findA do input.slice, {}
console.log "Part 1: #{a}", "Part 2: #{findA do input.slice, {b: a}}"
