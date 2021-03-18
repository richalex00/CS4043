local composer = require ("composer")


--walls
local designs = {
    create = function (group)
        --leftwall
local wall = display.newImageRect(group, "scene/game/map/wall.png", 2000,8000)
wall.x = -2150
wall.y = 4000


--righttWall
local wall1 = display.newImageRect(group,"scene/game/map/wall.png", 2000,8000)
wall1.x = 6150
wall1.y = 4000


--torches
--Left torches
local torch1 = display.newImageRect(group,"scene/game/map/torch.png", 1000,1000)
torch1.x = -1800
torch1.y = 1500

local torch2 = display.newImageRect(group,"scene/game/map/torch.png", 1000,1000)
torch2.x = -1800
torch2.y = 5500


--Right torches
local torch1 = display.newImageRect(group,"scene/game/map/torch.png", 1000,1000)
torch1.x = 5830
torch1.y = 1500

local torch2 = display.newImageRect(group,"scene/game/map/torch.png", 1000,1000)
torch2.x = 5830
torch2.y = 5500




-- holeInWall


--Left holes
local hole1 = display.newImageRect(group,"scene/game/map/blackhole.png", 1000,1000)
hole1.x = -1800
hole1.y = 3500

local hole2 = display.newImageRect(group,"scene/game/map/blackhole.png", 1000,1000)
hole2.x = -1800
hole2.y = 7000


--Right holes
local hole3 = display.newImageRect(group,"scene/game/map/blackhole.png", 1000,1000)
hole3.x = 5830
hole3.y = 3500

local hole4 = display.newImageRect(group,"scene/game/map/blackhole.png", 1000,1000)
hole4.x = 5830
hole4.y = 7000

--blackbackgrounds


local black1 = display.newImageRect(group, "scene/game/map/blackbackground.jpg", 2000,8000)
 black1.x = -4100
 black1.y = 4000


local black2 = display.newImageRect(group,"scene/game/map/blackbackground.jpg", 2000,8000)
 black2.x = 8100
 black2.y = 4000





    end
}
return designs
