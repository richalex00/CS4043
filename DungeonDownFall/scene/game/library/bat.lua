local BatTable = {}
local last_bat_number = nil
local  function create(group)
  local newBat = display.newImageRect( group , "scene/game/map/greenbat.png", 800, 800)

  table.insert( BatTable, newBat )
  physics.addBody( newBat, "",{ isSensor=true,radius= 40} )
  newBat.myName = "Bat"

  local batFinish = math.random(7000)+1000

  --have to organise where spikes start and go
  local max_sections = 4
  local randomNum = math.random(max_sections)

  -- See if we rolled the same position as the last platform.
  if randomNum == last_bat_number then
    -- If the last position was the maximum positions, we loop back to 1.
    -- Otherwise, it just increments to avoid having the same position as the last platform.
    randomNum = (last_bat_number == max_sections) and 1 or (last_bat_number + 1)
  end

  -- Save the last used position's random number for later checking
  last_bat_number = randomNum

   if ( randomNum == 1 ) then

            newBat.x =  -1700
            newBat.y =  3580 --7000
  transition.to(newBat,{x=9000,y=batFinish,time=8000})

  elseif (randomNum == 2) then
    newBat.x = 5800
    newBat.y = 3580 --7000
  transition.to(newBat,{x=-4000,y=batFinish,time=8000})

  elseif (randomNum == 3) then
    newBat.x = 5800
    newBat.y = 7000
  transition.to(newBat,{x=-4000,y=batFinish,time=8000})

  elseif ( randomNum == 4 ) then

           newBat.x =  -1700
           newBat.y =  7000
  transition.to(newBat,{x=9000,y=batFinish,time=8000})

  end
  end



local bat = {
gameLoop =
function (group)
  if (group ~= nil ) then
  create(group)
--have to set it so the spikes are removed base on x not y
  for i = #BatTable, 1, -1 do
    local thisBat = BatTable[i]

       if ( thisBat.x > 5800 or thisBat.x < -1700)
       then
           display.remove( thisBat )
           table.remove( BatTable, i )
end
end
end
end
}


return bat
