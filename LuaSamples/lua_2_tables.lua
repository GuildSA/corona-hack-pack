--==============================================================================

-- In addition to numbers and strings, we can create variables that use more 
-- complicated types such as tables.

-- There are three types of tables: index tables, dictionary tables, and 
-- mixed tables.

-- An index table contains only non-named or non-keyed values.

local players =
{
    "Jennifer J.",
    "!Roberto!",
    "Cyber Dawg",
    "SpeedRacer"
}

-- We call them index tables because we can access their values by specifying 
-- the index of the data we want. We do this by passing the index into a set of
-- square brackets "[]" to access the values stored in the table.

print( players[1] )
print( players[2] )

print( players[0] ) -- Lua does not start counting at 0 - so this returns nil.
print( players[5] ) -- Since we stored nothing at index 5 - this also returns nil.

--==============================================================================

-- The second type of table is called a dictionary table. A dictionary table 
-- contains only named or keyed values.

local gameResults =
{
    firstPlace = "Jennifer J.",
    secondPlace = "!Roberto!",
    thirdPlace = "SpeedRacer"
}

-- We can access the data of a dictionary table by specifying the name of the
-- key want to access right after a period. This usage of a period to access a
-- key's value is called a dot operator.

print( gameResults.firstPlace )

-- We can also pass the key's name as a string value into square brackets.
print( gameResults["secondPlace"] )

-- But, be careful! You can not use a number to index into a dictionary table.
print( gameResults[1] )

--==============================================================================

-- The third type of table is called a mixed table. The mixed table contains a 
-- mix of indexed and named values.

local mixedTable =
{
    10,
    "A String at index 2!",
    myNumber = 20,

    mySubTable =
    {
        300,
        anotherNumber = 400,
        anotherString = "Another String"
    },

    "A String at index 3!"
}

-- Here's a few examples of how you would access the table's data:

-- We can use index access for data that has no key:

print( mixedTable[1] )
print( mixedTable[2] )
print( mixedTable[3] )

-- For data that has a key name, we can simply use the key's name to get the
-- data:

print( mixedTable.myNumber )

-- We can also access a subtable and then access its data as well:

print( mixedTable.mySubTable[1] )
print( mixedTable.mySubTable.anotherNumber )
print( mixedTable.mySubTable.anotherString )

--==============================================================================

-- We can add new keys to an existing table by simply assigning a value to a 
-- new key.

local playersWeapon =
{
    name = "Short Sword",
    damage = 5,
    attackRange = 1
}

print( playersWeapon.name )
print( playersWeapon.damage )

print( playersWeapon.enchanted ) -- The key 'enchanted' doesn't exist... yet

playersWeapon.enchanted = true   -- But setting it will add it.

print( playersWeapon.enchanted )

--==============================================================================

-- We can also add subtables into an existing index table by simply accessing 
-- the index position and creating a new table at that index position:

-- This creates an empty table to hold the player's spells.
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

-- We can then access each spell through its index and then access the
-- data in each spell table through its key names.

print( spellsTable[1].name )
print( spellsTable[2].name )

-- We can also create variables that reference the spell subtables and then use 
-- these variables to access one of the spell's key/value pairs.

local spell1 = spellsTable[1]
local spell2 = spellsTable[2]

print( spell1.attackMode )
print( spell2.attackMode )

--==============================================================================

-- Lua also provides a module called "table" that allows us to insert and remove
-- items from an existing index table.

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

table.insert( weapons, 1, "Magic Sword" ) -- Doesn't erase 1 but inserts and pushes everything down by 1.

printTable( weapons )

print( "\nRemoving, but not specifying an index will default to removing the last entry, which is Club." )

table.remove( weapons ) -- Removes last item, which is "Club".

printTable( weapons )

print( "\nRemoving - Magic Sword at index 1" )

table.remove( weapons, 1 ) -- Removes first item, which is "Magic Sword".

printTable( weapons )
