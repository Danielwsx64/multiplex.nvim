local notify = require("multiplex.notify")
local directions = require("multiplex.directions")
local nvim = require("multiplex.wrapper.nvim")
local execute = require("multiplex.execute")

local Self = {}

function Self.to(direction)
  if not directions.is_valid(direction) then
    notify.err("Invalid direction " .. direction)
    return false
  end

  if not nvim.move_to(direction) then
    return execute.call("move_to", { direction })
  end
end

return Self
