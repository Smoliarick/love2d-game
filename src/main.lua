local Player = require("player.player")
local Debug = require("debug.debug")

function love.load()
  Player:load()
  Debug:load(true)
end

function love.update(dt)
  Player:update(dt)
  Debug:log("player_coordinates", "Player coordinates: (" .. string.format("%.3f", Player.coordinates.x)
    .. ", " .. string.format("%.3f", Player.coordinates.y) .. ")")
  Debug:log("current_fps", "Current FPS: " .. tostring(love.timer.getFPS()))
  local mouse_x, mouse_y = love.mouse.getPosition()
  Debug:log("mouse_position", "Mouse position: (" .. string.format("%.0f", mouse_x)
    .. ", " .. string.format("%.0f", mouse_y) .. ")")
end

function love.draw()
  Player:draw()
  Debug:draw()
end
