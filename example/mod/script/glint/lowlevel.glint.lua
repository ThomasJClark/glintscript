local LOCAL_PLAYER = 10000
local BOILED_CRAB_SPEFFECT_ID = 500820

function GetMainPlayerHP()
    return Memory.GetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0 * 0x10, 0x580, 0x10 })
end

function SetMainPlayerHP(hp)
    Memory.SetI32(Memory.Singletons.WorldChrMan, { 0x10EF8, 0 * 0x10, 0x580, 0x10 }, hp)
end

local function emevdDemo()
    print("Waitng for crab...")

    while not EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) do
        coroutine.yield()
    end

    print("yum")

    EMEVD.DisplayBanner(EMEVD.TextBannerType.Commence)

    while EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) do
        coroutine.yield()
    end

    print("crab :(")

    EMEVD.DisplayBanner(EMEVD.TextBannerType.YouDied)

    RestartEvent()
end

InitializeEvent(emevdDemo)
