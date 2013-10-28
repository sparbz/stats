players = []
File.open("data1.csv").read.split("\r").each do |line|
  name, pos, fg, ft, tpm, reb, ast, stl, blk, pts = line.split(",")
  player = [name, pos, fg, ft, tpm, reb, ast, stl, blk, pts]
  players.push(player)
end

players.each do |name, pos, fg, ft, tpm, reb, ast, stl, blk, pts|
  Player.create( name: name, position: pos, fg: fg, ft: ft, tpm: tpm,
  	             reb: reb, ast: ast, stl: stl, blk: blk, pts: pts )
end