
-- The most basic control structure is the if statement.

--[[

local health = 0

if health <= 0 then
    print( "You're dead!" )
end

--]]

--==============================================================================

-- The if-else statement allows us to pick one of two possible actions instead
-- of a all-or-nothing choice.

--[[

local health = 75

if health <= 0 then
    print( "You're dead!" )
else
    print( "You're alive!" )
end

--]]

--==============================================================================

-- The if-elseif-else statement allows us to pick one of several possible 
-- actions by chaining two or more if statements together.

--[[

local health = 24

if health <= 0 then
    print( "You're dead!" )
elseif health < 25 then
    print( "You're alive - but badly wounded!" )
else
    print( "You're alive!" )
end

--]]
