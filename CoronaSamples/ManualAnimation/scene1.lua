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

-- Lets cache our display's width and height so our Mario can find the 
-- screen edges while jumping around.
local screenW = display.contentWidth
local screenH = display.contentHeight

-- This will eventually hold our Mario image that we will animate 
-- and render.
local mario = nil

-- This is used by the getDeltaTime() utility function to keep track 
-- of how much time has elapsed since the last frame of rendering.
local prevTime = 0

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )


function scene:create( event )

	local sceneGroup = self.view

	mario = display.newImageRect( "mario.png", 190, 250 )

	-- Initialize Mario by setting his position.
	-- Changes to his X position move Mario left and right.
	-- Changes to his Y position move Mario up and down.
	mario.x = 500
	mario.y = 300

	-- Since we want to move Mario around the scene, we'll add two new 
	-- property variables to our mario object so we can keep track on 
	-- his velocity along both the X and Y axis of movement. Also, we 
	-- want him start moving as soon as the game loads so we will give 
	-- him some initial velocity values to get him bouncing.
	mario.velocityX = 0.5
    mario.velocityY = 0.0

	-- Make sure to add our Mario image to the scene group so the scene 
	-- can manage him.
	sceneGroup:insert( mario )

end

------------------------------------------------------------------------
-- A call to the getDeltaTime() utility function returns how much time 
-- has elapsed since the last time we called it. It's basically only 
-- used by the listener function onFrameEnter() to scale animation 
-- values.
------------------------------------------------------------------------
local function getDeltaTime()
	
   local currentTime = system.getTimer()
   local deltaTime = currentTime - prevTime
   prevTime = currentTime

   return deltaTime

end

local function onFrameEnter()

	local deltaTime = getDeltaTime()

    -- We can simulate gravity by constantly adding some amount to
    -- Mario's Y velocity. This will pull Mario down toward the bottom.
    -- of the scene. Note how we're using our delta time to scale the value
    -- that is being added to the Y velocity.
    mario.velocityY = mario.velocityY + (0.005 * deltaTime)

    -- Once we adjust Mario's Y velocity, we can move Mario by adding his 
    -- current velocities along the X and Y axis to his X and Y positions.
	mario.x = mario.x + (mario.velocityX * deltaTime)
    mario.y = mario.y + (mario.velocityY * deltaTime)

    -- After we move Mario, we check to see if his new position has him leaving
    -- the scene in any way. If Mario is about to jump or fall off screen, we will 
    -- invert his velocities and then recompute his position to keep him on screen.
    -- In this case, "invert" means making a positive velocity negative or making 
    -- a negative velocity positive. In Lua we can invert a value by simply setting
    -- it to the negative of it's current value.

	if mario.x < 0 or mario.x > screenW then

        -- If Mario is bouncing off the scene's left or right side, invert his 
        -- X velocity so he will change his direction of travel.
		mario.velocityX = -(mario.velocityX)

    	-- Since Mario just bounced off the scene's left or right side,
        -- invert or flip his xScale so he'll face the opposite direction.
		mario.xScale = -(mario.xScale)

	end

	if mario.y >= (screenH - (mario.height * 0.5)) then

        -- If Mario hits the bottom of the scene, reset his Y velocity so 
        -- he will bounce back up.
		mario.velocityY = -2.0

	end

end

function scene:show( event )

	local phase = event.phase
	
	if phase == "did" then

		-- Before we start listening to the "enterFrame" event, we should
		-- initialize prevTime to the current time. Otherwise the first call
		-- to getDeltaTime() could return an absurd value.
		prevTime = system.getTimer()

		-- If the scene has been shown - add our listener so we can start
		-- animating our Mario!
		Runtime:addEventListener( "enterFrame", onFrameEnter )

	end

end

function scene:hide( event )

	local phase = event.phase
	
	if event.phase == "will" then

		-- If the scene is going to be hidden - remove our listener.
		-- There's no reason animate our Mario if no one can see him.
		Runtime:removeEventListener( "enterFrame", onFrameEnter )

	end	
	
end

------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene
