-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-- The purpose of the "level1.lua" script is define a new scene whose only job is to 
-- render an image of Mario on a light blue background.
-----------------------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )

local mario = nil

--------------------------------------------------------------------------------
-- A call to the getDeltaTime() utility function returns how much time has 
-- elapsed since the last time we called it. It's basically only used by the 
-- listener function onFrameEnter() to scale animation values.
--------------------------------------------------------------------------------
local function getDeltaTime()
	
   local currentTime = system.getTimer()
   local deltaTime = currentTime - prevTime
   prevTime = currentTime

   return deltaTime

end

-- Declare a function on our scene called create.
function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

    local helpText = display.newText( "Use your laptop's keyboard to move Mario!", 500, 150, native.systemFont, 55 )
    helpText:setFillColor( 1, 0, 0 )

	mario = display.newImageRect( "mario.png", 190, 250 )

	-- Position the Mario image by setting the image's X and Y positions.
	-- The X position moves Mario left and right.
	-- The Y position moves Mario up and down.
	mario.x = 500
	mario.y = 450

	sceneGroup:insert( mario )
    sceneGroup:insert( helpText )

end

--------------------------------------------------------------------------------
-- As our game runs, Corona will generate an event called "enterFrame". If we 
-- listen for this event, we can use it as an opportunity to animate an object 
-- by changing some aspect of it each frame just before Corona renders the frame.
-- In this sample, we're using it to move our Mario image around via the 
-- keyboard.
--------------------------------------------------------------------------------
local function onFrameEnter()

    if mario == nil then
        return
    end

    local deltaTime = getDeltaTime()

    local moveSpeed = (0.5 * deltaTime)

    if mario.isMoving then

        if mario.direction == "down" then
            mario.y = mario.y + moveSpeed
        elseif mario.direction == "up" then
            mario.y = mario.y - moveSpeed
        elseif mario.direction == "left" then
            mario.x = mario.x - moveSpeed
        elseif mario.direction == "right" then
            mario.x = mario.x + moveSpeed
        end

        print( string.format("Mario's x = %d, y = %d", mario.x, mario.y) )

    end

end

local function onKeyEvent( event )

    if event.keyName == "up" then

        mario.direction = "up"

        if event.phase == "down" then
            mario.isMoving = true
        else
            mario.isMoving = false
        end

        return true

    elseif event.keyName == "down" then

        mario.direction = "down"

        if event.phase == "down" then
            mario.isMoving = true
        else
            mario.isMoving = false
        end

        return true

    elseif event.keyName == "left" then

        mario.direction = "left"

        if event.phase == "down" then
            mario.isMoving = true
        else
            mario.isMoving = false
        end

        return true

    elseif event.keyName == "right" then

        mario.direction = "right"

        if event.phase == "down" then
            mario.isMoving = true
        else
            mario.isMoving = false
        end

        return true
    end

    -- IMPORTANT! Return false to indicate that this app is NOT overriding 
    -- the received key. This lets the operating system execute its default
    -- handling of the key.

    return false

end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then

		-- Called when the scene is still off screen and is about to move on screen

	elseif phase == "did" then

		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

		-- Before we start listening to the "enterFrame" event, we should
		-- initialize prevTime to the current time. Otherwise the first call
		-- to getDeltaTime() could return an absurd value.
		prevTime = system.getTimer()

		-- If the scene has been shown - add our listeners so we can start
		-- moving our Mario!
		Runtime:addEventListener( "enterFrame", onFrameEnter )
		Runtime:addEventListener( "key", onKeyEvent )

	end

end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then

		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)

		-- If the scene is going to be hidden - remove our listeners.
		-- There's no reason to move our Mario if no one can see him.
		Runtime:removeEventListener( "enterFrame", onFrameEnter )
		Runtime:removeEventListener( "key", onKeyEvent )

	elseif phase == "did" then

		-- Called when the scene is now off screen

	end	
	
end

---------------------------------------------------------------------------------

-- Add an event listener for the create event so our create function above will 
-- get called.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

----------------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can make use of it.
return scene
