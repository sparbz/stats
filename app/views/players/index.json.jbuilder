json.array!(@players) do |player|
  json.extract! player, :name, :position, :fg, :ft, :tpm, :reb, :ast, :stl, :blk, :pts
  json.url player_url(player, format: :json)
end
