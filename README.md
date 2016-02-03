# CoronaHackPack
The CoronaHackPack is a collection of instructions, tutorials and code samples designed to help newbie coders learn the basics of scripting and game development using Lua and the Corona SDK.

This educational resource is being developed by The Guild of Software Architects for the [hack|ed hackathon](http://hack-ed.ntec-inc.org/) in February 26, 2016. This hackathon was conceived and organized by [The North Texas Enterprise Center (NTEC)](http://www.ntec-inc.org/), [Parish Episcopal School](http://www.parishepiscopal.org/), [iLLUMINATE STEM](http://www.illuminatestem.org/) and the [Guild of Software Architects](https://guildsa.org/).

```
NOTE: If you're reading these instructions directly from the README.md file in the CoronaHackPack root 
folder you may find it hard to read due to the usage of GitHub's Markdown language. You should read it 
from the project's GitHub page where it is more human readable.

https://github.com/GuildSA/CoronaHackPack
```

##Install Lua

The Corona SDK will install it's own private version of Lua so the following steps to manually install Lua are only necessary if you want to run and test Lua scripts at a command prompt or terminal. 

In other words, if you have no interest in running stand-alone Lua scripts for learning purposes and plan on writing all of your Lua code completely from within a Corona SDK project you do not need to manually install Lua as done here; you can simply jump straight to the section on installing the Corona SDK.

###Setup for Windows

On Windows, download and install [LuaForWindows_v5.1.4-46.exe](https://code.google.com/p/luaforwindows/)

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
3. In the edit box type "Fix Mac Path"" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

Use Package Control to install **Lua Dev**

1. Go to the menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Lua Dev" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime


At this point, you can test If you were successful in setting up Sublime for running simple Lua scripts by launching it and opening one of the sample Lua scripts that comes with the CoronaHackPack:

Start Sublime and open to the Lua script, "lua_1_variables.lua". It can be found at this path:

```
CoronaHackPack-master/LuaSamples/lua_1_variables.lua
```

Once the script has been opened in Sublime, go to the menu 'Tools > Build' to run the script. You can also hold down the "command" key and press the "B" key to execute it.

If the script executes, a console pane should appear at the bottom of Sublime and fill with some text that looks something like this:

```
false
myBoolean type is boolean
0
myBoolean type is number
12
[Finished in 0.1s]
```

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




