# CoronaHackPack
The CoronaHackPack is a collection of instructions, tutorials and code samples designed to help newbie coders learn the basics of scripting and game development using Lua and the Corona SDK.

This educational resource is being developed by The Guild of Software Architects for the [hack|ed hackathon](http://hack-ed.ntec-inc.org/) in February 26, 2016. This hackathon was conceived and organized by [The North Texas Enterprise Center (NTEC)](http://www.ntec-inc.org/), [Parish Episcopal School](http://www.parishepiscopal.org/), [iLLUMINATE STEM](http://www.illuminatestem.org/) and the [Guild of Software Architects](http://www.guildsa.org/).

##Install Lua

While the Corona SDK will install it's own private version of Lua, it's good to go ahead install Lua in the typical way so we can run and test Lua scripts at a command prompt or terminal.

###Setup for Windows

On Windows, download and install [LuaForWindows_v5.1.4-46.exe](https://code.google.com/p/luaforwindows/)

Once installed you should be able to run the lua command from the Windows Command Prompt.

To test your install, you can open a command prompt on Windows by clicking Start button, clicking All Programs, clicking Accessories, and then clicking Command Prompt.

Once the Command Prompt window opens, you can type lua and press enter.

```
lua
```

You can also open a command prompt at a particular folder by pressing and holding the Shift key and then right clicking on the folder and then selecting "Open Command Window Here". This is very useful if you want to run Lua from a folder that already has some Lua scripts in it.

--------------------------------------------------------------------------------

###Install Lua on Mac OSX

First off, go ahead and open up a terminal on your Mac by going to your Applications folder, and then opening the Utilities folder. Once there, open the Terminal application.

Now, type brew and press enter to see if you have Homebrew installed.

```
brew
```

If you don't have Homebrew installed, install Homebrew by copying and pasting this into a terminal:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Instructions for this were found [here](http://brew.sh/).

Then, use Homebrew to install Lua in the terminal by typing:

```
brew install lua
```

Once installed you should be able to run the "lua" command from the console.

##Install and setup the Sublime Text editor

While you can use any text editor you like to write Lua scripts, Sublime Text 3
is the official editor used by Corona so we'll go with that.

[Download and install Sublime Text 3](http://www.sublimetext.com/3)

Install **Package Control** for **Sublime Text 3** so we can install several other packages.

1. [Go here...](https://packagecontrol.io/installation)
2. Copy the Python script from the tab for "SUBLIME TEXT 3"
3. Paste the code into the console of Sublime and hit enter.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

Use Package Control to install **Fix Mac Path** (**_This is only required if you're on a Mac._**)

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Fix Mac Path"" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

Use Package Control to install **Lua Dev**

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Lua Dev" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5.Restart Sublime
6. Open a Lua script and go to the menu 'Tools > Build' to run the script.

Use Package Control to install **Corona Editor**

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "Corona Editor" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime

--------------------------------------------------------------------------------

The following are optional but very useful.

Use Package Control to install **SublimeLinter**

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SublimeLinter" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6.  [More info...](http://www.sublimelinter.com/en/latest/index.html)

Use Package Control to install **SublimeLinter-Lua**

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SublimeLinter-Lua" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6. [More info...](https://github.com/SublimeLinter/SublimeLinter-lua)

Use Package Control to install **SidebarEnhancements**

1. Go to menu 'Preferences > Package Control'
2. In the edit box type "Install Package" to find and select it.
3. In the edit box type "SidebarEnhancements" to find and select it.
4. Installation progress will be displayed in the lower left corner of Sublime.
5. Restart Sublime
6.  [More info...](https://github.com/titoBouzout/SideBarEnhancements)

##Install the Corona SDK

Download the Corona SDK from [here](https://coronalabs.com/)
