local LOCAL_PLAYER = 10000
local BOILED_CRAB_SPEFFECT_ID = 500820

local function GetMainPlayerHP()
    return Memory.GetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0 * 0x10, 0x190, 0, 0x138 })
end

local function SetMainPlayerHP(hp)
    Memory.SetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0 * 0x10, 0x190, 0, 0x138 }, hp)
end

-- Low level task. This runs every frame (60 Hz) using the engine's task system, so it's a good
-- place to do memory hacks.
RegisterTask(function()
    local hp = GetMainPlayerHP()
    if hp ~= nil and hp < 500 then
        print("Low HP - here's some healing")
        SetMainPlayerHP(hp + 1000)
    end
end)

-- DarkScript3-style event. This function pauses and resumes over multiple frames similar to an
-- EMEVD event, which can be useful for multi-step game logic.
InitializeEvent(function()
    print("Waiting for crab...")
    WaitFor(function() return EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) end)

    print("Commence crab")
    EMEVD.DisplayBanner(EMEVD.TextBannerType.Commence)

    if EMEVD.PlayersSoulLevel(EMEVD.ComparisonType.Equal, 69) then
        print("nice")
    end

    WaitFor(function() return not EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) end)
    RestartEvent()
end)
