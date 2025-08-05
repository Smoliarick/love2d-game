local Debug = {}

---Load Debugger
---@param showDebugInfo boolean show or not debug info
function Debug:load(showDebugInfo)
  self.showDebugInfo = showDebugInfo
  self.debugInfo = {}
end

---Add log message to Debug object
---@param name string unique identificator for message
---@param message string debug message
function Debug:log(name, message)
  if not self.showDebugInfo then return end

  local info = {
    name = name,
    message = message,
  }

  for _, value in ipairs(self.debugInfo) do
    if value.name == name then
      value.message = message
      return
    end
  end

  table.insert(self.debugInfo, info)
end

---Draw Debug info in Window
function Debug:draw()
  if not self.showDebugInfo then return end

  for index, info in ipairs(self.debugInfo) do
    love.graphics.print(info.message, 10, 10 + index * 20)
  end
end

return Debug
