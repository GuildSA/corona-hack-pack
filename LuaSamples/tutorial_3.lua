--==============================================================================
--File:     tutorial_3.lua
--Author:   Kevin Harris
--Date:     March 25, 2015
--Descript: 
--Note:
--==============================================================================

--[[

-- A simple 'for' loop that loops or iterates 3 times and prints the index variable.

for i = 1, 3 do

    print( "i = " .. i )

end

print( " " )

--]]

--==============================================================================

--[[

-- This more complicated 'for' loop will start at 1 and then print all the odd
-- numbers from 1 to 10, by incrementing the index variable by 2 every iteration.

for i = 1, 10, 2 do

     print( "i = " .. i )

end

--]]

--==============================================================================

--[[

-- Also, 'for' loops can iterate over tables by using the # operator which tells 
-- the 'for' loop how many items are being stored in the table.

local weapons = 
{
    "Pistol",
    "Rifle",
    "Grenade",
    "Shotgun",
    "Rocket Launcher",
    "Phased Plasma Rifle (in the 40 watt range)"
}

for i = 1, #weapons do

    print( weapons[i] )

end

--]]

--==============================================================================

--[[

-- The 'break' keyword can force a 'for' loop to stop iterating and exit out.
-- Please Note: Unlike C#, Lua has no 'continue' keyword.

local numbers = { 100, 25, 125, 50, 150, 75, 175 }

for i = 1, #numbers do

    print( numbers[i] )

    -- As soon as we find 50 - stop the search by breaking out!
    if numbers[i] == 50 then

        print( "Found It!" )
        break

    end

end

--]]

--==============================================================================

--[[

-- The 'while' loop continues looping while the expression is true.

local numRocketsToFire = 3
local rocketCount = 0

while rocketCount < numRocketsToFire do

    rocketCount = rocketCount + 1

    print( "Firing rocket #" .. rocketCount )

end

--]]

--==============================================================================

--[[

-- The 'break' keyword can also break out of a 'while' loop.

local number = 0

while number < 10 do

    print( "while-break test " .. number )

	if number == 5 then
        break
    end

	number = number + 1

end

--]]

--==============================================================================

--[[

-- The 'repeat-until' loop is like an upside 'while' loop that continues looping
-- while the expression is false instead of true.

local number = 0

repeat

	print( "repeat-until test " .. number )

	number = number + 1

until number >= 5

--]]
