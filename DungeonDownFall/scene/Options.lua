local composer = require( "composer" )
local Design = require ("scene.game.library.Designs")
local scene = composer.newScene()


--functions used

local function MaxVolume()
  audio.setVolume( 5, { channel=1 } )
  audio.setVolume( 5, { channel=2 } )
  audio.setVolume( 5, { channel=3 } )
  audio.setVolume( 5, { channel=4 } )
end
local function MinVolume()
  audio.setVolume( 0.1, { channel=1 } )
  audio.setVolume( 0.1, { channel=2 } )
  audio.setVolume( 0.1, { channel=3 } )
  audio.setVolume( 0.1, { channel=4 } )
end

local function Mute()
  audio.setVolume( 0, { channel=1 } )
  audio.setVolume( 0, { channel=2 } )
  audio.setVolume( 0, { channel=3 } )
  audio.setVolume( 0, { channel=4 } )
end
local function Unmute()
  audio.setVolume( 0.1, { channel=1 } )
  audio.setVolume( 0.06, { channel=2 } )
  audio.setVolume( 0.06, { channel=3 } )
    audio.setVolume( 0.06, { channel=4 } )
end

local function goToMainMenu()

	  composer.gotoScene ("scene.menu")
end



--variables in scene
local BackgroundMusic1




-- create()


function scene:create( event )

    local sceneGroup = self.view

-- Options background

 local background = display.newImageRect( sceneGroup, "scene/game/map/RockBG.png", 10000,8000)
 background.y = display.contentCenterY
background.x = display.contentCenterX


--implemting buttons

 local MaximumVolume = display.newImageRect( sceneGroup, "scene/menu/img/MaximumVolume.png",  3000, 500 )
MaximumVolume.y = 2000
MaximumVolume.x = display.contentCenterX

local MinimumVolume = display.newImageRect( sceneGroup, "scene/menu/img/MinimumVolume.png", 3000, 500 )
MinimumVolume.y = 3000
MinimumVolume.x = display.contentCenterX

local MuteMusic = display.newImageRect( sceneGroup, "scene/menu/img/MuteMusic.png", 2500, 500 )
MuteMusic.y =  4000
MuteMusic.x = display.contentCenterX

local UnmuteMusic = display.newImageRect( sceneGroup, "scene/menu/img/UnmuteMusic.png", 2800, 500 )
UnmuteMusic.y = 5000
UnmuteMusic.x = display.contentCenterX

local backButton = display.newImageRect( sceneGroup, "scene/menu/img/Back.png", 1600, 500 )
backButton.y = 6000
backButton.x = display.contentCenterX





  MaximumVolume:addEventListener( "tap", MaxVolume )
  MinimumVolume:addEventListener( "tap", MinVolume )
  MuteMusic:addEventListener( "tap", Mute )
  UnmuteMusic:addEventListener( "tap", Unmute )
  backButton:addEventListener( "tap", goToMainMenu )



  Design.create(sceneGroup)



  -- stream music
    BackgroundMusic1 = audio.loadStream( "scene/menu/Sounds/mainMenu.mp3" )

end



-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then


   audio.stop( { channel = 1})
    audio.play(BackgroundMusic1, { channel=4, loops=-1 } )
	elseif ( phase == "did" ) then
    -- Start the music!


	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
  audio.stop()

	elseif ( phase == "did" ) then


	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	  audio.dispose( BackgroundMusic1 )

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
