local composer = require ("composer")


walls = {
    create =  function (sceneGroup)
    local physics = require "physics"
    physics.start()
    --leftwall1
    local wall = display.newImageRect(sceneGroup,"scene/game/map/wall.png", 2000,8000)
    wall.x = -2150
    wall.y = 4000
    physics.addBody(wall, "static",{isSensor=false,density = 1000 } )
    
    --righttWall1
    local wall1 = display.newImageRect(sceneGroup,"scene/game/map/wall.png", 2000,8000)
    wall1.x = 6150
    wall1.y = 4000
    physics.addBody(wall1, "static",{density = 1000 } )
    
    
    --continuation of the walls
    
    
    --leftwall2
    local wall = display.newImageRect(sceneGroup,"scene/game/map/wall.png", 2000,8000)
    wall.x = -2150
    wall.y = 11500
    physics.addBody(wall, "static",{isSensor=false,density = 1000 } )
    
    --righttWall2
    local wall1 = display.newImageRect(sceneGroup,"scene/game/map/wall.png", 2000,8000)
    wall1.x = 6150
    wall1.y = 11500
    physics.addBody(wall1, "static",{density = 1000 } )
    
    
    --torches
    --Left torches
    local torch1 = display.newImageRect(sceneGroup, "scene/game/map/torch.png", 1000,1000)
    torch1.x = -1800
    torch1.y = 1500
    
    local torch2 = display.newImageRect(sceneGroup, "scene/game/map/torch.png", 1000,1000)
    torch2.x = -1800
    torch2.y = 5500
    
    
    --Right torches
    local torch1 = display.newImageRect(sceneGroup ,"scene/game/map/torch.png", 1000,1000)
    torch1.x = 5830
    torch1.y = 1500
    
    local torch2 = display.newImageRect(sceneGroup ,"scene/game/map/torch.png", 1000,1000)
    torch2.x = 5830
    torch2.y = 5500
    
    
    
    
    -- holeInWall
    
    
    --Left holes
    local hole1 = display.newImageRect(sceneGroup, "scene/game/map/blackhole.png", 1000,1000)
    hole1.x = -1800
    hole1.y = 3500
    
    local hole2 = display.newImageRect(sceneGroup , "scene/game/map/blackhole.png", 1000,1000)
    hole2.x = -1800
    hole2.y = 7000
    
    
    --Right holes
    local hole3 = display.newImageRect(sceneGroup, "scene/game/map/blackhole.png", 1000,1000)
    hole3.x = 5830
    hole3.y = 3500
    
    local hole4 = display.newImageRect(sceneGroup, "scene/game/map/blackhole.png", 1000,1000)
    hole4.x = 5830
    hole4.y = 7000
    
    
end
}

return walls