SpriteNames = require('sprite_names')
Position = require('position')
DrawTile = require('draw_tile')
Crsr = require('cursor')

function _init()
  crsr = Crsr()
end

function _update()
  crsr:update()
end

function _draw()
  cls()
  DrawTile(SpriteNames.roof.top_left, 0, 0)
  DrawTile(SpriteNames.roof.top_right, 1, 0)
  DrawTile(SpriteNames.roof.bottom_left, 0, 1)
  DrawTile(SpriteNames.roof.bottom_right, 1, 1)
  for y=2,4 do
    for x=0,1 do
      DrawTile(SpriteNames.wall.small_windows, x, y)
    end
  end
  crsr:draw()
end
