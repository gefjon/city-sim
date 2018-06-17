local function DrawTile(tile, x, y, flip_x, flip_y)
  flip_x = flip_x or false
  flip_y = flip_y or false
  spr(tile, x * 8, y * 8, 1, 1, flip_x, flip_y)
end

return DrawTile
