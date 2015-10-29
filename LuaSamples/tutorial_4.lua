
--[[

-- A simple Lua function that prints "Game Over!".

function printGameOver()

	print( "Game Over!" )

end

printGameOver()

--]]

--==============================================================================

--[[

-- A Lua function that takes a single argument and prints "Game Over... "
-- with a player's name appended to the end.

function printGameOver( playersName )

	print( "Game Over... " .. playersName )

end

printGameOver( "1337_haXor" )

--]]

--==============================================================================

--[[

-- A Lua function that takes two arguments.

function printGameOver( playersName, totalKills )

	print( "Game Over... " .. playersName .. "!" )
	print( "Total Kills: " .. totalKills )

end

printGameOver( "1337_haXor", 15 ) -- Correct argument order.
printGameOver( 12, "killaHurtz" ) -- Incorrect argument order!

--]]

--==============================================================================

--[[

-- A simple Lua function that takes two arguments and returns a single value.

function incrementCount( number, amountToInc )

    return number + amountToInc

end

local number = 0
print( number )

number = incrementCount( number, 10 )
print( number )

-- Leaving off trailing arguments is possible, but be ready to handle their absence.
--number = incrementCount( number )
--print( number )

--]]

--==============================================================================

--[[

function testFunc( someVar )

    print( someVar )

end

-- Typical calling style using ().
testFunc( "Hello World!" )

-- Non-typical calling style without (). Avoid this style!
testFunc "Hello World!"

-- Here's an example where the lack of () causes problems.
--testFunc "Hello " .. "World!"

--]]

--==============================================================================

--[[

function testFunc( someVar )

    print( someVar )

end

local tableWithFunc =
{
    aNumber = 55,
    aString = "test",
    aFunc = testFunc
}

tableWithFunc.aFunc( "You can store and call a function from a table!" )

--]]

--==============================================================================

--[[

-- A function that returns the average value of the values contained in a table.

function average( numberList )

	local numCount = 0
	local runningTotal = 0

	for i = 1, #numberList do

		numCount = numCount + 1
		runningTotal = runningTotal + numberList[i]

	end

	return runningTotal / numCount

end

local myNumbers = { 5.0, 7.0, 8.0, 2.0 }

local theAverage = average( myNumbers )

print( "The average of the list is " .. theAverage .. ".\n" )


--]]

--==============================================================================

--[[

-- A function that returns the average value and the total number of values 
-- contained in a table.

local myNumbers = { 5.0, 7.0, 8.0, 2.0 }

function averageAndCount( numberList )

	local numCount = 0
	local runningTotal = 0

	for i = 1, #numberList do

		numCount = numCount + 1
		runningTotal = runningTotal + numberList[i]

	end

    -- Return both the average and the number of values present.
	return runningTotal / numCount, numCount

end

local theAverage, numberCount = averageAndCount( myNumbers )

print( "The average of the list is " .. theAverage .. "." )
print( "The list contained " .. numberCount .. " numbers." )

--]]

--==============================================================================

--[[

-- This Lua function can print two arguments, but what if we want to print
-- N number of arguments?

function printTwoVars( var1, var2 )

    print( var1 )
    print( var2 )

end

printTwoVars( 1, 2 )

-- The '...' operator tells Lua to support a Variable Arguments table which
-- is always named 'arg'.

function printManyVars( var1, var2, ... )

    print( var1 )
    print( var2 )

    -- The extra arguments are stored in the "arg" table.

    for i = 1, #arg do
         print( arg[i] )
    end

end

printManyVars( 10, 20, 30 )
printManyVars( 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000 )

--]]

--==============================================================================

--[[

-- Be careful, Lua is Dynamically Typed, so the user could pass anything
-- including nil as arguments. It's your job to verify the input!

function incrementCount( number, amountToInc )

    -- Check to see if we have at least one non-nil value to work with.
    if number == nil then

        print( "Error calling incrementCount() - You must pass at least one number to increment." )
        return nil

    end

    -- Check to make sure that the number argument is actually a number.
    if type( number ) ~= "number" then

        print( "Error calling incrementCount() - All arguments must be numbers." )
        return nil

    end

    -- If amountToInc is not nil... check to make sure that it is number as well.
    if amountToInc ~= nil then

        if type( amountToInc ) ~= "number" then

            print( "Error calling incrementCount() - All arguments must be numbers." )
            return nil

        end

    end

    -- Below is a very common Lua convention for dealing with possible nil
    -- arguments that can be set to some default value.

    -- If amountToInc is nil... set its value to be 1 as a default value.
    amountToInc = amountToInc or 1

    return number + amountToInc

end

local number = 5
number = incrementCount( number )
print( number )

number = 5
number = incrementCount( number, 10 )
print( number )

--number = 5
--number = incrementCount()
--print( number )

--number = 5
--number = incrementCount( number, "blah" )
--print( number )


--]]
