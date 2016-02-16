--==============================================================================

-- In addition to numbers and strings, we can create variables that use more 
-- complicated types such as tables.

-- There are three types of tables...

-- An index table contains only non-named or non-keyed values.

local teamsRoster =
{
    "Team Alpha",
    "Team Bravo",
    "Team Charlie",
    "Team Delta",
    "Team Echo"
}

-- A dictionary table contains only named or keyed values.

local tournamentPlacing =
{
    firstPlace = "Team Delta",
    secondPlace = "Team Alpha",
    thirdPlace = "Team Echo"
}

-- A mixed table contains a mix of indexed and named values.

local mixedTable =
{
    10,
    "some string!",
    numberVar = 10,

    subTbl1 = teamsRoster,
    subTbl2 = tournamentPlacing,

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

local playersWeapon =
{
    name = "Short Sword",
    damage = 5,
    attackRange = 1
}

print( playersWeapon.name )      -- The typical way to access a key.
print( playersWeapon["name"] )   -- This is also valid.


print( playersWeapon.enchanted ) -- The key 'enchanted' doesn't exist... yet

playersWeapon.enchanted = true   -- But setting it will add it.

print( playersWeapon.enchanted )


--==============================================================================

-- Tables can also contain other tables...

-- Create an empty table to hold spells.
local spellsTable = {}

-- Now, store another table, which holds data about one spell, into the spells 
-- table at index 1.

spellsTable[1] = 
{
    name = "Rain Fire",
    damage = 5,
    manaCost = 10,
    attackMode = "all enemies",
    attackRange = 15
}

-- Again, store another table, which holds data about one spell, into the spells 
-- table at index 2.

spellsTable[2] =
{
    name = "Lightning Bolt",
    damage = 20,
    manaCost = 20,
    attackMode = "selected enemy only",
    attackRange = 30
}

-- We can then directly access each spell through its index and then access one of 
-- spell's key/value pairs.

print( spellsTable[1].name )
print( spellsTable[2].name )

-- We can also create variables that reference the spell subtables and then use 
-- these variables to access one of the spell's key/value pairs.

local spell1 = spellsTable[1]
local spell2 = spellsTable[2]

print( spell1.attackMode )
print( spell2.attackMode )

--==============================================================================

-- Existing tables can be modified using insert() and remove().

-- The code below is a function which will help us print out the weapons table. 
-- I know that we haven't covered functions yet, so just ignore it for now.
function printTable( tbl )
    for k, v in pairs( tbl ) do
        print( k .. " = " .. v )
    end
end

-- Create an index table to hold the player's weapons and add a Dagger to it.
local weapons = { "Dagger" }

printTable( weapons )

print( "\nInsert - Sword and Club" )

table.insert( weapons, "Sword" )
table.insert( weapons, "Club" )

printTable( weapons )

print( "\nInserting to a specific index - Magic Sword to index 1." )

table.insert( weapons, 1, "Magic Sword" ) -- Doesn't erase 1 but inserts and pushes everything down 1.

printTable( weapons )

print( "\nRemoving, but not specifying an index will default to removing the last entry, which is Club." )

table.remove( weapons ) -- Removes last item, which is "Club".

printTable( weapons )

print( "\nRemoving - Magic Sword at index 1" )

table.remove( weapons, 1 ) -- Removes first item, which is "Magic Sword".

printTable( weapons )

print( "\nRemoving - index 2 - Sword" )

local valueThatWasRemoved = table.remove( weapons, 2 ) -- Remove "Sword" and catch return.

print( "valueThatWasRemoved = " .. valueThatWasRemoved .. "\n" )

printTable( weapons )



