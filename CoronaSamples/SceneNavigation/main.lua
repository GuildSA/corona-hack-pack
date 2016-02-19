------------------------------------------------------------------------
--
-- main.lua
--
------------------------------------------------------------------------

-- If we run on an actual device - hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Use the require function to include the Corona "composer" module so 
-- we can load a scene.
local composer = require( "composer" )

-- Once we have access to composer, we can use it load or go to our scene 
-- that is stored in the "scene1.lua" script file.
composer.gotoScene( "scene1" )