local composer = require( "composer" )
local Design = require ("scene.game.library.Designs")
local scene = composer.newScene()

local function goToGame()
  composer.gotoScene ("scene.game", { time=2000, effect="fade" } )
end

local function goToOptions()
  composer.gotoScene ("scene.Options")
end

--variables to here and options
local BackgroundMusic
-- create()





function scene:create( event )

    local sceneGroup = self.view

-- menu background

 local backgroundTitle = display.newImageRect( sceneGroup, "scene/menu/img/MenuBackground.png", 7050,9000)
 backgroundTitle.y = display.contentCenterY
backgroundTitle.x = display.contentCenterX


--implemting buttons

 local startButton = display.newImageRect( sceneGroup, "scene/menu/img/start.png", display.contentCenterX, 500, native.systemFont, 500 )
 startButton.y = 4700
startButton.x = display.contentCenterX

local OptionButton = display.newImageRect( sceneGroup, "scene/menu/img/options.png", display.contentCenterX, 500, native.systemFont, 500 )
OptionButton.y = 5500
OptionButton.x = display.contentCenterX




  startButton:addEventListener( "tap", goToGame )
  OptionButton:addEventListener( "tap", goToOptions )
  Design.create(sceneGroup)



  -- stream music
    BackgroundMusic = audio.loadStream( "scene/menu/Sounds/mainMenu.mp3" )

end



-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then


	elseif ( phase == "did" ) then
    -- Start the music!
          audio.play(BackgroundMusic, { channel=1, loops=-1 } )

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
  audio.stopWithDelay( 2100, { channel = 1 }  )

	elseif ( phase == "did" ) then

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	  audio.dispose( BackgroundMusic )

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
