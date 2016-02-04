-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Lets cache our display's width and height so our Mario can find the screen edges
-- while jumping around.
local screenW = display.contentWidth
local screenH = display.contentHeight

local walkingSprite = nil

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

    local options = 
    {
        text = "Use left and right arrow keys to switch walking direction!",
        x = 500,
        y = 150,
        width = 800,     -- Required for multi-line and alignment
        font = native.systemFont,   
        fontSize = 55,
        align = "center"
    }

    local helpText = display.newText( options )
    helpText:setFillColor( 1, 0, 0 )

	-- A sprite sheet with a gold coin.
	local coinSpriteSheet = graphics.newImageSheet( "coin.png", { width=64, height=64, numFrames=64 } )

	-- Play 64 frames every 1000 ms.
	local coinSprite = display.newSprite( coinSpriteSheet, { name="coin", start=1, count=64, time=1000 } )
	coinSprite.x = 200
	coinSprite.y = 450
	coinSprite.xScale = 2.5
	coinSprite.yScale = 2.5
	coinSprite:play()

	-- A sprite sheet with a green burst.
	local greenBurstSpriteSheet = graphics.newImageSheet( "green_burst.png", { width=100, height=100, numFrames=11 } )

	-- Play 11 frames every 1000 ms.
	local greenBurstSprite = display.newSprite( greenBurstSpriteSheet, { name="greenBurst", start=1, count=11, time=1000 } )
	greenBurstSprite.x = 500
	greenBurstSprite.y = 450
	greenBurstSprite.xScale = 2
	greenBurstSprite.yScale = 2
	greenBurstSprite:play()


	-- Tow sprite sheets with a man walking left and right.
	local walkingRightSpriteSheet = 
		graphics.newImageSheet( "walk_right.png", { width=102, height=148, numFrames=6 } )

	local walkingLeftSpriteSheet = 
		graphics.newImageSheet( "walk_left.png", { width=102, height=148, numFrames=6 } )

	local sequenceData = {
		{ name="walkRight", sheet=walkingRightSpriteSheet, start=1, count=6, time=800, loopCount=0 },
		{ name="walkLeft", sheet=walkingLeftSpriteSheet, start=1, count=6, time=800, loopCount=0 }
	}
	
	walkingSprite = display.newSprite( walkingRightSpriteSheet, sequenceData )
	walkingSprite.x = 800
	walkingSprite.y = 450
	walkingSprite.xScale = 2
	walkingSprite.yScale = 2
	walkingSprite:play()

	-- Make sure to add our Mario image to the scene group so we can render it.
	sceneGroup:insert( coinSprite )
	sceneGroup:insert( greenBurstSprite )
	sceneGroup:insert( walkingSprite )
	sceneGroup:insert( helpText )

end

local function onKeyEvent( event )

   if event.keyName == "left" then

		walkingSprite:setSequence( "walkLeft" )
		walkingSprite:play()

        return true

    elseif event.keyName == "right" then

		walkingSprite:setSequence( "walkRight" )
		walkingSprite:play()

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

		-- If the scene has been shown - add our listeners.
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
		Runtime:removeEventListener( "key", onKeyEvent )

	elseif phase == "did" then

		-- Called when the scene is now off screen

	end	
	
end

---------------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

----------------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can make use of it.
return scene
