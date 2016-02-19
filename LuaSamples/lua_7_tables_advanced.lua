
--==============================================================================

--[[

-- Please Note: The table type is the only type that passes by reference.
-- This allows a table, that has been passed into a function, to be changed
-- directly unlike other types that are always passed as a copy of the original.

-- Here, we create a function that can make any weapon enchanted and will  
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

--==============================================================================

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

-- To properly copy a table - create a new table and manually copy over the 
-- key-value pairs.
local enchantedWeapon = {}

for k,v in pairs( selectedWeapon ) do
    enchantedWeapon[k] = v
end

print("\nenchantedWeapon before changing the vars")

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
