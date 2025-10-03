local memory = glint.memory

-- Use `memory` to read raw values from the game's memory
local screen_width = memory.get_i32(memory.base + 0x3b3fcd8)
local screen_height = memory.get_i32(memory.base + 0x3b3fcdc)
print("Screen size: " .. tostring(screen_width) .. "x" .. tostring(screen_height))

-- glint.emevd(2007, 2, { 15 })

-- Return a function from the script to execute something each frame
return function()
    -- In most cases, you don't want to hardcode memory offsets from `memory.base`. Instead, use
    -- `memory.singletons` to get the address of a singleton, and provide a chain of pointer offsets
    -- to get to nested fields.
    local main_player_hp =
        memory.get_i32(memory.singletons.WorldChrMan, { 0x10EF8, 0x0, 0x190, 0x0, 0x138 })

    -- If any pointer in a chain is null, the function will return `nil`. For example, WorldChrMan
    -- isn't initialized while the player is in the main menu or a loading screen
    if main_player_hp == nil then
        return
    end

    -- Use `memory.set_*` to write raw values to the game's memory
    local new_hp = main_player_hp
    if main_player_hp < 1000 then
        new_hp = main_player_hp + 1
    elseif main_player_hp > 1000 then
        new_hp = main_player_hp - 1
    end

    memory.set_i32(memory.singletons.WorldChrMan, { 0x10EF8, 0x0, 0x190, 0x0, 0x138 }, new_hp)
end
