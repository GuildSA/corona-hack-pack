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
display.setDefault( "background", 0.2, 0.5, 1 )

function scene:create( event )

	local sceneGroup = self.view

	-- A sprite sheet with a gold coin.
	local coinSpriteSheet = graphics.newImageSheet( "coin.png", { width=64, height=64, numFrames=64 } )

	-- Play 64 frames over the time span of 1000 ms.
	local coinSprite = display.newSprite( coinSpriteSheet, { name="coin", start=1, count=64, time=1000 } )
	coinSprite.x = 500
	coinSprite.y = 380
	coinSprite.xScale = 2.5
	coinSprite.yScale = 2.5
	coinSprite:play()

	sceneGroup:insert( coinSprite )

end

------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene
