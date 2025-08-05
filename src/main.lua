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
  local mouseX, mouseY = love.mouse.getPosition()
  Debug:log("mouse_position", "Mouse position: (" .. string.format("%.0f", mouseX)
    .. ", " .. string.format("%.0f", mouseY) .. ")")
  Debug:log("bullets", "Num of bullets: " .. tostring(#Player.bullets))
end

function love.draw()
  Player:draw()
  Debug:draw()
end

-- KEY BINGINGS --
function love.mousepressed(_x, _y, button, _istouch, _presses)
  if button == 1 then
    Player:shoot()
  end
end
