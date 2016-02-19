--==============================================================================

-- We can use if-statements to have our script take some action if some 
-- condition is true. The most basic control structure is the if statement.

local health = 0

-- If the player's health is less than or equal to 0 - print "You're dead!"
if health <= 0 then
    print( "You're dead!" )
end

--==============================================================================

-- Next, the if-else statement allows us to pick one of two possible actions instead
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

--==============================================================================

-- Now, in the if statements above we were using the "less than or equal to"
-- Comparison Operator, which looks like this "<=", to ask the question, is
-- the player's health "less than or equal to" 0.

-- Lua gives us several other Comparison Operators to use depending on what 
-- we're trying to figure out.
--
-- Lua's Comparison Operators
--
--   <   Less than
--   <=  Less than or equal to
--   >   Greater than
--   >=  Greater than or equal to
--   ==  Is equal to
--   ~=  Is not equal to

local goldCoins = 200
local priceOfMagicSword = 500

if goldCoins >= priceOfMagicSword then
	print("You purchased the magic sword!")
else
	print("Sorry. You don't have enough to purchase the magic sword.")
end

-- The result of two variables or values being compared by a Comparison Operator
-- is always a Boolean value such as true or false. We can see this by simply
-- passing some comparison expressions into print().

print( goldCoins >= priceOfMagicSword )
print( goldCoins < priceOfMagicSword )

--==============================================================================

-- If we want to write 'if' statements that check multiple expressions we can 
-- use Boolean Operators to decided if an 'if' statement should be fire or not

-- Lua's Boolean Operators

-- and - Returns true if both expressions are true
-- or  - Returns true if either of the two expressions are true
-- not - Negates the expressions.

local goldCoins = 800
local priceUsingGold = 500

local rubies = 5
local priceUsingRubies = 10

local hasSword = true -- Does the shop keeper have one to sell?

-- If the player has enough gold coins AND the shop keeper has a magic sword 
-- to sell - ask to purchase.
if goldCoins >= priceUsingGold and hasSword == true then
	print("Would you like to purchase a magic sword?")
else
	print("I'm sorry. The magic sword is unavailable.")
end

-- If the player has enough gold coins OR the player has enough ruby gems - ask to purchase.
if goldCoins >= priceUsingGold or rubies >= priceUsingRubies then
	print("Would you like to purchase a magic sword?")
else
	print("I'm sorry. The magic sword is unavailable.")
end

-- If the player has enough gold coins OR the player has enough ruby gems AND the shop 
-- keeper has a magic sword to sell - ask to purchase.
if (goldCoins >= priceUsingGold or rubies >= priceUsingRubies) and hasSword == true then
	print("Would you like to purchase a magic sword?")
else
	print("I'm sorry. The magic sword is unavailable.")
end

-- The 'not' Boolean Operator just inverts or negates a Boolean variable or the 
-- result of an expression.

hasSword = false

if not hasSword then
	print("The shop keeper has no magic sword!")
end

--==============================================================================
