Buttons = require('buttons')
Position = require('position')
SpriteNames = require('sprite_names')
DrawTile = require('draw_tile')

local CURSOR_SIZE_SMALL = 0
local CURSOR_SIZE_LARGE = 1
local CURSOR_ANIMATION_LENGTH = 30

local function Crsr ()
  local crsr = {
    pos = Position(0, 0),
    size = CURSOR_SIZE_SMALL,
    frame_count = 0,
  }

  function crsr:sprite_offset()
    return (flr(self.frame_count / CURSOR_ANIMATION_LENGTH) + 1)
  end

  function crsr:draw_small()
    DrawTile(
      SpriteNames.ui.cursor_small[self:sprite_offset()],
      self.pos.x,
      self.pos.y
    )
  end

  function crsr:draw_large()
    local x = self.pos.x
    local y = self.pos.y
    sprite = SpriteNames.ui.cursor_corner[self:sprite_offset()]
    DrawTile(sprite, x, y)
    DrawTile(sprite, x + 1, y, true)
    DrawTile(sprite, x, y + 1, false, true)
    DrawTile(sprite, x + 1, y + 1, true, true)
  end
    
  function crsr:draw()
    if (self.size == CURSOR_SIZE_SMALL) then
      self:draw_small()
    else
      self:draw_large()
    end
  end

  function crsr:move()
    local adjust = Position(0, 0)
    if btnp(Buttons.left) then
      adjust:offset_in_place(-1, 0)
    end
    if btnp(Buttons.right) then
      adjust:offset_in_place(1, 0)
    end
    if btnp(Buttons.up) then
      adjust:offset_in_place(0, -1)
    end
    if btnp(Buttons.down) then
      adjust:offset_in_place(0, 1)
    end
    self.pos = self.pos:offset(adjust)
  end

  function crsr:change_size()
    if btnp(Buttons.b) then
      if (self.size == CURSOR_SIZE_LARGE) then
        self.size = CURSOR_SIZE_SMALL
      else
        self.size = CURSOR_SIZE_LARGE
      end
    end
  end
  
  function crsr:update()
    self:change_size()
    self:move()
    self.frame_count += 1
    if (self.frame_count >= (CURSOR_ANIMATION_LENGTH * 2)) then
      self.frame_count = 0
    end
  end
  
  return crsr
end

return Crsr
