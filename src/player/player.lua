---Player object
local Player = {}

---Load all info about Player
---@return table Player info about Player
function Player:load()
  self.coordinates = {
    x = 100,
    y = 0,
  }

  self.startCoordinates = {
    x = self.coordinates.x,
    y = self.coordinates.y,
  }

  self.size = {
    width = 32,
    height = 32,
  }

  self.velocity = {
    x = 0,
    y = 0,
  }

  self.speed = 250

  return self
end

---Update Player's state
---@param dt number delta time
function Player:update(dt)
  self:move(dt)
end

---Move Player to different directions
---@param dt number delta time
function Player:move(dt)
  local direction = {
    x = 0, --- == 1 -> right, -1 -> left
    y = 0, --- == -1 -> up, 1 -> down
  }

  if love.keyboard.isDown("d", "right") then
    direction.x = 1
  elseif love.keyboard.isDown("a", "left") then
    direction.x = -1
  end

  if love.keyboard.isDown("w", "up") then
    direction.y = -1
  elseif love.keyboard.isDown("s", "down") then
    direction.y = 1
  end

  self.coordinates.x = self.coordinates.x + direction.x * self.speed * dt
  self.coordinates.y = self.coordinates.y + direction.y * self.speed * dt
end

---Draw Player in window
function Player:draw()
  love.graphics.rectangle("line", self.coordinates.x, self.coordinates.y, self.size.width, self.size.height)
end

return Player
