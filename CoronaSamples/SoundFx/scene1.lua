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

-- Lets cache our display's width and height so our Mario can find 
-- the screen edges while jumping around.
local screenW = display.contentWidth
local screenH = display.contentHeight

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- This will eventually hold our sound FX ids.
local jumpSoundId = nil
local getCoinSoundId = nil


-- This function will get called whenever the user taps on mario.
-- https://docs.coronalabs.com/api/event/tap/index.html
local function onTapListenerMario( event )

	audio.play( jumpSoundId )

    return true

end

-- This function will get called whenever the user taps on star.
local function onTapListenerStar( event )

	audio.play( getCoinSoundId )
	
    return true

end


function scene:create( event )

	local sceneGroup = self.view


	local helpText = display.newText( "Tap Mario or the coin for some sound FX!", 510, 200, native.systemFont, 55 )
	helpText:setFillColor( 1.0, 0.0, 0.0 )


	local mario = display.newImageRect( "mario.png", 190, 250 )
	mario.x = 350
	mario.y = 450
	mario:addEventListener( "tap", onTapListenerMario )

	local coin = display.newImageRect( "star_coin.png", 150, 146 )
	coin.x = 700
	coin.y = 450
	coin:addEventListener( "tap", onTapListenerStar )


	-- https://docs.coronalabs.com/api/library/audio/setVolume.html
	audio.setVolume( 1.0 )  -- Set the master volume.
	audio.setVolume( 0.1, { channel = 1 } ) -- Lower the volume on channel 1.


	-- Load the background or theme music as an audio stream.
	-- https://docs.coronalabs.com/api/library/audio/loadStream.html
	local backgroundMusic = audio.loadStream( "paper_mario_main_title.mp3")

	-- https://docs.coronalabs.com/api/library/audio/play.html
	local options =
	{
		channel = 1,  -- Play the background music on channel 1.
		loops = -1,   -- Loop infinitely so it never ends.
		fadein = 5000 -- Have the music fade in over 5 seconds.
	}

	-- https://docs.coronalabs.com/api/library/audio/play.html
	local backgroundMusicChannel = audio.play( backgroundMusic, options )

	print("backgroundMusicChannel = " .. backgroundMusicChannel)

	-- Pre-load our 2 sound FX and keep track of thier audio ids so 
	-- we can play them later.
	jumpSoundId = audio.loadSound( "mario_jump.wav" )
	getCoinSoundId = audio.loadSound( "get_coin.wav" )


	sceneGroup:insert( helpText )
	sceneGroup:insert( coin )
	sceneGroup:insert( mario )

end

------------------------------------------------------------------------

-- Add event listeners for all of the scene events we want to get called for!
scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene

