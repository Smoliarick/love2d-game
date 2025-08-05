local Bullet = require("player.bullet")

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

  self.velocity = 0
  self.maxSpeed = 250
  self.acceleration = 4000
  self.friction = 3500

  self.bullets = {}
  self.MAX_BULLETS = 10

  return self
end

---Update Player's state
---@param dt number delta time
function Player:update(dt)
  self:movePlayer(dt)
  self:moveBullet(dt)
end

---Move Player to different directions
---@param dt number delta time
function Player:movePlayer(dt)
  -- move player
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

  self.velocity = math.min(self.velocity + self.acceleration * dt, self.maxSpeed)

  if self.velocity > 0 then
    self.velocity = math.max(self.velocity - self.friction * dt, 0)
  end

  self.coordinates.x = self.coordinates.x + direction.x * self.velocity * dt
  self.coordinates.x = math.max(0, self.coordinates.x)
  self.coordinates.x = math.min(self.coordinates.x, love.graphics.getWidth() - self.size.width)

  self.coordinates.y = self.coordinates.y + direction.y * self.velocity * dt
  self.coordinates.y = math.max(0, self.coordinates.y)
  self.coordinates.y = math.min(self.coordinates.y, love.graphics.getHeight() - self.size.height)
end

---Move Bullet after shooting
---@param dt number delta time
function Player:moveBullet(dt)
  for index, bullet in ipairs(self.bullets) do
    bullet:move(dt)

    -- destroy bullet flow
    if (bullet.coordinates.x <= 0 or bullet.coordinates.x >= love.graphics.getWidth()
          or bullet.coordinates.y <= 0 or bullet.coordinates.y >= love.graphics.getHeight()) then
      self:destroyBullet(index)
    end
  end
end

---Shoot bullet
function Player:shoot()
  if (#self.bullets < self.MAX_BULLETS) then
    -- bullet spawns from the center of the player
    table.insert(self.bullets,
      Bullet.new(self.coordinates.x + self.size.width / 2, self.coordinates.y + self.size.height / 2))
  end
end

---Destroy bullet
---TODO: will change this flow after creating enemies and adding physics
---@param index integer
function Player:destroyBullet(index)
  table.remove(self.bullets, index)
end

---Draw Player in window
function Player:draw()
  love.graphics.rectangle("line", self.coordinates.x, self.coordinates.y, self.size.width, self.size.height)

  -- draw bullets
  for _, bullet in ipairs(self.bullets) do
    bullet:draw()
  end
end

return Player
