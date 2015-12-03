
-- Having a program or script print out "Hello World" is a programming tradition.
-- On the line below, print is a function that Lua gives us for free. We can use
-- it to print some text to the console. We'll talk more about functions later on, 
-- so don't worry.

print( "Hello World!" )

-- By the way, when a line of text starts with two hyphens '--', it's a comment.
-- Comments are just notes added by a programmer to explain what the code is doing.

-- If you want to have multiple lines of comments, you can bracket the lines with '--[[ ]]--'

--[[
	This is a multi-line comment for those who like to write a lot!
--]]

--==============================================================================

-- Variables are used to hold a value such as a number or a string of characters.
-- Below, we're creating a variable called var1 and assigning it the value of 10.
-- We then create a variable called var2 and assign it a string value.

local var1 = 10
local var2 = "This variable called var2 is a string!"

print( var1 )
print( var2 )

-- Lua is a Dynamically Typed language, therefore, variables can be reassigned to
-- other values even if the type is different than what was used to assign 
-- it initially.

var1 = "Now, our variable var1 is a string!"
var2 = 20

print( var1 )
print( var2 )

-- If you're uncertain of a value's type, use the type() function to see what it is.

print( type(var1) )
print( type(var2) )

-- Assigning nil to a variable deletes or invalidates it. This is used to let
-- Lua know that this variable is not currently set to any valid value.

var1 = nil
print( var1 )
print( type(var1) )

--==============================================================================
  
-- We can set strings with double quotes, single quotes, or double square brackets
-- for multi-line strings.

local myString1 = "Hello."

local myString2 = 'Hello.'

local myString3 = [[
	Hello. My name is Inigo Montoya.
	You killed my father. Prepare to die.
]]

print( myString1 )
print( myString2 )
print( myString3 )

-- Be careful though, you can't mix the usage of " and ' together.
-- local myString4 = "Hello.'
-- print( myString4 )

-- While we're talking about strings, notice how we're using two periods ".." 
-- in the print call below to combine two string values together. 

print( "Game " .. "Over!" )

-- This is called string concatenation and it's very useful when printing out
-- information when debugging.

print( "myString1 type is " .. type( myString1 ) )

--==============================================================================

-- You can use letters, digits, and underscores when naming your variables, but 
-- you can not start a variable with a digit.

local var   = 0 -- Fine.
local var1  = 0 -- Fine.
local var_1 = 0 -- Fine.
local _var  = 0 -- Fine.
-- local 1var  = 0 -- Syntax Error!

-- Also, you can't name your variables after any of Lua's reserved keywords:
--
-- and break do else elseif
-- end false for function if
-- in local nil not or repeat
-- return then true until while

--==============================================================================

-- By default, all variables in Lua are global unless you use the local keyword 
-- before them. Global variables are easy to use because they can be accessed
-- from anywhere, but the overuse of global variables can create code that is
-- very buggy. It's best to always put the local keyword in front of your
-- variables so they are restricted to either the script file or a function.

myGlobalVar = 10

local myLocalVar = 20

--==============================================================================

-- Besides numbers and strings we can also create variables of other types such
-- as tables and Booleans. Tables are special variables that allow us to hold 
-- a bunch of values under one variable name. Some languages call these kind of 
-- of variable an array. We'll talk more about tables later.

local myNumber = 10
local myString = "This is a string"
local myTable = { 2, 4, 6, 8, 10 }

print( "myNumber type is " .. type( myNumber ) )
print( "myString type is " .. type( myString ) )
print( "myTable type is " .. type( myTable ) )

-- Booleans are special variables that can only be set to either true or false.

local myBoolean = true
print( myBoolean )

myBoolean = false
print( myBoolean )

print( "myBoolean type is " .. type(myBoolean) )

-- Some languages also allow the number 0, to mean false - but not in Lua.
-- This is because If you set a Boolean variable to a number - Lua will change 
-- the variable to a number.

myBoolean = 0
print( myBoolean )
print( "myBoolean type is " .. type(myBoolean) )

--==============================================================================

-- Lua supports the automatic coercion of types. This is a fancy way of saying
-- that if you try to do math on a string variable that can be safely converted 
-- to a number - Lua will use the string just like a regular number.

local myNumber = 6
local myString = "6"
local sum = myNumber + myString

-- The following will print 12
print( sum )

-- Be careful though, if the string can not be converted to an actual number 
-- the Lua script will crash!

-- local myNumber = 6
-- local myString = "Kittty"
-- local sum = myNumber + myString -- This will crash!!!!!!

-- You can also force coercion of types via these Lua functions

local widthAsNumber = tonumber( "1024" )
local widthAsString = tostring( 1024 )

--==============================================================================

-- Using Escape Sequences

--[[

-- Use '\n' to break text onto the next line.
print( "Line 1.\nLine 2.\nLine 3.")

-- Use '\t' to insert tabs.
print( "Column 1\tColumn 2\tColumn 3")

-- Use '\"' to insert double quotes inside a double quoted string.
print( "He said, \"Hello. My name is Inigo Montoya. You killed my father. Prepare to die.\"" )

-- Use '\'' to insert single quotes inside a single quoted string.
print( 'He said, \'Hello. My name is Inigo Montoya. You killed my father. Prepare to die.\'' )

--]]

-- String Escape Sequences:
--
-- \a	bell
-- \v	vertical tab
-- \f	form feed
-- \n	newline
-- \r	return
-- \t	horizontal tab
-- \b	backspace
-- \\	backslash
-- \"	double quote
-- \'	single quote
-- \[	bracket
-- \]	bracket

--==============================================================================

-- Boolean Operators
--
--     and - Returns true if both expressions are true
--     or  - Returns true if either of the two expressions are true
--     not - Negates the expression.

--[[

local var1 = 10
print( var1 == 10 and var1 < 5 )               -- (Prints false)
print( var1 == 20 or var1 > 5 )                -- (Prints true)
print( not var1 == 10 )                        -- (Prints false)

print( var1 == 10 and tostring(var1) == "10" ) -- (Prints true)

--]]

--==============================================================================

--[[

local x = 5
local y = 5 + 5
print( x, y )

x, y = 20, 50 -- Initial assignment.
print( x, y )

x, y = y, x   -- Assignment that swaps values around.
print( x, y )

local a, a = 1, 2 -- Nonsensical, but if you're wondering the last assignment wins.
print( a )

--]]

--==============================================================================


