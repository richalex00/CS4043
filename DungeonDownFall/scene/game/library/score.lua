-- Initialize variables
local composer = require ("composer")


local physics = require "physics"
physics.start()
scoreValue = 0

local M = {}
local score = {
--scorebox
create = function (group)

local endlocal scoreBox = display.newImageRect( group,"scene/game/map/scoreBox.png", 1600, 800)
scoreBox.x = -1820
scoreBox.y = 500

--score
_G.alive = 1

scoreText = display.newText( group, scoreValue .."m", -1800, 500, native.systemFont, 300)
scoreText:setFillColor( 1, 3, 0 )
end,
calculateScore = function (event)
    scoreValue = scoreValue + 5
    scoreText.text =  scoreValue .. "m"
end
}


return score
