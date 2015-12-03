-- We can use if-statements to have our script take some action if some 
-- condition is true. The most basic control structure is the if statement.

local health = 0

-- If the player's health is less than or equal to 0 - print "You're dead!"
if health <= 0 then
    print( "You're dead!" )
end

--==============================================================================

-- Nest, the if-else statement allows us to pick one of two possible actions instead
-- of a all-or-nothing choice.

local health = 75

-- If the player's health is less than or equal to 0 - print "You're dead!"
-- Otherwise, print "You're alive!".
if health <= 0 then
    print( "You're dead!" )
else
    print( "You're alive!" )
end

--==============================================================================

-- Finally, the if-elseif-else statement allows us to pick one of several possible 
-- actions by chaining two or more if statements together.

local health = 24

-- If the player's health is less than or equal to 0 - print "You're dead!"
-- But if the player is not dead, and the player's health is less than 25 - 
-- print  "You're alive - but badly wounded!" Otherwise, print "You're alive!".
if health <= 0 then
    print( "You're dead!" )
elseif health < 25 then
    print( "You're alive - but badly wounded!" )
else
    print( "You're alive!" )
end
