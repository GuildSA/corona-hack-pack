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

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )

local jumpSoundId = nil
local getCoinSoundId = nil

local function marioTapListener( event )

	audio.play( jumpSoundId )
    return true

end

local function starCoinTapListener( event )

	audio.play( getCoinSoundId )
    return true

end

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	jumpSoundId = audio.loadSound( "mario_jump.wav" )
	getCoinSoundId = audio.loadSound( "get_coin.wav" )

	local mario = display.newImageRect( "mario.png", 190, 250 )
	mario.x = 350
	mario.y = 350
	mario:addEventListener( "tap", marioTapListener )

	local coin = display.newImageRect( "star_coin.png", 150, 146 )
	coin.x = 700
	coin.y = 350
	coin:addEventListener( "tap", starCoinTapListener )

	sceneGroup:insert( mario )

end

---------------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )

----------------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can make use of it.
return scene

