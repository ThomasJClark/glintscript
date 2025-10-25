-- Use `memory` to read raw values from the game's memory
local screenWidth = Memory.GetI32(Memory.Base + 0x3b3fcd8)
local screenHeight = Memory.GetI32(Memory.Base + 0x3b3fcdc)
print("Screen size: " .. tostring(screenWidth) .. "x" .. tostring(screenHeight))

-- Return a function from the script to execute something each frame
return function()
    -- In most cases, you don't want to hardcode memory offsets from `Memory.Base`. Instead, use
    -- `Memory.Singletons` to get the address of a singleton, and provide a chain of pointer offsets
    -- to get to nested fields.
    local mainPlayerHP =
        Memory.GetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0x0, 0x190, 0x0, 0x138 })

    -- If any pointer in a chain is null, the function will return `nil`. For example, WorldChrMan
    -- isn't initialized while the player is in the main menu or a loading screen
    if mainPlayerHP == nil then
        return
    end

    -- Use `Memory.Set*` to write raw values to the game's memory
    local newHP = mainPlayerHP
    if mainPlayerHP < 1000 then
        newHP = mainPlayerHP + 1
    elseif mainPlayerHP > 1000 then
        newHP = mainPlayerHP - 1
    end

    Memory.SetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0x0, 0x190, 0x0, 0x138 }, newHP)
end
