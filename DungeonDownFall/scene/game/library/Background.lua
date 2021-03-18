local composer = require ("composer")
local scrollSpeed = -34.5
-- rock background
local background = {
create = function (group)
local endlocal _W = display.contentWidth
local _H = display.contentHeight



 bg1 = display.newImageRect(group, "scene/game/map/RockBG.png", 8000,4000)
bg1.x = _W*0.5; bg1.y = _H*1.5;

-- Add Second Background
 bg2 = display.newImageRect(group, "scene/game/map/RockBG.png", 8000,4000)
bg2.x = _W*0.5; bg2.y = bg1.y-4000;

-- Add Third Background
 bg3 = display.newImageRect(group,"scene/game/map/RockBG.png", 8000,4000)
bg3.x = _W*0.5; bg3.y = bg2.y-4000;
--add fourth background
 bg4 = display.newImageRect(group, "scene/game/map/RockBG.png", 8000,4000)
bg4.x = _W*0.5; bg4.y = bg3.y-4000;
end,
move = function (event)
  print("asdasdzxczxc")
  if (bg1.y ~= nil  and bg2.y ~= nil and bg3.y ~= nil and bg4.y ~= nil) then
    bg1.y = bg1.y + scrollSpeed
    bg2.y = bg2.y + scrollSpeed
    bg3.y = bg3.y + scrollSpeed
    bg4.y = bg4.y + scrollSpeed
    if(bg1.y + bg1.contentWidth)  < 2000 then
      bg1:translate(0, 16000)
    end
    
    if(bg2.y + bg2.contentWidth) < 2000 then
      bg2:translate(0,16000)
    end
    
    if(bg3.y + bg3.contentWidth) < 2000 then
     bg3:translate(0, 16000)
    end
    
    if(bg4.y + bg4.contentWidth) < 2000 then
     bg4:translate(0, 16000)
       end
      end
    
end

}

  
return background
