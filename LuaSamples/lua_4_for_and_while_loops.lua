
-- A simple 'for' loop that loops or iterates 3 times and prints the index 
-- variable.

for i = 1, 3 do
    print( "i = " .. i )
end

print( " " )

--==============================================================================

-- This more complicated 'for' loop will start at 1 and then print all the odd
-- numbers from 1 to 10, by incrementing the index variable by 2 every iteration.

for i = 1, 10, 2 do
     print( "i = " .. i )
end

print( " " )

--==============================================================================

-- The 'break' keyword can force a 'for' loop to stop iterating and exit out.
-- Please Note: Unlike other languages, Lua has no 'continue' keyword.

local numbers = { 100, 25, 125, 50, 150, 75, 175 }

for i = 1, #numbers do

    print( numbers[i] )

    -- As soon as we find 50 - stop the search by breaking out!
    if numbers[i] == 50 then

        print( "Found It!" )
        break

    end

end

print( " " )

--==============================================================================

-- For loops are very useful when working with tables, but there are a couple of 
-- different ways of driving or iterating the for loop and you need to make 
-- sure that you're using a method that works for your table.

-- There are basically 3 ways to iterate tables:
--
-- 1. Using # and manual indexing via [].
--    (Does not work on dictionary tables)
--
-- 2. Using pairs() to access the key/value pairs.
--    (Works on both index and dictionary tables)
--
-- 3. Using ipairs() to access the index/value pairs.
--    (Does not work on dictionary tables)

print( "Print an index table using # and manual indexing via []..." )

local indexTable =
{
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta"
}

for i = 1, #indexTable do
    print( i, indexTable[i] )
end



print( "Print an index table using ipairs() ..." )

for i, v in ipairs( indexTable ) do
    print( i, v )
end


print( "Print an dictionary table using pairs() ..." )
-- Note how order in a dictionary table is not guaranteed.

local dictionaryTable =
{
    a = "Alpha",
    b = "Bravo",
    c = "Charlie",
    d = "Delta"
}

for k, v in pairs( dictionaryTable ) do
    print( k, v )
end

print( "You can also use pairs() to iterate an index table ..." )

for k, v in pairs( indexTable ) do
    print( k, v )
end

print( "You cannot iterate a dictionary table using # and manual indexing via [] ..." )

for i = 1, #dictionaryTable do
    print( i, dictionaryTable[i] )
end

print( "You cannot iterate a dictionary table using ipairs() ..." )

for i, v in ipairs( dictionaryTable ) do
    print( i, v )
end

print( "It's best to use pairs() to iterate a mixed table ..." )
-- You can use ipairs() over pairs(), but be careful ipairs() only iterates
-- over index entries in a table. When in doubt - use pairs() over ipairs().

local mixedTable =
{
    10,
    "some string!",
    numberVar = 10,

    subTbl1 = indexTable,
    subTbl2 = dictionaryTable,

    subTbl3 =
    {
        var1 = 10,
        var2 = 100,
        var3 = "Another string"
    }
}

for k, v in pairs( mixedTable ) do
    print( k, v )
end

--==============================================================================

-- The 'while' loop continues looping while the expression is true.

local numRocketsToFire = 3
local rocketCount = 0

while rocketCount < numRocketsToFire do

    rocketCount = rocketCount + 1

    print( "Firing rocket #" .. rocketCount )

end

print( " " )

--==============================================================================

-- The 'break' keyword can also break out of a 'while' loop.

local number = 0

while number < 10 do

    print( "while-break test " .. number )

	if number == 5 then
        break
    end

	number = number + 1

end

print( " " )

--==============================================================================

-- The 'repeat-until' loop is like an upside 'while' loop that continues looping
-- as long as the expression is false.

local number = 0

repeat

	print( "repeat-until test " .. number )

	number = number + 1

until number >= 5


