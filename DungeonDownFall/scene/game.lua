local composer = require ("composer")
local physics = require ("physics")



local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()


local scene = composer.newScene()

local background = require ("scene.game.library.Background")
local platforms = require ("scene.game.library.Platforms")
local trap = require ("scene.game.library.Trap")
local bat = require ("scene.game.library.bat")
local design = require ("scene.game.library.Designs")
local walls = require ("scene.game.library.Walls")
local hero = require ("scene.game.library.hero")
local score = require ("scene.game.library.score")
local healthBar = require ("scene.game.library.HealthBar")

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()

--variables in scene
local EntranceMusic, ingameMusic


function scene:create( event )

	local sceneGroup = self.view




	sceneGroup:insert(backGroup)
	sceneGroup:insert(mainGroup)
	sceneGroup:insert(uiGroup)


	design.create(uiGroup)
	background.create(backGroup)

	platformTimer = timer.performWithDelay(500,function ()
		platforms.gameLoop(mainGroup)
	end, 0)

	walls.create(mainGroup)
	batTimer = timer.performWithDelay(2500,
	function ()
	bat.gameLoop(mainGroup)
	end, 0)

	trap.create(mainGroup)
	hero.create(mainGroup)
	enterFrame = hero.enterFrame
	keyboard = hero.keyboard
	Runtime:addEventListener( "enterFrame", enterFrame )
	Runtime:addEventListener("key",keyboard)
	backgroundMove = background.move
	Runtime:addEventListener("enterFrame", backgroundMove)





	scoreTimer = timer.performWithDelay(100, function (event)
			 score.calculateScore(event)
	 end, 0)
	 timer.pause(scoreTimer)
	 timer.performWithDelay(4000, function ()
			 timer.resume(scoreTimer)
	 end, 1)
score.create(uiGroup)


end


-- stream music
	EntranceMusic = audio.loadStream( "scene/menu/Sounds/heroEntrance.mp3" )
	-- stream music
  ingameMusic = audio.loadStream( "scene/menu/Sounds/in-gameTrack.mp3" )



-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Start the music!
          audio.play( EntranceMusic, { channel=2 } )

	elseif ( phase == "did" ) then

		-- Start the music!
	audio.play(ingameMusic, {channel=3, loops=100} )



	end
end

-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	audio.fadeOut( { channel=0, time=2000 } )

	elseif ( phase == "did" ) then

		audio.stopWithDelay( ingameMusic, 3000, 3 )



    composer.removeScene( "scene.game")

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	print("asd")
	Runtime:removeEventListener("enterFrame", backgroundMove)
	Runtime:removeEventListener("key", keyboard)
	Runtime:removeEventListener("enterFrame", enterFrame)
  timer.cancel(scoreTimer)
	scoreValue = 0
  physics.pause()
	timer.cancel(platformTimer)
	timer.cancel(batTimer)



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
