------------------------------------------------------------------------
--
-- scene1.lua
--
------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Include Corona's "widget" module.
local widget = require( "widget" )

-- Include our "dpad" module.
local dpad = require( "dpad" )

-- Use dpad to create a new game D-pad for the player.
-- Create it with a size of 450, using the pad.png image, and with an 
-- alpha of 0.5.
local gamePad = dpad.newDPad( 450, "pad.png", 0.5 )

-- Forward declarations and other locals
local screenW = display.contentWidth
local screenH = display.contentHeight
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local starFighter = nil
local movementSpeed = 0.5
local starField = nil

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

function onEnterFrame( event )

	local deltaTime = getDeltaTime()

    --
    -- Move the player's fighter around via the player's game pad.
    --

	if gamePad.isMoving then

		if gamePad.isMovingUp then
			starFighter.y = starFighter.y - (movementSpeed * deltaTime )
		end

		if gamePad.isMovingDown then
			starFighter.y = starFighter.y + (movementSpeed * deltaTime )
		end

		if gamePad.isMovingLeft then
			starFighter.x = starFighter.x - (movementSpeed * deltaTime )
		end

		if gamePad.isMovingRight then
			starFighter.x = starFighter.x + (movementSpeed * deltaTime )
		end

	end

	--
	-- Scroll stars from right to left.
	--
	
    for i = 1, #starField do

        -- Move the star.
		starField[i].star.x = starField[i].star.x - deltaTime * (starField[i].speed * 0.2)

        -- If the star falls off the screen's edge, wrap it around
        if starField[i].star.x <= 0 then
            starField[i].star.x = screenW
        end

    end

end

function scene:create( event )

	local sceneGroup = self.view


	starFighter = display.newImageRect( "fighter.png", 138, 36 )
	starFighter.x = 310
	starFighter.y = 400

	--
    -- Setup a scrolling star field.
    --

    starField = {}

	local starFieldGroup = display.newGroup()

    for i = 1, 100 do

		local speed = math.random( 1, 3 )

        starField[i] =
        {
			star = display.newCircle( math.random( 0, screenW ), -- X
				                      math.random( 0, screenH ), -- Y
				                      speed ), -- Radius
            speed = speed
        }

		starField[i].star:setFillColor( 1.0 )

		starFieldGroup:insert( starField[i].star )

    end


	-- All display objects must be inserted into the group.
	sceneGroup:insert( starFighter )
	sceneGroup:insert( starFieldGroup )

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
