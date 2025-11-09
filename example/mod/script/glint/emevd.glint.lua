local LOCAL_PLAYER = 10000
local BOILED_CRAB_SPEFFECT_ID = 500820

InitializeEvent(function()
    print("Waitng for crab...")
    WaitFor(function() return EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) end)

    print("Commence crab")
    EMEVD.DisplayBanner(EMEVD.TextBannerType.Commence)

    if EMEVD.PlayersSoulLevel(EMEVD.ComparisonType.Equal, 69) then
        print("nice")
    end

    WaitFor(function() return not EMEVD.CharacterHasSpEffect(LOCAL_PLAYER, BOILED_CRAB_SPEFFECT_ID) end)
    RestartEvent()
end)
