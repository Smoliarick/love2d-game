local Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y)
  local instance = setmetatable({}, Bullet)

  instance.BULLET_SPEED = 350

  instance.coordinates = {
    x = x,
    y = y,
  }

  local mouseX, mouseY = love.mouse.getPosition()
  instance.angle = math.atan2(instance.coordinates.y - mouseY, instance.coordinates.x - mouseX)

  return instance
end

function Bullet:draw()
  local opacity = 1

  love.graphics.setColor(1, 1, 1, opacity)
  love.graphics.setPointSize(3)
  love.graphics.points(self.coordinates.x, self.coordinates.y)
end

function Bullet:move(dt)
  self.coordinates.x = self.coordinates.x - math.cos(self.angle) * self.BULLET_SPEED * dt
  self.coordinates.y = self.coordinates.y - math.sin(self.angle) * self.BULLET_SPEED * dt
end

return Bullet
