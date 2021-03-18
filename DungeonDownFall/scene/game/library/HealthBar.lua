local composer = require ("composer")
local physics = require "physics"

local healthBar = {
--scorebox
create = function (group)


physics.start()

local health = 3
local invincible = false

--health positions

local HealthFull1 = display.newImage("scene/game/img/HeartRed.png", 300,300)
HealthFull1.y = 3000
HealthFull1.x = 500

local HealthFull2 = display.newImage("Images/ame/img/HeartRed.png", 300,300)
HealthFull2.y = 3000
HealthFull2.x = 500

local HealthFull3 = display.newImage("Images/game/img/HeartRed.png", 300,300)
HealthFull3.y = 3000
HealthFull3.x = 500

local HealthEmpty1= display.newImage("Images/game/img/HeartGrey.png", 300,300)
HealthEmpty1.y = 3000
HealthEmpty1.x = 500

local HealthEmpty2 = display.newImage("Images/game/img/HeartGrey.png", 300,300)
HealthEmpty2.y = 3000
HealthEmpty2.x = 500

local HealthEmpty3 = display.newImage("Images/game/img/HeartGrey.png", 300,300)
HealthEmpty3.y = 3000
HealthEmpty3.x = 500



end

}


return HealthBar
