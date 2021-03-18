
local composer = require("composer")
local physics = require "physics"



--loading spritesheet:
local sheetOptions =
{
    width = 426,
    height = 620,
    numFrames = 5
}
local sheetHero = graphics.newImageSheet( "scene/game/map/sprite.png", sheetOptions )
local sequenceData = {
		{ name = "idle", frames = { 1 } },
		{ name = "walkLeft", frames = { 2 }},
    { name = "walkRight", frames = {3}},
	}

  local hero = {


  create = function (mainGroup)
    leftPress = false
    rightPress = false
    downPress = false
  heroSprite = display.newSprite(mainGroup, sheetHero , sequenceData )
    heroSprite.x = display.contentCenterX
    heroSprite.y = 1500
    heroSprite:setSequence("idle")
    heroSprite:play()

    physics.start()
    physics.setGravity(0,1000)
    physics.addBody( heroSprite, "dynamic", {  density = 0, bounce = 3, radius= 300 } )
    heroSprite.isFixedRotation = true


--movement


 --collision hero with Trap

 local function onCollision( self, event )


     if ( event.phase == "began" ) then
          local object = event.other.myName
          if (object == "trap" or object == "Bat") then
            self.isVisible = false

            composer.gotoScene( "scene.gameover", { time=3000, effect="crossFade" } )
           timer.performWithDelay(3000,gameOverMenuButton)
          end
        end
  end

heroSprite.collision = onCollision

heroSprite:addEventListener("collision")





--enterFrame





end,
enterFrame = function ()
  physics.start()

  Speed = 80

  if(rightPress and Speed > 70) then
  Speed = 70

  heroSprite.x = heroSprite.x + Speed
  end

  if(leftPress and Speed > 70) then
  Speed = 70

  heroSprite.x = heroSprite.x - Speed
  end


end,

keyboard =  function (event)
  if (event.phase =="down") then

    if  (event.keyName == "s") then
       downPress = true
       heroSprite:setSequence("idle")
       heroSprite:play()

  elseif(event.keyName == "d") then
  rightPress = true
  heroSprite:setSequence( "walkRight" )
  heroSprite:play()

     elseif(event.keyName == "a") then
      leftPress = true
      heroSprite:setSequence( "walkLeft" )
      heroSprite:play()
end

   elseif   (event.phase =="up") then



     if(event.keyName == "s") then
     downPress = false
     heroSprite:setSequence("idle")
     heroSprite:play()

      elseif(event.keyName == "d") then
   rightPress = false
   heroSprite:setSequence( "walkRight" )
  heroSprite:play()


    elseif(event.keyName == "a") then
     leftPress = false

    heroSprite:setSequence( "walkLeft" )
           heroSprite:play()

   end
 end
end,




}




return hero
