------------------------------------------------------------------------
--
-- main.lua
--
-- The script "main.lua" is always present in a Corona project and it 
-- acts as the main entry point for the game. In most games, not much 
-- happens here except for some basic set up. Once the basic setup 
-- is done, the main script will usually use the composer module to load 
-- another Lua script that actually starts the game or redirects the
-- user to the game's menu.
------------------------------------------------------------------------

-- If we run on an actual device - hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Use the require function to include the Corona "composer" module so 
-- we can use it to load a new scene.
local composer = require( "composer" )

-- Once we have access to composer, we can use it load or go to our 
-- scene that is stored in the "scene1.lua" script file.
composer.gotoScene( "scene1" )
