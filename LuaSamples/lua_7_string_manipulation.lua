
print( string.len( "" ) )
print( string.len( "Lua" ) )

print( string.upper( "Hello Lua user!" ) )
print( string.lower( "Hello Lua user!" ) )

print( string.rep( "Lua ", 5 ) )
print( string.rep( "Lua\n", 3 ) )

print( string.reverse( "Lua" ) )
print( string.reverse( "!elbadaer won si gnirts sihT" ) )

--==============================================================================

-- string.find() gives us the starting and ending character positions of a known
-- sub-string - if it exists.

local startIndex, endIndex = string.find( "Hello Lua user!", "Lua" )
print( "Succesful Search for 'Lua' = ", startIndex, endIndex )

startIndex, endIndex = string.find( "Hello Lua user!", "banana" )
print( "Failed search for 'banana' = ", startIndex, endIndex )

-- Start the search from char 8. "Lua" not found again after character 8.
startIndex, endIndex = string.find( "Hello Lua user", "Lua", 8 )
print( "Failed search for 'Lua' starting from char 8 = ", startIndex, endIndex )

-- Start the search 5 back from the end. Only sub-string "e" to find in that range is at 13.
startIndex, endIndex = string.find( "Hello Lua user", "e", -5 )
print( "Succesful search from the end forward for 'e' = ", startIndex, endIndex )

-- Be careful!
-- Since the period '.' represents a wildcard character, which can represent any 
-- character, this call to string.find will not return what you expect.
startIndex, endIndex = string.find("some_file.txt", ".")  
print( "Incorrect search for a period '.' = ", startIndex, endIndex )

-- We can turn off the pattern matching feature by using the optional fourth argument plain.
-- http://lua-users.org/wiki/PatternsTutorial

-- If we turn ON plain searches, we can actually search for the sub string '.'
startIndex, endIndex = string.find("some_file.txt", ".", 1, true)
print( "Successful search for a period '.' = ", startIndex, endIndex )

--==============================================================================

-- string.sub() extracts sub-strings based on position and returns them.

local myString = "Hello Lua user"
print( myString )
print( "The string length of myString is " .. string.len( myString ) .. " characters.\n" )

local subString = string.sub( myString, 7 ) -- Sub-string to pull starts at 7 and goes to the end.
print( "(7) = " .. subString )

subString = string.sub( myString, 7, 9 )   -- Sub-string to pull starts at 7 and goes to 9.
print( "(7,9) = " .. subString )

subString = string.sub( myString, -8 )     -- Sub-string to pull starts at 8 back from the end.
print( "(-8) = " .. subString )

subString = string.sub( myString, -8, 9 )  -- Sub-string to pull starts at 8 back from the end and goes to 9.
print( "(-8, 9) = " .. subString )

subString = string.sub( myString, -8, -6 ) -- Sub-string to pull starts at 8 back from the end and goes to 6 back from the end.
print( "(-8, -6) = " .. subString )

--==============================================================================

-- string.gsub() can replace all instances of the pattern provided with
-- the replacement.

-- Change every subs-string "World" to "Lua"
local initialString = "Hello World!"
local modifiedString = string.gsub( initialString, "World", "Lua" )
print( modifiedString )

--  Change all 'a' to 'A', but Limit substitutions to 2
initialString = "banana"
modifiedString = string.gsub( initialString, "a", "A", 2 )
print( modifiedString )

--==============================================================================

-- If a capture is used (i.e. '()' ) in the sub-string we're searching for, 
-- this can be referenced in the replacement string using the notation 
-- %<capture_index>.

-- Find every sub-string "an" and map it to %1. Then replace it with the same 
-- but add a "-" before and after it.
local subString = string.gsub( "banana", "(an)", "-%1-" )
print( subString )

-- Find every sub-string "an" and map just the 'n' to %1. Then replace sub-string
-- with same but add brackets around the 'n'
subString = string.gsub( "banana", "a(n)", "a[%1]" )
print( subString )

-- Find the substring "an" and map 'a' to %1 and 'n' to %2. Then reverse the sub
-- strings captured and place angle brackets around them.
subString = string.gsub( "banana", "(a)(n)", "<%2%1>" )
print( subString )

--==============================================================================

-- String formatting can be very useful in debugging Lua values.

local myString = string.format( "Test 1 = %s %q", "Hello", "Lua user!" ) -- String and quoted string
print( myString )

-- http://www.unit-conversion.info/texttools/ascii/#data

myString = string.format( "Test 2 = %c%c%c", 76, 117, 97 ) -- Char
print( myString )

myString = string.format( "Test 3 = %e, %E", math.pi, math.pi ) -- Exponent(lowercase E), exponent(uppercase E)
print( myString )

myString = string.format( "Test 4 = %f, %g", math.pi, math.pi ) -- Float and compact float
print( myString )

myString = string.format( "Test 5 = %d, %i, %u", -100, -100, 100 ) -- Signed integer, signed integer, unsigned integer
print( myString )

-- The Answer to the Ultimate Question of Life, The Universe, and Everything - 
-- converted by Lua.
myString = string.format( "Test 6 = %o, %x, %X", 42, 42, 42 ) -- Octal, Hex(lowercase), Hex(uppercase)
print( myString )

