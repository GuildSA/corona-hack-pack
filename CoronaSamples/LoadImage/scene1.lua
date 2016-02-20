------------------------------------------------------------------------
--
-- scene1.lua
--
-- The purpose of the "scene1.lua" script is define a new scene whose 
-- only job is to render an image of Mario on a light blue background.
------------------------------------------------------------------------

-- Use the require function to include the Corona "composer" module so 
-- we can create a new scene.
local composer = require( "composer" )

-- Use composer to create a new scene. 
local scene = composer.newScene()

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1 )

-- Declare a function on our scene called create. This will be called 
-- when the scene's view does not exist.
function scene:create( event )

	local sceneGroup = self.view

	-- https://docs.coronalabs.com/api/library/display/newImageRect.html

	local mario = display.newImageRect( "mario.png", 190, 250 )

	-- Position the Mario image by setting the image's X and Y positions.
	-- The X position moves Mario left and right.
	-- The Y position moves Mario up and down.
	mario.x = 500
	mario.y = 350

	-- Here's a few other things you can adjust on the Mario image:

	-- Setting the image's xScale property to -1 will flip Mario around so he faces the other way.
	--mario.xScale = -1

	-- You can rotate the image using the rotation property.
	--mario.rotation = 45
	
	-- Make sure to add our Mario image to the scene group so the
	-- scene will clean it up when this scene is destroyed.
	sceneGroup:insert( mario )

end

------------------------------------------------------------------------

-- Add an event listener for the create event so our create function 
-- above will get called.
-- https://docs.coronalabs.com/api/type/EventListener/addEventListener.html
-- https://docs.coronalabs.com/api/event/scene/index.html

scene:addEventListener( "create", scene )

------------------------------------------------------------------------

-- Finally, we return the scene that we just defined so composer can 
-- make use of it.
return scene

