------------------------------------------------------------------------
--
-- main.lua
--
-- The script "main.lua" is always present in a Corona project and it 
-- acts as the main entry point for the game. In most games, not much 
-- happens here except for some basic set up.
------------------------------------------------------------------------

-- If we run on an actual device - hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Set the background color to a light blue color. 
display.setDefault( "background", 0.2, 0.5, 1.0 )

-- Please Note, all colors in Corona are set using 3 values that map to 
-- Red, Green, and Blue. These values must be in the range from 0.0 to 1.0
--display.setDefault( "background", 1.0, 0.0, 0.0 ) -- Pure Red
--display.setDefault( "background", 0.0, 1.0, 0.0 ) -- Pure Green
--display.setDefault( "background", 0.0, 0.0, 1.0 ) -- Pure Blue

-- If you want to use colors that are specified as 3 values in the 
-- range 0 to 255, you will need to convert the values into the range
-- 0.0 to 1.0 by dividing them by 255 like this.
--display.setDefault( "background", 254/255, 153/255, 53/255 ) -- Corona Orange.

local helloText = display.newText( "Hello, Corona SDK!", 380, 120, native.systemFont, 55 )

local coronaAd = display.newImageRect( "corona.png", 540, 750 )

coronaAd.x = 380
coronaAd.y = 620
