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

-- Use dpad to create a new gamePad for the player.
local gamePad = dpad.newGamePad( 450, "pad.png", 0.5 )

-- Forward declarations and other locals
local playerSprite = nil
local enemySprite = nil

local playerCollisionRect = nil
local enemyCollisionRect = nil

local movementSpeed = 0.5

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

------------------------------------------------------------------------
-- Rectangle-based collision detection
-- https://coronalabs.com/blog/2013/07/23/tutorial-non-physics-collision-detection/
------------------------------------------------------------------------
local function hasCollided( obj1, obj2 )

    if obj1 == nil then  -- Make sure the first object exists
        return false
    end

    if obj2 == nil then  -- Make sure the other object exists
        return false
    end
 
 	-- Use the contentBounds property our our two objects to see if any 
 	-- corner of one rectangle is inside the bounds of the other rectangle.

    local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
    local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
 
    return (left or right) and (up or down)

end

function onEnterFrame( event )

	local deltaTime = getDeltaTime()

    --
    -- Move the player's fighter around via the player's game pad.
    --

	if gamePad.isMoving then

		if gamePad.isMovingUp then
			playerSprite.y = playerSprite.y - (movementSpeed * deltaTime )
		end

		if gamePad.isMovingDown then
			playerSprite.y = playerSprite.y + (movementSpeed * deltaTime )
		end

		if gamePad.isMovingLeft then
			playerSprite.x = playerSprite.x - (movementSpeed * deltaTime )
		end

		if gamePad.isMovingRight then
			playerSprite.x = playerSprite.x + (movementSpeed * deltaTime )
		end

	end

	-- Update the player's collision rect so we can draw it in the right place.
	playerCollisionRect.x = playerSprite.x
	playerCollisionRect.y = playerSprite.y

    --
    -- Does the player's sprite collide with the enemy sprite?
    -- That is the big question!
    --

    if hasCollided( playerSprite, enemySprite ) then

        messageText.text = "Bammmm Pow - Collision!"
        playerCollisionRect.isVisible = true
        enemyCollisionRect.isVisible = true

    else

        messageText.text = "Borrrrring - No collision."
        playerCollisionRect.isVisible = false
        enemyCollisionRect.isVisible = false

    end

end

function scene:create( event )

	local sceneGroup = self.view


	playerSprite = display.newImageRect( "fighter.png", 138, 36 )
	playerSprite.x = 310
	playerSprite.y = 400

	enemySprite = display.newImageRect( "enemy.png", 164, 200 )
	enemySprite.x = 700
	enemySprite.y = 400


	messageText = display.newText( "", 0, 0, native.systemFontBold, 45 )
	messageText:setFillColor( 1.0, 1.0, 1.0 )
	messageText.x = 250
	messageText.y = 80


	playerCollisionRect = display.newRect( playerSprite.x, playerSprite.y, playerSprite.width, playerSprite.height )
	playerCollisionRect:setFillColor( 0.0 )
	playerCollisionRect.strokeWidth = 3
	playerCollisionRect:setStrokeColor( 1.0, 0.0, 0.0 )
	playerCollisionRect.isVisible = false

	enemyCollisionRect = display.newRect( enemySprite.x, enemySprite.y, enemySprite.width, enemySprite.height )
	enemyCollisionRect:setFillColor( 0.0 )
	enemyCollisionRect.strokeWidth = 3
	enemyCollisionRect:setStrokeColor( 1.0, 0.0, 0.0 )
	enemyCollisionRect.isVisible = false


	-- All display objects must be inserted into the group.
	sceneGroup:insert( enemyCollisionRect )
	sceneGroup:insert( enemySprite )
	sceneGroup:insert( playerCollisionRect )
	sceneGroup:insert( playerSprite )
	sceneGroup:insert( messageText )

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
