-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-- The purpose of the "level1.lua" script is define a new scene whose only job is to 
-- render an image of Mario on a light blue background.
-----------------------------------------------------------------------------------------

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 30 )

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )

local mario = nil
local spacePressed = false
local blockJumping = false

-- forward declarations and other locals
local screenW = display.contentWidth
local screenH = display.contentHeight
local halfW = display.contentWidth*0.5
local halfH = display.contentWidth*0.5

function onCollision( event )

    print("onCollision: ", event.object1.name, event.object2.name)

    if event.object1.name == "Mario" or event.object2.name == "Mario" then            
        blockJumping = false
    end

end

-- Declare a function on our scene called create.
function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

    local options = 
    {
        text = "Use left and right arrow keys to move and space bar to jump!",
        x = 500,
        y = 150,
        width = 800,     -- Required for multi-line and alignment
        font = native.systemFont,   
        fontSize = 55,
        align = "center"
    }

    local helpText = display.newText( options )
    helpText:setFillColor( 1, 0, 0 )

    --
    -- Add some ground to stand on...
    --

    local ground = display.newImageRect( "ground.png", 960, 64 )
    ground.anchorX = 0
    ground.anchorY = 1
    ground.x = 0
    ground.y = display.contentHeight
    ground.name = "ground"
    
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
    -- Finally, add Mario...
    --

	mario = display.newImageRect( "mario.png", 95, 125 )
	mario.x = 500
	mario.y = 200

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
local function onFrameEnter()

    if mario == nil then
        return
    end

    -- local deltaTime = getDeltaTime()

    -- local moveSpeed = (0.5 * deltaTime)

    if mario.isMoving then

        if mario.direction == "left" then

            mario.xScale = -1
            mario:applyLinearImpulse( -100, 0, mario.x, mario.y )

        elseif mario.direction == "right" then

            mario.xScale = 1
            mario:applyLinearImpulse( 100, 0, mario.x, mario.y )
        end

        print( string.format("Mario's x = %d, y = %d", mario.x, mario.y) )

    end

    if spacePressed == true and blockJumping == false then

        blockJumping = true
        mario:applyLinearImpulse( 0, -1500, mario.x, mario.y )

    end

    spacePressed = false

end

local function onKeyEvent( event )

    if event.keyName == "left" then

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

    elseif event.keyName == "space" then

        if event.phase == "up" then
            spacePressed = true
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
        Runtime:addEventListener( "collision", onCollision )

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
        Runtime:removeEventListener( "collision", onCollision )

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
