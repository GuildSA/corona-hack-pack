
-- The three types of tables...

-- An index table contains only non-named or non-keyed values.

local indexTable =
{
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta"
}

-- A dictionary table contains only named or keyed values.

local dictionaryTable =
{
    a = "Alpha",
    b = "Bravo",
    c = "Charlie",
    d = "Delta"
}

-- A mixed table contains a mix of indexed and named values.

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

--==============================================================================


--[[

-- An Index Table.

myTableOfNumbers = { 2, 4, 6, 8, 10 }

print( myTableOfNumbers[1] )
print( myTableOfNumbers[2] )
print( myTableOfNumbers[5] )

print( myTableOfNumbers[0] ) -- Lua does not start counting at 0 - so nil.
print( myTableOfNumbers[6] ) -- No value stored at index 6 - so also nil.

-- A Dictionary Table of key/value pairs.

myWeaponTable = {
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

print( myWeaponTable.name )      -- The typical way to access a key.
print( myWeaponTable["name"] )   -- This is also valid.

print( myWeaponTable.enchanted ) -- The key 'enchanted' doesn't exist... yet
myWeaponTable.enchanted = true   -- But setting it will add it.
print( myWeaponTable.enchanted )

--]]

--==============================================================================

--[[

-- There are basically 3 ways to iterate tables:
--
-- 1. Using # and manual indexing via [].
--    (Does not work on dictionary tables)
--
-- 2. Using ipairs() to access the index/value pairs.
--    (Does not work on dictionary tables)
--
-- 3. Using pairs() to access the key/value pairs.
--    (Works on both index and dictionary tables)
--

print( "Print an index table using # and manual indexing via []..." )

for i = 1, #indexTable do
    print( i, indexTable[i] )
end

print( "Print an index table using ipairs() ..." )

for i, v in ipairs( indexTable ) do
    print( i, v )
end

print( "Print an dictionary table using pairs() ..." )
-- Note how order in a dictionary table is not guaranteed.

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

for k, v in pairs( mixedTable ) do
    print( k, v )
end

--]]

--==============================================================================

--[[

-- Tables can be sorted using a custom sort function.

local numTable = {}

for indx = 1, 10 do

    numTable[indx] = math.random( 1,100 )

end

-- This is our custom sort function which defines what it means for one entry in
-- the table to be greater than the other.
function sortGreater( a, b )

    return a > b

end

print( "Before Sorting:" )

for i = 1, #numTable do
    print( "value at index " .. i .. " is " .. numTable[i] )
end

-- Now, use our custom sort function on our table of numbers.
table.sort( numTable, sortGreater )

print( "After Sorting:" )
for i = 1, #numTable do
    print( "value at index " .. i .. " is " .. numTable[i] )
end

--]]

--==============================================================================

--[[

-- Existing tables can be modified using insert() and remove().

function printBreakfastTable( tbl )

    for k,v in pairs( tbl ) do
        print( k .. " = " .. v )
    end

end

local breakfastTable = { "coffee" }

printBreakfastTable( breakfastTable )

print( "\nInsert - eggs and bacon" )

table.insert( breakfastTable, "eggs" )
table.insert( breakfastTable, "bacon" )

printBreakfastTable( breakfastTable )

print( "\nInserting to a specific index - muffin to index 1." )

table.insert( breakfastTable, 1, "muffin" ) -- Doesn't erase 1 but inserts and pushes everything down 1.

printBreakfastTable( breakfastTable )

print( "\nRemoving, but not specifying an index will default to removing the last entry, which is bacon." )

table.remove( breakfastTable ) -- Removes last item, which is "bacon".

printBreakfastTable( breakfastTable )

print( "\nRemoving - muffin at index 1" )

table.remove( breakfastTable, 1 ) -- Removes first item, which is "muffin".

printBreakfastTable( breakfastTable )

print( "\nRemoving - index 6 - does nothing" )

table.remove( breakfastTable, 6 ) -- Does nothing! There was nothing at index 6

printBreakfastTable( breakfastTable )

print( "\nRemoving - index 2 - eggs" )

local valueThatWasRemoved = table.remove( breakfastTable, 2 ) -- Remove "eggs" and catch return.

printBreakfastTable( breakfastTable )

print( "valueThatWasRemoved = " .. valueThatWasRemoved .. "\n" )

--]]

--==============================================================================

--
-- Be careful of creating insertions that force nil entries! Strange behavior 
-- will ensue!
--

--[[

function printBreakfastTable( tbl )

    for k,v in pairs( tbl ) do
        print( k .. " = " .. v )
    end

end

-- Set a new breakfast table.
local breakfastTable = {}
table.insert( breakfastTable, "coffee" )
table.insert( breakfastTable, "eggs" )
table.insert( breakfastTable, "bacon" )
table.insert( breakfastTable, "muffin" )

print( "\nInserting to a specific index - toast to index 10." )

-- Doesn't cause creation of elements 5-9 but count will be different depending on
-- how you ask the question. Also, manually indexing and using ipairs on the table 
-- will not get you entries such as "toast" since there exists nil entries between 
-- it and the table's beginning entries.
table.insert( breakfastTable, 10, "toast" )

printBreakfastTable( breakfastTable )

print( "Using '#'' on breakfastTable says it contains " .. #breakfastTable .. " items, but that's not true!" )
print( "Using maxn on breakfastTable says it can hold up to " .. table.maxn( breakfastTable ) .. " items, but are they set to anything valid?" )

print( "\nRemoving - toast at index 10 will not work if the table has nil values." )

table.remove( breakfastTable, 10 )

printBreakfastTable( breakfastTable )

--]]

--==============================================================================

--[[

-- Tables can also contain other tables...

-- Create an empty table.
local weaponTable = {}

-- Now, store another table into it at index 1.
weaponTable[1] = 
{
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

-- Again, store another table into it at index 2.
weaponTable[2] =
{
    name = "Club",
    type = "weapon",
    damage = 7,
    cost = 10
}

-- If weaponTable only holds tables, this will just print out table addresses.
for i = 1, #weaponTable do
    print( i, weaponTable[i] )
end

-- Use pairs and indexed access to access a subtable's data!
for k,v in pairs( weaponTable[1] ) do
    print( k .. " = " .. tostring( v ) )
end


-- Direct access to subtable through index and key name.
print( weaponTable[1].name )
print( weaponTable[2].name )

-- You can also reference the subtables and work on them that way.
local weapon1 = weaponTable[1]
local weapon2 = weaponTable[2]

print( weapon1.name )
print( weapon2.name )

--]]

--==============================================================================

--[[

-- Please Note: The table type is the only type that passes by reference.
-- This allows a table, that has been passed into a function, to be changed
-- directly unlike other types that are always passed as a copy of the original.

-- Here, we reate a function that can make any weapon enchanted and will  
-- automatically charge the player the correct amount.
function makeWeaponEnchanted( weapon, gold )

    -- Modify a table... yes, this will work. It's a reference!
    weapon.name = "Enchanted " .. weapon.name
    weapon.type = "enchanted_weapon"
    weapon.damage = weapon.damage * 5
    weapon.cost = weapon.cost * 10

    -- Modify a non-table variable... no, this will NOT work. It's a copy!
    gold = gold - weapon.cost

end


local selectedWeapon =
{
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

local goldPieces = 100

print( "selectedWeapon before enchantment..." )

for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

print()
print( "goldPieces = " .. goldPieces )
print()

makeWeaponEnchanted( selectedWeapon, goldPieces )

print( "selectedWeapon after enchantment..." )

for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

print()
print( "goldPieces = " .. goldPieces )
print()

--]]

--==============================================================================

--[[

-- Because tables are passed by reference, making an actual copy of one is more
-- complicated than simply assigning a table variable to a new variable.

local selectedWeapon =
{
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

print("selectedWeapon")

for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

-- This will NOT make a copy of the table, but results in the original table
-- being shared between the two variable named 'enchantedWeapon' and 'selectedWeapon'!
local enchantedWeapon = selectedWeapon

print("\nenchantedWeapon")
for k,v in pairs( enchantedWeapon ) do
    print( k .. " = " .. v )
end

enchantedWeapon.name = "Enchanted Short Sword"
enchantedWeapon.type = "enchanted_weapon"
enchantedWeapon.damage = 25
enchantedWeapon.cost = 50

print("\nenchantedWeapon after changing the values.")

for k,v in pairs( enchantedWeapon ) do
    print( k .. " = " .. v )
end

print("\nselectedWeapon after changes to enchantedWeapon - (Oooops... it was changed as well.)")
for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

--]]

--[[

-- Here's an example of how to properly copy a table...

local selectedWeapon =
{
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

print("selectedWeapon")

for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

-- To properly copy a table - create a new table and copy over the key-value pairs.
local enchantedWeapon = {}

for k,v in pairs( selectedWeapon ) do
    enchantedWeapon[k] = v
end

print("\nenchantedWeapon")
for k,v in pairs( enchantedWeapon ) do
    print( k .. " = " .. v )
end

enchantedWeapon.name = "Enchanted Short Sword"
enchantedWeapon.type = "enchanted_weapon"
enchantedWeapon.damage = 25
enchantedWeapon.cost = 50

print("\nenchantedWeapon after changing the vars")

for k,v in pairs( enchantedWeapon ) do
    print( k .. " = " .. v )
end

print( "\nselectedWeapon after changes to enchantedWeapon - (Cool... the table vars kept their values as they should.)")
for k,v in pairs( selectedWeapon ) do
    print( k .. " = " .. v )
end

--]]

