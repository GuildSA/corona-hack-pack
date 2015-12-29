--==============================================================================

-- In addition to numbers and strings, we can create variables that use more 
-- complicated types such as tables.

-- There are three types of tables...

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

-- Here's an example of an Index Table that is holding a bunch of numbers.

local myTableOfNumbers = { 2, 4, 6, 8, 10 }

-- We can use square brackets "[]" to access the values stored in the table
print( myTableOfNumbers[1] )
print( myTableOfNumbers[2] )
print( myTableOfNumbers[5] )

print( myTableOfNumbers[0] ) -- Lua does not start counting at 0 - so nil.
print( myTableOfNumbers[6] ) -- No value stored at index 6 - so also nil.

--==============================================================================

-- Here's an example of a Dictionary Table of key/value pairs. The dictionary 
-- table below is being used to store some information about a player's weapon.

local playersWeapon = {
    name = "Short Sword",
    type = "weapon",
    damage = 5,
    cost = 5
}

print( playersWeapon.name )      -- The typical way to access a key.
print( playersWeapon["name"] )   -- This is also valid.


print( playersWeapon.enchanted ) -- The key 'enchanted' doesn't exist... yet

playersWeapon.enchanted = true   -- But setting it will add it.

print( playersWeapon.enchanted )

--==============================================================================

-- Existing tables can be modified using insert() and remove().

-- The code below is a function which will help us print out the weapons table. 
-- I know that we haven't covered functions yet, so just ignore it for now.
function printWeaponsTable( tbl )
    for k,v in pairs( tbl ) do
        print( k .. " = " .. v )
    end
end

-- Create an index table to hold the player's weapons and add a Dagger to it.
local weapons = { "Dagger" }

printWeaponsTable( weapons )

print( "\nInsert - Sword and Club" )

table.insert( weapons, "Sword" )
table.insert( weapons, "Club" )

printWeaponsTable( weapons )

print( "\nInserting to a specific index - Magic Sword to index 1." )

table.insert( weapons, 1, "Magic Sword" ) -- Doesn't erase 1 but inserts and pushes everything down 1.

printWeaponsTable( weapons )

print( "\nRemoving, but not specifying an index will default to removing the last entry, which is Club." )

table.remove( weapons ) -- Removes last item, which is "Club".

printWeaponsTable( weapons )

print( "\nRemoving - Magic Sword at index 1" )

table.remove( weapons, 1 ) -- Removes first item, which is "Magic Sword".

printWeaponsTable( weapons )

print( "\nRemoving - index 2 - Sword" )

local valueThatWasRemoved = table.remove( weapons, 2 ) -- Remove "Sword" and catch return.

printWeaponsTable( weapons )

print( "valueThatWasRemoved = " .. valueThatWasRemoved .. "\n" )

