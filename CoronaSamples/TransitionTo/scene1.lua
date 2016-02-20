------------------------------------------------------------------------
--
-- scene1.lua
--
-- Learn about Corona Transitions:
-- https://docs.coronalabs.com/api/library/transition/
--
-- Learn about Corona Easing Functions:
-- https://docs.coronalabs.com/daily/api/library/easing/index.html
--
-- A visual guide to Easing Functions:
-- http://easings.net/
------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- This will eventually hold our Lakitu image.
local lakitu = nil

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- Declare two variables to hold our functions that move Lakitu. 
local moveLakituLeft
local moveLakituRight

moveLakituLeft = function( obj )

	-- Set the xScale back to 1 so Lakitu will face in his original direction.
	lakitu.xScale = 1

	-- This transition will make Lakitu move left and when he gets 
	-- there, the transition will call the moveLakituRight function to 
	-- move him back.
	local params =
	{
		time = 2000,
		x = 80,
		transition = easing.outExpo,
		onComplete = moveLakituRight
	}

	transition.to( lakitu, params )

end

moveLakituRight = function( obj )

	-- Set Lakitu's xScale to -1 to flip the direction that he faces.
	lakitu.xScale = -1

	-- This transition will make Lakitu move right and when he gets 
	-- there, the transition will call the moveLakituLeft function to 
	-- move him back.
	local params =
	{
		time = 2000,
		x = 940,
		transition = easing.outExpo,
		onComplete = moveLakituLeft
	}

	transition.to( lakitu, params )

end

function scene:create( event )

	local sceneGroup = self.view

	lakitu = display.newImageRect( "lakitu.png", 282, 350 )
	lakitu.x = 940
	lakitu.y = 350

	sceneGroup:insert( lakitu )

	-- Since Lakitu starts on the right side of the screen, as soon as the 
	-- scene is created, make him move left.
	moveLakituLeft()

end

------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene
