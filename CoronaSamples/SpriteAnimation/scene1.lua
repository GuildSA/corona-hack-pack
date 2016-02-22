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

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- Forward declarations and other locals.
local screenW = display.contentWidth
local screenH = display.contentHeight
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

-- This will eventuality hold a sprite sheet with a green burst.
local greenBurstSpriteSheet = nil


local function spriteListenerGreenBurst( event )

    local thisSprite = event.target  -- "event.target" references the sprite

    if event.phase == "ended" then

       	thisSprite.isVisible = false
        thisSprite:removeSelf()
        thisSprite = nil

    end

end

-- This is our call-back function for touch events on our background 
-- rectangle.
local function onBackgroundTouch( event )

	if event.phase == "ended" then 

		-- Play 11 frames over the time span of 1000 ms.
		local options =
		{
			name = "greenBurst",
			start = 1,
			count = 11,
			time = 1000,
			loopCount = 1 -- Play just once and then stop.
		}

		local greenBurstSprite = display.newSprite( greenBurstSpriteSheet, options )

		greenBurstSprite.x = event.x
		greenBurstSprite.y = event.y
		greenBurstSprite.xScale = 2
		greenBurstSprite.yScale = 2
		greenBurstSprite:addEventListener( "sprite", spriteListenerGreenBurst )
		greenBurstSprite:play()

	end

	return true

end

function scene:create( event )

	local sceneGroup = self.view

	-- Create a simple rectangle object to catch touch events. We will use this to
	-- move Mario from his current position to a new position which will be specified
	-- by touching the screen.
	local background = display.newRect( 0, 0, screenW, screenH )
	background.x = halfW
	background.y = halfH
	background:setFillColor( 0.2, 0.5, 1.0 )
	background:addEventListener( "touch", onBackgroundTouch )


    local textOptions = 
    {
        text = "Tap the screen to create animated sprites!",
        x = 500,
        y = 150,
        width = 700,
        font = native.systemFont,   
        fontSize = 55,
        align = "center"
    }

    local helpText = display.newText( textOptions )
    helpText:setFillColor( 1.0, 0.0, 0.0 )


	-- A sprite sheet with a gold coin.
	-- https://docs.coronalabs.com/api/library/graphics/newImageSheet.html

	local coinSpriteSheet = graphics.newImageSheet( "spinning_coin.png", { width = 64, height = 64, numFrames = 64 } )

	-- Play 64 frames over the time span of 1000 ms.
	local coinSprite = display.newSprite( coinSpriteSheet, { name = "spinningCoin", start = 1, count = 64, time = 1000 } )
	coinSprite.x = 500
	coinSprite.y = 480
	coinSprite.xScale = 2.5
	coinSprite.yScale = 2.5
	coinSprite:play()


	-- A sprite sheet with a green burst.
	greenBurstSpriteSheet = graphics.newImageSheet( "green_burst.png", { width = 100, height = 100, numFrames = 11 } )


	sceneGroup:insert( background )
	sceneGroup:insert( helpText )
	sceneGroup:insert( coinSprite )

end

------------------------------------------------------------------------

-- Add event listeners for all of the scene events we want to get called for!
scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene
