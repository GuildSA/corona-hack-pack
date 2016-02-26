--==============================================================================

-- io.lines( filename )
--
-- io.lines opens the given file name in read mode and returns an iterator
-- function that, each time it is iterated, returns a new line from the file.
--
-- When the iterator function detects the end of file, it returns nil
-- (to finish the loop) and automatically closes the file.

--[[

-- Get an iterator from an existing file which only works line by line.
local lines = io.lines( "test.txt" )

for line in lines do

    -- Print each line pulled from the file...
	print( line )

end

print()

--]]

--==============================================================================

-- io.open( filename, mode )
--
-- This function opens a file, in the mode specified in the string mode.
-- It returns a new file handle, or, in case of errors, nil plus an error
-- message.
--
-- The mode string can be any of the following:
--
-- * "r"  : Read mode (the default)
-- * "w"  : Write mode
-- * "a"  : Append mode
-- * "r+" : Update mode, all previous data is preserved
-- * "w+" : Update mode, all previous data is erased
-- * "a+" : Append update mode, previous data is preserved, and writing is
--          only allowed at the end of file.
-- * "b"  : You can add a 'b' to any of the above modes to open a binary file.

--[[

-- Open an existing file in read ("r") mode.
local file, errorMsg = io.open( "test.txt", "r" )

if errorMsg ~= nil then
    print( "Call to io.open failed: " .. errorMsg .. "\n" )
end

for line in file:lines() do

    print( line )

end

file:close()

print()

--]]

--==============================================================================

-- file:read( ... )
--
-- Reads the file, according to the given formats, which specify what to
-- read. For each format, the function returns a string (or a number) with
-- the characters read, or nil if it cannot read data with the specified format.
-- When called without formats, it uses a default format that reads the entire
-- next line (see below).
--
-- The available formats are:
--
-- * "*l"   : Reads the next line, returning nil on end of file.
--            This is the default format.
--
-- * "*n"   : Reads a number. This is the only format that returns a number
--            instead of a string.
--
-- * "*a"   : Reads the whole file, starting at the current position. On end of
--            file, it returns the empty string.
--
-- * number : Reads a string up to that number of characters, returning
--            nil on end of file. If number is zero, it reads nothing and returns
--            an empty string, or nil on end of file.

--[[

local file = io.open( "test.txt", "r" )

local line = file:read( "*l" ) -- Read a single line.
print( line )

line = file:read() -- The default is "*l", so we don't really need to pass it.
print( line )

line = file:read()
print( line )

line = file:read()
print( line )

line = file:read( "*n" ) -- Attempt to read the line "42" and return it as a number.
print( "The type of " .. line .. " is a " .. type( line ) )

file:close()

print()

--]]

--==============================================================================

-- file:seek( [whence] [, offset] )
--
-- Sets and gets the file position, measured from the beginning of the file,
-- to the position given by offset plus a base specified by the string whence,
-- as follows:
--
-- * "set": base is position 0 (beginning of the file)
-- * "cur": base is current position
-- * "end": base is end of file
--
-- The default value for whence is "cur", and for offset is 0. Therefore,
-- the call file:seek() returns the current file position, without changing it;
-- the call file:seek("set") sets the position to the beginning of the file
-- (and returns 0); and the call file:seek("end") sets the position to the end
-- of the file, and returns its size.

--[[

local file = io.open( "test.txt", "r" )

-- Set the seek position to the begining of the file.
file:seek( "set" )
local line = file:read()
print( line )

-- Set the seek position to the current position - but move up to char position 3.
file:seek( "cur", 3 )
line = file:read()
print( line )

-- Calling seek without an offset is fine but it want do anything useful.
file:seek( "cur" )
line = file:read()
print( line )

-- Set the seek position to the current position - but move up to char position 3.
-- Also, let us make note of the file position where the read() call has left us at.
local currentPosition = file:seek( "cur", 3 )
print( "currentPosition = " .. currentPosition)
line = file:read()
print( line )

-- Skip to the end!
file:seek( "end" )
line = file:read() -- This will be nil.
print( line )

-- Skip to the end, but back up 2 characters!
file:seek( "end", -2 )
line = file:read( "*n" ) -- This will return the number 42
print( line )

file:close()

print()

--]]

--==============================================================================

--[[

function saveFile( fileName )

    -- Open a new file in write ("w") mode.
    local fileToSave, errorMsg = io.open( fileName, "w" )

    if errorMsg ~= nil then
        print( "\nError calling saveFile() - io.open() failed with: " .. errorMsg .. "\n" )
        return
    end

    for i = 1, 5 do

        fileToSave:write( "Line of data #" .. i .. "\n" )

    end

    fileToSave:close()

end

print( "Saving File!" )

saveFile( "test_save.txt" )

--]]

--==============================================================================

--[[

function loadFile( fileName )

    -- Open an existing file in read ("r") mode.
    local fileToLoad, errorMsg = io.open( fileName, "r" )

    if errorMsg ~= nil then
        print( "\nError calling loadFile() - io.open() failed with: " .. errorMsg .. "\n" )
        return
    end

    for line in fileToLoad:lines() do

        print( line )

    end

    fileToLoad:close()

end

print( "Loading file!" )

loadFile( "test_save.txt" )

--]]
