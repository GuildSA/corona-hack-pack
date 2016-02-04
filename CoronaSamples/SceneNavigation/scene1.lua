-----------------------------------------------------------------------------------------
--
-- scene1.lua
--
-----------------------------------------------------------------------------------------

-- Require the widget library
local widget = require( "widget" )

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()


local button2Handler = function( event )
	print( "Going to scene 2!" )
	composer.gotoScene( "scene2", "slideLeft", 800  )
end

local button3Handler = function( event )
	print( "Going to scene 3!" )
	composer.gotoScene( "scene3", "slideUp", 800  )
end

local button4Handler = function( event )
	print( "Going to scene 4!" )
	composer.gotoScene( "scene4", "flip", 400  )
end


function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	print( "Create scene 1's view!" )

	local sceneGroup = self.view

	local helpText = display.newText( "Scene #1", 380, 150, native.systemFont, 55 )
	helpText:setFillColor( 1, 0, 0 )

	local scene2Button = widget.newButton {

		width = 380,
		height = 100,
		id = "btn2",
		defaultFile = "button_gray.png",
		overFile = "button_gray_over.png",
		label = "Go To Scene 2",
		labelColor = { default = { 51, 51, 51, 255 }, },
		font = native.systemFont,
		fontSize = 50,
		onEvent = button2Handler,
	}

	scene2Button.x = 380
	scene2Button.y = 400

	local scene3Button = widget.newButton {

		width = 380,
		height = 100,
		id = "btn3",
		defaultFile = "button_gray.png",
		overFile = "button_gray_over.png",
		label = "Go To Scene 3",
		labelColor = { default = { 51, 51, 51, 255 }, },
		font = native.systemFont,
		fontSize = 50,
		onEvent = button3Handler,
	}

	scene3Button.x = 380
	scene3Button.y = 525

	local scene4Button = widget.newButton {

		width = 380,
		height = 100,
		id = "btn4",
		defaultFile = "button_gray.png",
		overFile = "button_gray_over.png",
		label = "Go To Scene 4",
		labelColor = { default = { 51, 51, 51, 255 }, },
		font = native.systemFont,
		fontSize = 50,
		onEvent = button4Handler,
	}

	scene4Button.x = 380
	scene4Button.y = 650

	sceneGroup:insert( scene2Button )
	sceneGroup:insert( scene3Button )
	sceneGroup:insert( scene4Button )
	sceneGroup:insert( helpText )

end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then

		-- Called when the scene is still off screen and is about to move on screen

		print("Scene 1 will show.")

		display.setDefault( "background", 0.2, 0.5, 1 )

	elseif phase == "did" then

		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

		print("Scene 1 did show.")

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

		print("Scene 1 will hide.")

	elseif phase == "did" then

		-- Called when the scene is now off screen

		print("Scene 1 did hide.")

	end	
	
end

function scene:destroy( event )

	print( "Destroying scene 1's view!" )

end

---------------------------------------------------------------------------------

-- Add our event listeners so we can get notified of these scene events!
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

----------------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can make use of it.
return scene
