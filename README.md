# CoronaHackPack
The CoronaHackPack is a collection of instructions, tutorials and code samples designed to help newbie coders learn the basics of scripting and game development using Lua and the Corona SDK.

This educational resource is being developed by The Guild of Software Architects for the [hack|ed hackathon](http://hack-ed.ntec-inc.org/) in February 26, 2016. This hackathon was conceived and organized by [The North Texas Enterprise Center (NTEC)](http://www.ntec-inc.org/), [Parish Episcopal School](http://www.parishepiscopal.org/), [iLLUMINATE STEM](http://www.illuminatestem.org/) and the [Guild of Software Architects](https://guildsa.org/).

If you're not familiar with GitHub, which is the website where this code is being hosted online, simply click on the "Download ZIP" button to get all the source code and learning materials. It can be found on the far right-hand side of this page.

```
NOTE: If you're reading these instructions directly from the README.md file in the CoronaHackPack root 
folder you may find it hard to read due to the usage of GitHub's Markdown language. You should read it 
from the project's GitHub page where it is more human readable.

https://github.com/GuildSA/CoronaHackPack
```

All of the setup instructions below can be seen as Youtube videos on the [The Guild of Software Architects official Youtube channel](https://www.youtube.com/channel/UCNliD5b2EZk4aRqLF9D7Mvg)

The video for setting up Lua & Corona on Mac OSX can be found [here](https://www.youtube.com/watch?v=hbr_gkvF9aU).

[![Setting up Lua and the Corona SDK for Mac OSX](http://img.youtube.com/vi/hbr_gkvF9aU/mqdefault.jpg)](https://youtu.be/hbr_gkvF9aU)

The video for setting up Lua & Corona on Windows can be found [here](https://www.youtube.com/watch?v=X88pGLkIlbg).

[![Setting up Lua and the Corona SDK for Windows](http://img.youtube.com/vi/X88pGLkIlbg/mqdefault.jpg)](https://youtu.be/X88pGLkIlbg)

##Install Lua

The Corona SDK will install it's own private version of Lua so the following steps to manually install Lua are only necessary if you want to run and test Lua scripts at a command prompt or terminal. 

In other words, if you have no interest in running stand-alone Lua scripts for learning purposes and plan on writing all of your Lua code completely from within a Corona SDK project you do not need to manually install Lua as done here; you can simply jump straight to the section on installing the Corona SDK.

###Setup for Windows

The latest installer for Lua on Windows can be found at [this GitHub page](https://github.com/rjpcomputing/luaforwindows/releases). Once there, find and click on the link that says [LuaForWindows_v5.1.4-50.exe](https://github.com/rjpcomputing/luaforwindows/releases/download/v5.1.4-50/LuaForWindows_v5.1.4-50.exe) to download the installer.

Once installed you should be able to run the "lua" command from the Windows Command Prompt.

To test your install, you can open a command prompt on Windows by clicking Start button, clicking All Programs, clicking Accessories, and then clicking Command Prompt.

Once the Command Prompt window opens, you can type "lua" and press enter.

```
lua
```

You can also open a command prompt at a particular folder by pressing and holding the Shift key and then right clicking on the folder and then selecting "Open Command Window Here". This is very useful if you want to run Lua from a folder that already has some Lua scripts in it.

--------------------------------------------------------------------------------

###Install Lua on Mac OSX

First off, go ahead and open up a terminal on your Mac by going to your Applications folder, and then opening the Utilities folder. Once there, open the Terminal application.

Now, type "brew" and press enter to see if you have Homebrew installed. Homebrew is a package manager for OS X that can help us install other software tools and libraries for us.

```
$ brew
```

If brew is installed you should see something like this:

```
$ brew
Example usage:
  brew [info | home | options ] [FORMULA...]
  brew install FORMULA...
  brew uninstall FORMULA...
  brew search [foo]
  brew list [FORMULA...]
  brew update
  brew upgrade [FORMULA...]
  brew pin/unpin [FORMULA...]
  ...
 ```

If you don't have Homebrew installed, install Homebrew by copying and pasting this into the terminal:

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Instructions for this were found [here](http://brew.sh/).

Then, use Homebrew to install Lua in the terminal by typing:

```
$ brew install lua
```

Once installed you should be able to run the "lua" command from the terminal.

```
$ lua
```

If successful, you should see something like this in the terminal:

```
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
> 
```

This is the command prompt for the Lua interpreter, which will allow you to write and run Lua code in the terminal window. Hold down the "control" key and press the "C" key to exit the Lua interpreter and return to the terminal prompt.

##Install and setup the Sublime Text editor

You can use any text editor you like for Lua or Corona SDK development, but Sublime Text 3 is the official editor used by Corona, so I highly recommend it if you simply have no preference of editor.

With that said, the following instructions are only for setting up the Sublime Text 3 editor for Lua and Corona SDK development.

[Download and install Sublime Text 3](http://www.sublimetext.com/3)

Install the package manager **Package Control** for **Sublime Text 3** so we can install some other useful features for Sublime.

1. [Go here...](https://packagecontrol.io/installation)
2. Copy the Python script from the tab for "SUBLIME TEXT 3".
3. Launch Sublime
4. Go to the menu 'View > Show Console' to open Sublime's console.
5. Paste the code into the console of Sublime and hit enter.
6. Installation progress will be displayed in the lower left corner of Sublime.
7. Restart Sublime

Use Package Control to install **Fix Mac Path** (**_This is only required if you're on a Mac._**)

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Fix Mac Path" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

Use Package Control to install **Lua Dev**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Lua Dev" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

Use Package Control to install **Corona Editor**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Corona Editor" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

--------------------------------------------------------------------------------

The following are optional packages for Sublime but are very useful for Lua development.

Use Package Control to install **SublimeLinter**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SublimeLinter" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6.  [More info...](http://www.sublimelinter.com/en/latest/index.html)

Use Package Control to install **SublimeLinter-Lua**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SublimeLinter-Lua" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6. [More info...](https://github.com/SublimeLinter/SublimeLinter-lua)

Use Package Control to install **SidebarEnhancements**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SidebarEnhancements" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6.  [More info...](https://github.com/titoBouzout/SideBarEnhancements)

Use Package Control to install **BracketHighlighter**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "BracketHighlighter" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6.  [More info...](https://github.com/facelessuser/BracketHighlighter)

##Install the Corona SDK

Go to  the [Corona SDK website](https://coronalabs.com/), sign up for a free account, and download the Corona SDK from [here](http://developer.coronalabs.com/user/login?destination=downloads/coronasdk).

--------------------------------------------------------------------------------

##List of Lua Videos

###Learning Lua - Ep 1 - Variables

In this video we will actually start to learn Lua scripting using our new Lua & Corona SDK development environment.

[Video Link](https://youtu.be/G8RUJxg1toU)

Source Used: lua_1_variables.lua

Keywords Used: local

Functions Used: print(), type(), tonumber(), tostring()

--------------------------------------------------------------------------------

###Learning Lua - Ep 2 - Tables

In this video we will learn about Lua's most powerful data type, tables, and how they're used to hold and organize collections of other data types such as numbers, strings, and even other tables.

[Video Link](https://youtu.be/3m1qjbd2l6s)

Source Used: lua_2_tables.lua

Functions Used: table.insert(), table.remove()

--------------------------------------------------------------------------------

###Learning Lua - Ep 3 - Conditional Logic

In this video we will learn how to use Lua's 'if' statements to write conditional logic that allows our scripts to perform different actions based on the value of a variable.

[Video Link](https://youtu.be/BASyTw7aG9o)

Source Used: lua_3_if_statements.lua

Keywords Used: if, then, else, elseif, end, and, or, not

Operators Used:

	<   Less than
	<=  Less than or equal to
	>   Greater than
	>=  Greater than or equal to
	==  Is equal to
	~=  Is not equal to

--------------------------------------------------------------------------------

###Learning Lua - Ep 4 - Looping or Iterating

In this video we will learn how to use Lua's 'for' and 'while' keywords to perform some repeated action or to loop or iterate through a table full of data.

[Video Link](https://youtu.be/h2jj6zFtxWE)

Source Used: lua_4_for_and_while_loops.lua

Keywords Used: for, then, end, do, while, repeat, until

Operators Used: # Length Operator

Functions Used: pairs(), ipairs()

--------------------------------------------------------------------------------

###Learning Lua - Ep 5 - Declaring Functions

In this video we will learn how to declare or write our very own functions in Lua. Functions are very important because they allow us to organize or reuse blocks of Lua code which we may need to use repeatedly.

[Video Link](https://youtu.be/tuz9wt6iRmU)

Source Used: lua_5_functions.lua

Keywords Used: function

--------------------------------------------------------------------------------

###Learning Lua - Ep 6 - Reference vs Copy

In this video we will learn the differences of working with table variables, which are implemented in Lua as references vs working with the other data types such as number, string, and boolean, which always generate copies during assignments and when passed into functions.

[Video Link](https://youtu.be/q76ydtcuIN8)

Source Used: lua_6_reference_vs_copy.lua

--------------------------------------------------------------------------------

##List of Corona SDK Videos

###The Corona SDK - Ep 1 - An Introduction

This video is an introduction to the Corona SDK with a brief comparison to a few other mobile game development platforms such as Unity and Marmalade. I will also demonstrate how to create a starter game using one of Corona's project templates and show you how to launch it from inside Sublime Text Edit 3.

[Video Link](https://youtu.be/kzG4DKzTgZk)

Sample Used: None

--------------------------------------------------------------------------------

###The Corona SDK - Ep 2 - Colors, Simple Text and an Image

In this video we will start to learn the basics of the Corona SDK by exploring a very minimal or simple app that sets the game's background color, creates some on-screen text and loads a single .png image file.

[Video Link](https://youtu.be/Lj3ui4VN1Fc)

Sample Used: Simple

Functions Used:

	display.setStatusBar() 
	display.setDefault()
	display.newText()
	display.newImageRect()

--------------------------------------------------------------------------------

###The Corona SDK - Ep 3 - Creating Scenes

In this video we will learn how to use a special module from Corona called "composer" that allows us to break up our game code into scenes.

[Video Link](https://youtu.be/lT2CY0XjhGc)

Sample Used: LoadImage

Functions Used:

	composer.gotoScene()
	composer.newScene()
	addEventListener( "create" )

--------------------------------------------------------------------------------

###The Corona SDK - Ep 4 - Navigating Between Scenes

In this video we will learn how to use a special module from Corona called "composer" to navigate between two scenes. We will also learn how to create and add a button to our game's user interface using the "widget" module.

[Video Link](https://youtu.be/9QzLsgxNMT0)

Sample Used: SceneNavigation

Functions Used:

	composer.gotoScene()
	widget.newButton()
	ddEventListener( "show" )
	addEventListener( "hide" )
	addEventListener( "destroy" )

--------------------------------------------------------------------------------

###The Corona SDK - Ep 5 - More on Text and Images

In this video we will learn more about working with text such as using custom fonts and how to scale and rotate image objects.

[Video Link](https://youtu.be/V0AgaGzl1YU)

Sample Used: LoadImage, Text

Functions Used:

	display.newText()
	setFillColor()
	xScale
	rotation

--------------------------------------------------------------------------------

###The Corona SDK - Ep 6 - User Input

In this video we will learn how to collect user input from the keyboard and use it to move an image around the screen. I'll also discuss how to use delta-time or, the amount of time that elapsed since the last frame, so we can move objects at consistent speed regardless of game's frame rate.

[Video Link](https://youtu.be/FB0ZayijyiY)

Sample Used: UserInput

Functions Used:

	system.getTimer()
	Runtime:addEventListener( "enterFrame" )
	Runtime:addEventListener( "key" )
	Runtime:removeEventListener( "enterFrame" )
	Runtime:removeEventListener( "key" )

--------------------------------------------------------------------------------

###The Corona SDK - Ep 7 - Touch Events and Transitions

In this video we will learn how to collect user input such as touch events on the game's scene and we'll learn how to smoothly move an image from one place to another using the transition.to() function which is part of Corona's transition module.

[Video Link](https://youtu.be/Ui-iJNVi_oI)

Sample Used: ScreenTouch

Functions Used:

	addEventListener( "touch" )
	transition.to()

--------------------------------------------------------------------------------

###The Corona SDK - Ep 8 - Chaining Transitions & Easing Functions

In this video we will learn how to chain two or more transitions together using transition.to(). We'll also learn how to use easing functions or algorithms to alter the speed of the transition over time so the image moves in a more natural way.

[Video Link](https://youtu.be/L6DB1-U-IKE)

Sample Used: TransitionTo

Functions Used:

	transition.to()
	easing.outExpo

--------------------------------------------------------------------------------

###The Corona SDK - Ep 9 - Manual Animation

In this video we will learn how to manually animate our Mario image so it appears to be jumping around the scene and bouncing off the scene's sides using simple math.

[Video Link](https://youtu.be/r6MJ2Ad7UW4)

Sample Used: ManualAnimation

Functions Used:

	system.getTimer()
	Runtime:addEventListener( "enterFrame" )
	Runtime:removeEventListener( "enterFrame" )

--------------------------------------------------------------------------------

###The Corona SDK - Ep 10 - Sprite Animation

In this video we will learn how to create animated sprites using a sprite sheet.

[Video Link](https://youtu.be/ltDDDv-kFZE)

Sample Used: SpriteAnimation

Functions Used:

	graphics.newImageSheet()
	display.newSprite()
	play()
	addEventListener( "sprite" )
	isVisible
	removeSelf()

--------------------------------------------------------------------------------

###The Corona SDK - Ep 11 - Animation Sequences

In this video we will learn how to create several animation sequences for an animated sprite using a single sprite sheet.

[Video Link](https://youtu.be/dLjSZiWFgoc)

Sample Used: SpriteAnimation2

Functions Used:

	graphics.newImageSheet()
	display.newSprite()
	setSequence()
	play()
	border
	loopCount
	loopDirection

--------------------------------------------------------------------------------

###The Corona SDK - Ep 12 - Directional Game Pad

In this video we will learn how to create a directional pad game or D-Pad using a custom module. We'll also discuss how to create a moving star field that could be used in a space themed game.

[Video Link](https://youtu.be/ms2klDf-vAI)

Sample Used: GamePad

Functions Used:

	display.newGroup()
	display.newCircle()
	display.newRect()

--------------------------------------------------------------------------------

###The Corona SDK - Ep 13 - Intro to the Physics Engine

In this video we will learn the basics of working with Corona's physics engine by building a small platformer styled game.

[Video Link](https://youtu.be/OL6BAXHN6Wk)

Sample Used: Physics

Functions Used:

	physics.setDrawMode()
	physics.start()
	physics.setGravity()
	physics.addBody()
	isFixedRotation
	applyForce()
	applyLinearImpulse()
	setLinearVelocity()
	angularVelocity
	rotation
