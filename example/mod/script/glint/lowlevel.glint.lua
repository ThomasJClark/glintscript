-- Register a function that runs once per frame. This is a good place to do low-level memory reads
-- and writes
InitializeTask(function(deltaTime)
    local screenWidth = Memory.GetI32(Memory.Base + 0x3b3fcd8)
    local screenHeight = Memory.GetI32(Memory.Base + 0x3b3fcdc)
    print("screen size: " .. tostring(screenWidth) .. "x" .. tostring(screenHeight))
    print("fps: " .. tostring(1 / deltaTime))
end)

-- Register a coroutine that can pause while waiting for certain game states, much like an event in
-- DarkScript.
-- InitializeEvent(function(self)
--     print("Waitng for crab...")
--     self:WaitFor(function() return EMEVD.CharacterHasSpEffect(10000, 12345) end)

--     print("yum")
--     EMEVD.DisplayBanner(EMEVD.TextBannerType.GodSlain)

--     self:WaitFor(function() return not EMEVD.CharacterHasSpEffect(10000, 12345) end)
--     self:RestartEvent()
-- end)
