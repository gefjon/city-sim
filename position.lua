local function Position (x, y)
  local pos = { x = x, y = y }

  function pos:offset(x, y)
    if (type(x) == 'table') then
      y = x.y
      x = x.x
    end
    return Position(self.x + x, self.y + y)
  end

  function pos:offset_in_place(x, y)
    self.x += x
    self.y += y
  end

  function pos:print_self()
    print("Do something")
  end

  return pos
end

return Position
