local LOCAL_PLAYER = 10000
local BOILED_CRAB_SPEFFECT_ID = 500820

local function emevdDemo()
    print("Waitng for crab...")

    while not EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) do
        coroutine.yield()
    end

    print("yum")

    while EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) do
        coroutine.yield()
    end

    EMEVD.RestartEvent()
end

EMEVD.InitializeEvent(emevdDemo)
