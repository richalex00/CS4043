local composer = require( "composer" )
local Design = require ("scene.game.library.Designs")
local scene = composer.newScene()
local function goToMainMenu()

	  composer.gotoScene ("scene.menu")
end
--variables in scene

-- create()
function scene:create( event )

	local sceneGroup = self.view



-- menu background

 local backgroundTitle = display.newImageRect( sceneGroup, "scene/menu/img/GameOver.png", 6500,9000)
backgroundTitle.y = display.contentCenterY
backgroundTitle.x = display.contentCenterX


--implemting buttons

 local MainMenu = display.newImageRect( sceneGroup, "scene/menu/img/mainMenu.png", display.contentCenterX, 500, 500 )
 MainMenu.y = 4500
MainMenu.x = display.contentCenterX




MainMenu.x = display.contentCenterX

  MainMenu:addEventListener( "tap", goToMainMenu )

	Design.create(sceneGroup)



end




-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
composer.removeScene( "scene.game")

	elseif ( phase == "did" ) then



	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
audio.setVolume( 0.06, { channel=3 } )
	elseif ( phase == "did" ) then



	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view

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
