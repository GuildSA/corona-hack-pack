
--==============================================================================

-- A simple 'for' loop that loops or iterates 3 times and prints the index 
-- variable.

for i = 1, 3 do
    print( "i = " .. i )
end

--==============================================================================

-- This more complicated 'for' loop will start at 1 and then print all the odd
-- numbers from 1 to 10, by incrementing the index variable by 2 every iteration.

for i = 1, 10, 2 do
     print( "i = " .. i )
end

--==============================================================================

-- For loops are very useful when working with tables, but there are a couple of 
-- different ways of iterating the for loop and you need to make sure that you're 
-- using a method that works for your table.

-- There are basically 3 ways to iterate tables:
--
-- 1. We can use the pairs() function to access the key/value pairs. This is the 
--    most generic way and it works on both index and dictionary tables.
--    But, for index tables, it does NOT guarantee that the items will be 
--    accessed in the correct order.
--
-- 2. We can use the ipairs() function to access the index/value pairs of an
--    index table. This is faster than using pairs() and DOES guarantee that 
--    items will be accessed in the correct order, but it does not work on 
--    dictionary tables.

-- 3. Finally, we can use the length operator # to get the table size and then 
--    manually index into the table using square brackets []. This is the 
--    fastest way to access an index table and guarantee order, but it does 
--    not work on dictionary tables.
--

local indexTable =
{
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta"
}

print( "Print an index table using pairs(). Fast but order is NOT guaranteed." )

for i, v in pairs( indexTable ) do
    print( "Index: " .. i .. " = " .. v )
end

print( "Print an index table using ipairs(). Possibly slower but order IS guaranteed." )

for i, v in ipairs( indexTable ) do
    print( "Index: " .. i .. " = " .. v )
end

print( "Print an index table using # and manual indexing via []. Fast and order IS guaranteed." )

for i = 1, #indexTable do
    print( "Index: " .. i .. " = " .. indexTable[i] )
end


local dictionaryTable =
{
    a = "Alpha",
    b = "Bravo",
    c = "Charlie",
    d = "Delta"
}

print( "Print an dictionary table using pairs() ..." )
-- Note how order in a dictionary table is not guaranteed.

for k, v in pairs( dictionaryTable ) do
    print( "Key: " .. k .. " = " .. v )
end

-- We can use ipairs() on a mixed table, but be keep in mind, if we use ipairs() 
-- it will only iterate over index entries in the table and skip over the 
-- key/value pairs.

local mixedTable =
{
    10,
    "A String at index 2!",
    myNumber = 20,
    myString = "A String at key myString!",
    "A String at index 3!"
}

print( "It's best to use pairs() to iterate a mixed table ..." )

for k, v in pairs( mixedTable ) do
    print( "Key: " .. k .. " = " .. v )
end

--==============================================================================

-- Now, if there is a good reason to stop or exit a for loop early, we can use 
-- the 'break' keyword to stop the loop and exit out.

local numbers = { 100, 25, 125, 50, 150, 75, 175 }

for i = 1, #numbers do

    print( numbers[i] )

    -- As soon as we find 50 - stop the search by breaking out!
    if numbers[i] == 50 then

        print( "Found It!" )
        break

    end

end

-- Please Note: Unlike other languages, Lua has no 'continue' keyword.

print( "---" )

--==============================================================================

-- Where, 'for' loops are designed to loop over a collection of data, the 'while' 
-- loop continues looping while some expression is true.

local numRocketsToFire = 3
local rocketCount = 0

while rocketCount < numRocketsToFire do

    rocketCount = rocketCount + 1

    print( "Firing rocket #" .. rocketCount )

end

print( "---" )

--==============================================================================

-- We can also use the 'break' keyword on 'while' loops to break out or exit the 
-- loop.

local number = 0

while number < 10 do

    print( "while-break test " .. number )

	if number == 5 then
        break
    end

	number = number + 1

end

--==============================================================================

-- Finally, The 'repeat-until' loop is like an upside 'while' loop that continues looping
-- as long as some expression is false.

local number = 0

repeat

	print( "repeat-until test " .. number )

	number = number + 1

until number >= 5

