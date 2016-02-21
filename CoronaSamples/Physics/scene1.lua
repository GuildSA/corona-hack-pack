------------------------------------------------------------------------
--
-- scene1.lua
--
-- https://docs.coronalabs.com/api/library/physics/index.html
------------------------------------------------------------------------

local physics = require( "physics" )

-- https://docs.coronalabs.com/api/library/physics/setDrawMode.html
physics.setDrawMode( "normal" )  -- The default Corona renderer, with no collision outlines.
--physics.setDrawMode( "hybrid" )  -- Overlays collision outlines on normal display objects.
--physics.setDrawMode( "debug" )   -- Shows collision engine outlines only.

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- These will eventually hold our Mario and block images.
local mario = nil
local block = nil

-- Forward declarations and other locals.
local screenW = display.contentWidth
local screenH = display.contentHeight
local halfW = display.contentWidth*0.5
local halfH = display.contentWidth*0.5

-- This 
function onCollision( event )

    if event.phase == "began" then
        print( event.object1.name .. " collision began with " .. event.object2.name )
    elseif event.phase == "ended" then
        print( event.object1.name .. " collision ended with " .. event.object2.name )
    end

end

function scene:create( event )

    local sceneGroup = self.view

    -- https://docs.coronalabs.com/api/library/physics/start.html
    physics.start()

    -- https://docs.coronalabs.com/api/library/physics/setGravity.html
    physics.setGravity( 0, 30 )

    local options = 
    {
        text = "Use left and right arrow keys to move and space bar to jump!",
        x = 500,
        y = 150,
        width = 800,
        font = native.systemFont,   
        fontSize = 55,
        align = "center"
    }

    local helpText = display.newText( options )
    helpText:setFillColor( 1.0, 0.0, 0.0 )

    --
    -- Add some ground to stand on...
    --

    local ground = display.newImageRect( "ground.png", 960, 64 )
    ground.anchorX = 0
    ground.anchorY = 1
    ground.x = 0
    ground.y = display.contentHeight
    ground.name = "ground"
    
    -- https://docs.coronalabs.com/api/library/physics/addBody.html
    physics.addBody( ground, "static", { friction=0.3 } )

    --
    -- Add a platform to jump on...
    --

    local platform = display.newImageRect( "platform.png", 256, 64 )
    platform.x = 500
    platform.y = 500
    platform.name = "platform"
    
    physics.addBody( platform, "static", { friction=0.3 } )

    --
    -- Add a block to push...
    --

    block = display.newImageRect( "block.png", 90, 86 )
    block.x = 500
    block.y = -150

    physics.addBody( block, { density=5.0, friction=0.5, bounce=0.5 } )
    block.name = "block"

    --
    -- Finally, add Mario...
    --

	mario = display.newImageRect( "mario.png", 95, 125 )
	mario.x = 500
	mario.y = 100

    physics.addBody( mario, { density=5.0, friction=0.5, bounce=0.2 } )
    mario.isFixedRotation = true
    mario.name = "Mario"

    sceneGroup:insert( helpText )
    sceneGroup:insert( ground )
    sceneGroup:insert( platform )
	sceneGroup:insert( mario )

end

--------------------------------------------------------------------------------
-- As our game runs, Corona will generate an event called "enterFrame". If we 
-- listen for this event, we can use it as an opportunity to animate an object 
-- by changing some aspect of it each frame just before Corona renders the frame.
-- In this sample, we're using it to move our Mario image around via the 
-- keyboard.
--------------------------------------------------------------------------------
local function onEnterFrame()

    if mario == nil then
        return
    end

    if mario.isMovingLeft then

        mario.xScale = -1
        mario:applyLinearImpulse( -100, 0, mario.x, mario.y )

    elseif mario.isMovingRight then

        mario.xScale = 1
        mario:applyLinearImpulse( 100, 0, mario.x, mario.y )
    end

    --print( string.format("Mario's x = %d, y = %d", mario.x, mario.y) )

    if mario.isJumping == true then

        -- Apply some force to make Mario jump up.
        -- https://docs.coronalabs.com/api/type/Body/applyLinearImpulse.html
        mario:applyLinearImpulse( 0, -1600, mario.x, mario.y )

        mario.isJumping = false
    end

    local offScreen = 200

    if mario.x > screenW + offScreen then
        mario.x = -offScreen
    elseif mario.x < -offScreen then
        mario.x = screenW + offScreen
    end

    -- If Mario falls off the ground - reset his linear velocity and move him
    -- back to his starting point.
    if mario.y > screenH + 100 then

        mario:setLinearVelocity( 0.0, 0.0 )
        mario.x = 500
        mario.y = 0

    end

    if block.x > screenW + offScreen then
        block.x = -offScreen
    elseif block.x < -offScreen then
        block.x = screenW + offScreen
    end

    -- If block falls off the ground - reset both its linear & angular velocity 
    -- and move it back to its starting point.
    if block.y > screenH + 100 then

        block:setLinearVelocity( 0.0, 0 )
        block.angularVelocity = 0.0
        block.rotation = 0.0
        block.x = 500
        block.y = 0

    end

end

local function onKey( event )

    if event.keyName == "left" then

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

    elseif event.keyName == "space" then

        if event.phase == "down" then
            mario.isJumping = true 
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

		-- If the scene has been shown - add our listeners so we can start
		-- moving our Mario!
		Runtime:addEventListener( "enterFrame", onEnterFrame )
		Runtime:addEventListener( "key", onKey )

        -- https://docs.coronalabs.com/daily/api/event/collision/index.html
        Runtime:addEventListener( "collision", onCollision )

	end

end

function scene:hide( event )

	local phase = event.phase
	
	if phase == "will" then

		-- If the scene is going to be hidden - remove our listeners.
		-- There's no reason to move our Mario if no one can see him.
		Runtime:removeEventListener( "enterFrame", onEnterFrame )
		Runtime:removeEventListener( "key", onKey )
        Runtime:removeEventListener( "collision", onCollision )

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
