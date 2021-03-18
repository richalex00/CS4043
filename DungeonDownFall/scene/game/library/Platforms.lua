local platformsTable = {}
-- Holds the last used randomNum for the platform position
-- Kept outside of createPlatform() so it can save between func. calls.
local last_platform_number = nil

 local function create(mainGroup)
	local newPlatform = display.newImageRect(mainGroup,"scene/game/map/platform.png", 4000,200)
	table.insert(platformsTable, newPlatform)
	physics.addBody(newPlatform, "kinematic", {
		isSensor = false,
		bounce = 0,
		outline = "scene/game/map/platform.png"
	})
	newPlatform.myName = "platform"

	local threeSect = math.random(1700) -825 -- 1
	local oneSect = math.random(900) + 1550 -- 2
	local fourSect = math.random(1500) + 3200  -- 3

	-- The maximum positions that platforms can spawn at.
	local max_sections = 3
	local randomNum = math.random(max_sections)

	-- See if we rolled the same position as the last platform.
	if randomNum == last_platform_number then
		-- If the last position was the maximum positions, we loop back to 1.
		-- Otherwise, it just increments to avoid having the same position as the last platform.
		randomNum = (last_platform_number == max_sections) and 1 or (last_platform_number + 1)
	end

	-- Save the last used position's random number for later checking
	last_platform_number = randomNum

	if (randomNum == 1) then

		newPlatform.x = threeSect
		newPlatform.y = 16000
		transition.to(newPlatform, {x = threeSect, y = -1000, time = 7680})

	elseif (randomNum == 2) then

		newPlatform.x = oneSect
		newPlatform.y = 16000
		transition.to(newPlatform, {x = oneSect, y = -1000, time = 7680})



	elseif (randomNum == 3) then

		newPlatform.x = fourSect
		newPlatform.y = 16000
		transition.to(newPlatform, {x = fourSect, y = -1000, time = 7680})

	end
end
local platform = {
	gameLoop = function (mainGroup)
    if (mainGroup ~= nil) then
		create(mainGroup)
		print("asd")
	for i = #platformsTable, 1, -1 do
		local thisPlatform = platformsTable[i]

		if (thisPlatform.y < -100) then
			display.remove(thisPlatform)
			table.remove(platformsTable, i)
		end
	end
end

	end
}
display.setStatusBar(display.HiddenStatusBar)




return platform
