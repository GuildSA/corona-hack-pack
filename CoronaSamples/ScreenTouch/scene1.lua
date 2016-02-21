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

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- This will eventually hold our Mario image.
local mario = nil

-- This is our call-back function for touch events on our background.
local function onBackgroundTouch(event)

	if event.phase == "ended" then 

		-- Setting Mario's x,y position directly will move him immediately.
		--mario.x = event.x
		--mario.y = event.y

		-- Or we could move Mario by using transition.to. This will cause
		-- Mario to smoothly move from his old x,y position to the new 
		-- his new x,y position.
		transition.to( mario, { time = 500, x = event.x, y = event.y } )

	end

	return true

end

function scene:create( event )

	local sceneGroup = self.view

	-- Create a simple rectangle object to catch touch events. We will use this to
	-- move Mario from his current position to a new position which will be specified
	-- by touching the screen.
	local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	background.x = display.contentWidth*0.5
	background.y = display.contentHeight*0.5
	background:setFillColor( 0.2, 0.5, 1.0 )
	background:addEventListener( "touch", onBackgroundTouch )


	mario = display.newImageRect( "mario.png", 190, 250 )
	mario.x = 500
	mario.y = 350

	sceneGroup:insert( background )
	sceneGroup:insert( mario )

end

------------------------------------------------------------------------

-- Add event listeners for all of the scene events we want to get called for!
scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene

