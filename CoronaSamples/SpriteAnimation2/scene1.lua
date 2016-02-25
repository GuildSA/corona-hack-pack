------------------------------------------------------------------------
--
-- scene1.lua
--
-- https://docs.coronalabs.com/guide/media/spriteAnimation/index.html
------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Include our "dpad" module.
local dpad = require( "dpad" )

-- Use dpad to create a new game D-pad for the player.
-- Create it with a size of 450, using the pad.png image, with an 
-- alpha of 0.8, and disable diagonal travel.
local gamePad = dpad.newDPad( 450, "pad.png", 0.8, false )

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- Forward declarations and other locals.
local screenW = display.contentWidth
local screenH = display.contentHeight
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

-- Forward declarations and other locals
local linkSprite = nil
local movementSpeed = 0.3

-- This is used by the getDeltaTime() utility function to keep track 
-- of how much time has elapsed since the last frame of rendering.
local prevTime = 0

------------------------------------------------------------------------
-- A call to the getDeltaTime() utility function returns how much time 
-- has elapsed since the last time we called it. It's basically only 
-- used by the listener function onEnterFrame() to scale animation 
-- values.
------------------------------------------------------------------------
local function getDeltaTime()
	
   local currentTime = system.getTimer()
   local deltaTime = currentTime - prevTime
   prevTime = currentTime

   return deltaTime

end

function scene:create( event )

	local sceneGroup = self.view

	-- Link's animation frames are 120 x 130 but using this size directly will cause edge 
	-- artifacts to show up while animating. This is a problem for our link sprite sheet 
	-- because the artist packed the frames in too close together.
	--local linkSpriteSheet = graphics.newImageSheet( "link.png", { width = 120, height = 130, numFrames = 80 } )

	-- To prevent these edge artifacts, treat the animation frames as 118 x 128 with a 
	-- 1 pixel border all the way around the frame. This will keep pixels on the edge of 
	-- one frame from bleeding into a neighboring frame.
	local linkSpriteSheet = graphics.newImageSheet( "link.png", { width = 118, height = 128, numFrames = 80, border = 1 } )

	local linkAnimationSequences =
	{
		{ name="idle_down", sheet=linkSpriteSheet, start=1, count=3, time=800, loopCount=1, loopDirection="bounce" },
		{ name="idle_left", sheet=linkSpriteSheet, start=11, count=3, time=800, loopCount=1, loopDirection="bounce" },
		{ name="idle_up", sheet=linkSpriteSheet, start=21, count=1, time=800, loopCount=1, loopDirection="bounce" },
		{ name="idle_right", sheet=linkSpriteSheet, start=31, count=3, time=800, loopCount=1, loopDirection="bounce" },

		{ name="walk_down", sheet=linkSpriteSheet, start=41, count=10, time=1000, loopCount=0 },
		{ name="walk_left", sheet=linkSpriteSheet, start=51, count=10, time=1000, loopCount=0 },
		{ name="walk_up", sheet=linkSpriteSheet, start=61, count=10, time=1000, loopCount=0 },
		{ name="walk_right", sheet=linkSpriteSheet, start=71, count=10, time=1000, loopCount=0 }
	}
	
	linkSprite = display.newSprite( linkSpriteSheet, linkAnimationSequences )
	linkSprite.x = halfW
	linkSprite.y = halfH
	linkSprite:setSequence( "idle_down" )
	linkSprite:play()

	-- Add these variables for our own use!
	linkSprite.isMovingUp = false
	linkSprite.isMovingDown = false
	linkSprite.isMovingLeft = false
	linkSprite.isMovingRight = false
	linkSprite.walkingDirection = nil

	sceneGroup:insert( linkSprite )

end

function onEnterFrame( event )

	local deltaTime = getDeltaTime()

    --
    -- Move Link around via the player's game pad.
    --

	if gamePad.isMoving then

		if gamePad.isMovingUp then

			linkSprite.y = linkSprite.y - (movementSpeed * deltaTime)

			-- If Link is not already animating in this direction - do it!
			if linkSprite.walkingDirection ~= "up" then

				linkSprite.walkingDirection = "up"
				linkSprite:setSequence( "walk_up" )
				linkSprite:play()

			end

		end

		if gamePad.isMovingDown then

			linkSprite.y = linkSprite.y + (movementSpeed * deltaTime)

			-- If Link is not already animating in this direction - do it!
			if linkSprite.walkingDirection ~= "down" then

				linkSprite.walkingDirection = "down"
				linkSprite:setSequence( "walk_down" )
				linkSprite:play()

			end

		end

		if gamePad.isMovingLeft then

			linkSprite.x = linkSprite.x - (movementSpeed * deltaTime)

			-- If Link is not already animating in this direction - do it!
			if linkSprite.walkingDirection ~= "left" then

				linkSprite.walkingDirection = "left"
				linkSprite:setSequence( "walk_left" )
				linkSprite:play()

			end

		end

		if gamePad.isMovingRight then

			linkSprite.x = linkSprite.x + (movementSpeed * deltaTime)

			-- If Link is not already animating in this direction - do it!
			if linkSprite.walkingDirection ~= "right" then

				linkSprite.walkingDirection = "right"
				linkSprite:setSequence( "walk_right" )
				linkSprite:play()

			end

		end

	else

		--
		-- If the player stops moving, make Link idle facing in his last known
		-- direction of travel.
		--

		if linkSprite.walkingDirection ~= nil then

			if linkSprite.walkingDirection == "up" then

				linkSprite:setSequence( "idle_up" )
				linkSprite:play()

			elseif linkSprite.walkingDirection == "down" then

				linkSprite:setSequence( "idle_down" )
				linkSprite:play()

			elseif linkSprite.walkingDirection == "left" then

				linkSprite:setSequence( "idle_left" )
				linkSprite:play()

			elseif linkSprite.walkingDirection == "right" then

				linkSprite:setSequence( "idle_right" )
				linkSprite:play()

			end

			linkSprite.walkingDirection = nil

		end

	end

end

function scene:show( event )

	local phase = event.phase
	
	if phase == "did" then

		-- Before we start listening to the "enterFrame" event, we should
		-- initialize prevTime to the current time. Otherwise the first call
		-- to getDeltaTime() could return an incorrect value.
		prevTime = system.getTimer()

		-- If the scene has been shown - add our listeners.
		Runtime:addEventListener( "enterFrame", onEnterFrame )

	end

end

function scene:hide( event )

	local phase = event.phase
	
	if phase == "will" then

		-- If the scene is going to be hidden - remove our listeners.
		Runtime:removeEventListener( "enterFrame", onEnterFrame )

	end	
	
end

------------------------------------------------------------------------

-- Add event listeners for all of the scene events we want to get called for!
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene
