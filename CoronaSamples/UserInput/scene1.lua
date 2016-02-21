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


    local helpText = display.newText( "Use your laptop's keyboard to move Mario!", 500, 150, native.systemFont, 55 )
    helpText:setFillColor( 1.0, 0.0, 0.0 )


	mario = display.newImageRect( "mario.png", 190, 250 )

	-- Position the Mario image by setting the image's X and Y positions.
	-- The X position moves Mario left and right.
	-- The Y position moves Mario up and down.
	mario.x = 500
	mario.y = 450


	sceneGroup:insert( mario )
    sceneGroup:insert( helpText )

end

------------------------------------------------------------------------
-- As our game runs, Corona will generate an event called "enterFrame". 
-- If we listen for this event, we can use it as an opportunity to 
-- animate an object by changing some aspect of it each frame just 
-- before Corona renders the frame. In this sample, we're using it to 
-- move our Mario image around via the keyboard.
------------------------------------------------------------------------
local function onEnterFrame()

    -- Delta time is a fancy way of saying how much time has elapsed since the
    -- last time we updated our game objects. When we move or animate objects in
    -- a game it's very important to take into consideration how slow or fast
    -- the host device is running. If we don't scale our animations by delta
    -- time our Mario will move around faster on fast devices and slower on 
    -- slow devices. This would mean that how the game plays or feel would vary
    -- depending on whether or not the game was played on a high performance  
    -- phone vs a low performance phone and that wouldn't be a great experience 
    -- for anyone.
    local deltaTime = getDeltaTime()

    local moveSpeed = (0.5 * deltaTime)

    if mario.isMovingUp then

        mario.y = mario.y - moveSpeed

    elseif mario.isMovingDown then

        mario.y = mario.y + moveSpeed

    elseif mario.isMovingLeft then

        mario.x = mario.x - moveSpeed

    elseif mario.isMovingRight then

        mario.x = mario.x + moveSpeed

    end

    --print( string.format("Mario's x = %d, y = %d", mario.x, mario.y) )

end

local function onKey( event )

    -- https://docs.coronalabs.com/api/event/key/keyName.html

    if event.keyName == "up" then

        if event.phase == "down" then
            mario.isMovingUp = true
        else
            mario.isMovingUp = false
        end

        return true

    elseif event.keyName == "down" then

        if event.phase == "down" then
            mario.isMovingDown = true
        else
            mario.isMovingDown = false
        end

        return true

    elseif event.keyName == "left" then

        if event.phase == "down" then
            mario.isMovingLeft = true
        else
            mario.isMovingLeft = false
        end

        return true

    elseif event.keyName == "right" then

        if event.phase == "down" then
            mario.isMovingRight = true
        else
            mario.isMovingRight = false
        end

        return true
    end

    -- IMPORTANT! Return false to indicate that this app is NOT overriding 
    -- the received key. This lets the operating system execute its default
    -- handling of the key.

    return false

end

function scene:show( event )

	local phase = event.phase
	
	if phase == "did" then

		-- Before we start listening to the "enterFrame" event, we should
		-- initialize prevTime to the current time. Otherwise the first call
		-- to getDeltaTime() could return an incorrect value.
		prevTime = system.getTimer()

		-- If the scene has been shown - add our listeners so we can start
		-- moving our Mario!
		Runtime:addEventListener( "enterFrame", onEnterFrame )
		Runtime:addEventListener( "key", onKey )

	end

end

function scene:hide( event )

	local phase = event.phase
	
	if phase == "will" then

		-- If the scene is going to be hidden - remove our listeners.
		-- There's no reason to move our Mario if no one can see him.
		Runtime:removeEventListener( "enterFrame", onEnterFrame )
		Runtime:removeEventListener( "key", onKey )

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
