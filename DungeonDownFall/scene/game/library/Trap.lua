
local composer = require ("composer")

local physics = require "physics"


local trap = {
    create = function(mainGroup)
        local trap = display.newImageRect(mainGroup, "scene/game/map/spike.png", 6600,1300)
        trap.myName = "trap"
        trap.x = 1950
        trap.y = 300
        physics.addBody(trap, "static",{isSensor=false, } )
    end
}
return trap
