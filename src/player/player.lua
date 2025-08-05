local Player = {}

function Player:load()
  -- current Player coordinates
  self.coordinates = {
    x = 100,
    y = 0,
  }

  -- start Player's position
  self.startCoordinates = {
    x = self.coordinates.x,
    y = self.coordinates.y,
  }

  -- Player's size
  self.size = {
    width = 32,
    height = 32,
  }

  return self
end

function Player:draw()
  love.graphics.rectangle("line", self.coordinates.x, self.coordinates.y, self.size.width, self.size.height)
end

return Player
