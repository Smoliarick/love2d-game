local Player = require("player.player")

function love.load()
  Player:load()
end

function love.update(dt)
  Player:update(dt)
end

function love.draw()
  Player:draw()
end
