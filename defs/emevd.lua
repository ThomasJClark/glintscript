---@meta
EMEVD = {}

---@enum OnOff
EMEVD.OnOff = {
    Off = 0,
    On = 1,
}

---@enum OnOffChange
EMEVD.OnOffChange = {
    Off = 0,
    On = 1,
    Change = 2,
}

---@enum TargetEventFlagType
EMEVD.TargetEventFlagType = {
    EventFlag = 0,
    EventId = 1,
    EventIdSlotNumber = 2,
}

---@enum ComparisonType
EMEVD.ComparisonType = {
    Equal = 0,
    Notequal = 1,
    Greater = 2,
    Less = 3,
    Greaterorequal = 4,
    Lessorequal = 5,
}

---@enum LogicalOperationType
EMEVD.LogicalOperationType = {
    AllOn = 0,
    AllOff = 1,
    NotAllOff = 2,
    NotAllOn = 3,
}

---@enum CalculationType
EMEVD.CalculationType = {
    Add = 0,
    Sub = 1,
    Mult = 2,
    Div = 3,
    Mod = 4,
    Assign = 5,
}

---@enum CutscenePlayMode
EMEVD.CutscenePlayMode = {
    Skippable = 0,
    Unskippable = 2,
    SkippableWithFadeOutSkip = 16,
    UnskippableWithFadeOutSkip = 18,
    SkippableWithWhiteFadeOut = 32,
    SkippableWithWhiteFadeOutSkip = 48,
    UnskippableWithWhiteFadeOutSkip = 50,
    SkippableWithWhiteFadeOut2 = 64,
}

---@enum DestructionState
EMEVD.DestructionState = {
    Undestroyed = 0,
    Destroyed = 1,
}

---@enum InsideOutsideState
EMEVD.InsideOutsideState = {
    Outside = 0,
    Inside = 1,
}

---@enum DeathState
EMEVD.DeathState = {
    Alive = 0,
    Dead = 1,
}

---@enum OwnershipState
EMEVD.OwnershipState = {
    DoesntOwn = 0,
    Owns = 1,
}

---@enum TeamType
EMEVD.TeamType = {
    Disabled = 0,
    Human = 1,
    WhitePhantom = 2,
    BlackPhantom = 3,
    GrayPhantom = 4,
    WanderingPhantom = 5,
    Enemy = 6,
    StrongEnemy = 7,
    Ally = 8,
    HostileAlly = 9,
    DecoyEnemy = 10,
    DecoyLike = 11,
    BattleAlly = 12,
    Invader = 13,
    Charmed = 15,
    Host = 19,
    CoOp = 20,
    Hostile = 21,
    WanderingPhantom2 = 22,
    Enemy1 = 23,
    Enemy2 = 24,
    StrongEnemy2 = 25,
    FriendlyNPC = 26,
    HostileNPC = 27,
    CoOpNPC = 28,
    Indiscriminate = 29,
    Object = 30,
    WhiteBerserker = 31,
    RedBerserker = 32,
    ArchEnemyTeam = 33,
    Unknown67 = 67,
    Unknown70 = 70,
    Default = -1,
}

---@enum TargetEntityType
EMEVD.TargetEntityType = {
    Asset = 0,
    Area = 1,
    Character = 2,
}

---@enum DisabledEnabled
EMEVD.DisabledEnabled = {
    Disabled = 0,
    Enabled = 1,
}

---@enum BitopType
EMEVD.BitopType = {
    Add = 0,
    Delete = 1,
    Invert = 2,
}

---@enum NavimeshType
EMEVD.NavimeshType = {
    Solid = 1,
    Exit = 2,
    Obstacle = 4,
    Wall = 8,
    WallTouchingFloor = 32,
    LandingPoint = 64,
    Event = 128,
    Cliff = 256,
    OpenSpace = 512,
    Ladder = 1024,
    Hole = 2048,
    Door = 4096,
    ClosedDoor = 8192,
}

---@enum PromptType
EMEVD.PromptType = {
    YesNo = 0,
    OkCancel = 1,
}

---@enum NumberOfOptions
EMEVD.NumberOfOptions = {
    OneButton = 1,
    TwoButtons = 2,
    NoButtons = 6,
}

---@enum SoundType
EMEVD.SoundType = {
    EnvironmentalSound = 0,
    CharacterMotion = 1,
    MenuSE = 2,
    Asset = 3,
    CutsceneSE = 4,
    SFX = 5,
    BGM = 6,
    Voice = 7,
    DependsOnFloorMaterial = 8,
    DependsOnArmorMaterial = 9,
    Ghost = 10,
    GeometrySet = 14,
}

---@enum DamageTargetType
EMEVD.DamageTargetType = {
    Character = 1,
    Map = 2,
    CharacterMap = 3,
}

---@enum ItemType
EMEVD.ItemType = {
    Weapon = 0,
    Armor = 1,
    Ring = 2,
    Goods = 3,
}

---@enum TargetType
EMEVD.TargetType = {
    Alive = 0,
    WhitePhantom = 1,
    BlackPhantom = 2,
    GrayPhantom = 8,
    Invader = 15,
    Invader2 = 16,
    BluePhantom = 17,
    Invader3 = 18,
}

---@enum TextBannerType
EMEVD.TextBannerType = {
    YouDied = 2,
    HostVanquished = 5,
    BloodyFingerVanquished = 7,
    LostGraceDiscovered = 13,
    Unknown14 = 14,
    LegendFelled = 15,
    DemigodFelled = 16,
    GreatEnemyFelled = 17,
    EnemyFelled = 18,
    DutyFulfilled = 20,
    MapFound = 22,
    GreatRuneRestored = 26,
    GodSlain = 27,
    DuelistVanquished = 28,
    RecusantVanquished = 29,
    InvaderVanquished = 30,
    Commence = 31,
    Stalemate = 32,
    Victory = 33,
    Defeat = 34,
}

---@enum MultiplayerState
EMEVD.MultiplayerState = {
    Host = 0,
    Client = 1,
    Multiplayer = 2,
    MultiplayerPending = 3,
    Singleplayer = 4,
    Invasion = 5,
    InvasionPending = 6,
}

---@enum NPCPartType
EMEVD.NPCPartType = {
    Part1 = 1,
    Part2 = 2,
    Part3 = 3,
    Part4 = 4,
    Part5 = 5,
    Part6 = 6,
    Part7 = 7,
    Part8 = 8,
    Part9 = 9,
    Part10 = 10,
    Part11 = 11,
    Part12 = 12,
    Part13 = 13,
    Part14 = 14,
    Part15 = 15,
    Part16 = 16,
    Part17 = 17,
    Part18 = 18,
    Part19 = 19,
    Part20 = 20,
    Part21 = 21,
    Part22 = 22,
    Part23 = 23,
    Part24 = 24,
    Part25 = 25,
    Part26 = 26,
    Part27 = 27,
    Part28 = 28,
    Part29 = 29,
    Part30 = 30,
    WeakPoint = 31,
}

---@enum AuthorityLevel
EMEVD.AuthorityLevel = {
    Normal = 0,
    Forced = 8192,
}

---@enum AIStateType
EMEVD.AIStateType = {
    Normal = 0,
    Recognition = 1,
    Alert = 2,
    Combat = 3,
    PassiveAlert = 4,
    ActiveAlert = 5,
    WaitBeforeForget = 6,
}

---@enum SummonSignType
EMEVD.SummonSignType = {
    WhiteSign = 0,
    BlackSign = 1,
    RedSign = 2,
    NPCWhiteSign = 20,
}

---@enum ClassType
EMEVD.ClassType = {
    Vagabond = 0,
    Warrior = 1,
    Hero = 2,
    Bandit = 3,
    Astrologer = 4,
    Prophet = 5,
    Confessor = 6,
    Samurai = 7,
    Prisoner = 8,
    Wretch = 9,
}

---@enum CharacterUpdateFrequency
EMEVD.CharacterUpdateFrequency = {
    AlwaysUpdate = 0,
    Every2Frames = 2,
    Every5Frames = 5,
    AtLeastEvery2Frames = 102,
    AtLeastEvery5Frames = 105,
    NoUpdate = -1,
}

---@enum DamageType
EMEVD.DamageType = {
    Unspecified = 0,
    Fire = 1,
    Magic = 2,
}

---@enum ArmorType
EMEVD.ArmorType = {
    Head = 0,
    Body = 1,
    Arms = 2,
    Legs = 3,
}

---@enum Gender
EMEVD.Gender = {
    Male = 0,
    Female = 1,
}

---@enum WorldType
EMEVD.WorldType = {
    OwnWorld = 0,
    OtherWorld = 1,
}

---@enum BossBGMState
EMEVD.BossBGMState = {
    Start = 0,
    HeatUp = 1,
    HeatUp2 = 2,
    Stop1 = -2,
    Stop2 = -1,
}

---@enum Weather
EMEVD.Weather = {
    Default = 0,
    Rain = 1,
    Snow = 2,
    WindyRain = 3,
    Fog = 4,
    Cloudless = 5,
    FlatClouds = 6,
    PuffyClouds = 7,
    RainyClouds = 8,
    WindyFog = 9,
    HeavySnow = 10,
    HeavyFog = 11,
    WindyPuffyClouds = 12,
    Default2 = 13,
    Default3 = 14,
    RainyHeavyFog = 15,
    SnowyHeavyFog = 16,
    ScatteredRain = 17,
    Unknown18 = 18,
    Unknown19 = 19,
    Unknown20 = 20,
    Unknown21 = 21,
    Unknown22 = 22,
    Unknown23 = 23,
    None = -1,
}

---@enum ArenaMatchType
EMEVD.ArenaMatchType = {
    Duel = 0,
    TwoPlayerBrawl = 1,
    FourPlayerBrawl = 2,
    SixPlayerBrawl = 3,
    OneVersusOne = 4,
    TwoVersusTwo = 5,
    ThreeVersusThree = 6,
}

---@enum ArenaResult
EMEVD.ArenaResult = {
    Win = 0,
    Draw = 1,
}

-- System

---@param dummy number
function EMEVD.SaveRequest(dummy) end

---@param activityId number
function EMEVD.StartPS5Activity(activityId) end

---@param activityId number
function EMEVD.EndPS5Activity(activityId) end

-- Timer

---@param hours number
---@param minutes number
---@param seconds number
---@param fadeTransition boolean
---@param shouldWaitForCompletion boolean
---@param showClock boolean
---@param clockStartupDelayS number
---@param clockMoveTimeS number
---@param clockFinishDelayS number
function EMEVD.SetCurrentTime(hours, minutes, seconds, fadeTransition, shouldWaitForCompletion, showClock,
                              clockStartupDelayS, clockMoveTimeS, clockFinishDelayS) end

---@param shouldFreeze boolean
function EMEVD.FreezeTime(shouldFreeze) end

-- Cutscene

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
function EMEVD.PlayCutsceneToAll(cutsceneId, playbackMethod) end

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
---@param playerEntityId number
function EMEVD.PlayCutsceneToPlayer(cutsceneId, playbackMethod, playerEntityId) end

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
---@param playerEntityId number
---@param shouldChangeWeather boolean
---@param weather Weather
---@param weatherLifespanSeconds number
---@param shouldChangeTime boolean
---@param hours number
---@param minutes number
---@param seconds number
function EMEVD.PlayCutsceneToPlayerWithWeatherAndTime(cutsceneId, playbackMethod, playerEntityId, shouldChangeWeather,
                                                      weather, weatherLifespanSeconds, shouldChangeTime, hours, minutes,
                                                      seconds) end

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
---@param areaEntityId number
---@param mapId number
---@param playerEntityId number
---@param unknown14 number
---@param unknown18 boolean
function EMEVD.PlayCutsceneToPlayerAndWarp(cutsceneId, playbackMethod, areaEntityId, mapId, playerEntityId, unknown14,
                                           unknown18) end

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
---@param areaEntityId number
---@param mapId number
---@param playerEntityId number
---@param unknown14 number
---@param unknown18 boolean
---@param shouldChangeWeather boolean
---@param weather Weather
---@param weatherLifespanSeconds number
---@param shouldChangeTime boolean
---@param hours number
---@param minutes number
---@param seconds number
function EMEVD.PlayCutsceneToPlayerAndWarpWithWeatherAndTime(cutsceneId, playbackMethod, areaEntityId, mapId,
                                                             playerEntityId, unknown14, unknown18, shouldChangeWeather,
                                                             weather, weatherLifespanSeconds, shouldChangeTime, hours,
                                                             minutes, seconds) end

---@param cutsceneId number
---@param playbackMethod CutscenePlayMode
---@param areaEntityId number
---@param mapId number
---@param playerEntityId number
---@param unknown14 number
---@param unknown18 boolean
---@param shouldUpdateStablePosition boolean
function EMEVD.PlayCutsceneToPlayerAndWarpWithStablePositionUpdate(cutsceneId, playbackMethod, areaEntityId, mapId,
                                                                   playerEntityId, unknown14, unknown18,
                                                                   shouldUpdateStablePosition) end

-- Event

---@param itemLotId number
function EMEVD.AwardItemLot(itemLotId) end

---@param bulletTeamEntityId number
---@param bulletProducerEntityId number
---@param dummypolyId number
---@param behaviorId number
---@param firingAngleX number
---@param firingAngleY number
---@param firingAngleZ number
function EMEVD.ShootBullet(bulletTeamEntityId, bulletProducerEntityId, dummypolyId, behaviorId, firingAngleX,
                           firingAngleY, firingAngleZ) end

---@param eventFlagId number
function EMEVD.InvertEventFlag(eventFlagId) end

---@param disabledEnabled DisabledEnabled
---@param entityId number
---@param slotNumber number
---@param nameId number
function EMEVD.DisplayBossHealthBar(disabledEnabled, entityId, slotNumber, nameId) end

---@param entityId number
---@param bannerType TextBannerType
function EMEVD.HandleBossDefeatAndDisplayBanner(entityId, bannerType) end

---@param navimeshEntityId number
---@param navimeshType NavimeshType
---@param typeBitOperation BitopType
function EMEVD.ModifyNavimeshConnectionBitflag(navimeshEntityId, navimeshType, typeBitOperation) end

---@param areaId number
---@param blockId number
---@param regionId number
---@param indexId number
---@param initialAreaEntityId number
---@param subareaNamePopupMessageId number
function EMEVD.WarpPlayer(areaId, blockId, regionId, indexId, initialAreaEntityId, subareaNamePopupMessageId) end

---@param entityId number
function EMEVD.HandleMinibossDefeat(entityId) end

---@param multiplayerEventId number
function EMEVD.TriggerMultiplayerEvent(multiplayerEventId) end

---@param eventFlagIdMin number
---@param eventFlagIdMax number
---@param flagState OnOff
function EMEVD.RandomlySetEventFlagInRange(eventFlagIdMin, eventFlagIdMax, flagState) end

---@param entityId number
---@param animationId number
---@param shouldLoop boolean
---@param shouldWaitForCompletion boolean
---@param ignoreWaitForTransition boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
function EMEVD.ForceAnimationPlayback(entityId, animationId, shouldLoop, shouldWaitForCompletion, ignoreWaitForTransition,
                                      comparisonType, numberOfTargetCharacters) end

---@param dummy number
function EMEVD.IncrementGameCycle(dummy) end

---@param eventFlagIdStart number
---@param eventFlagIdEnd number
---@param flagState OnOff
function EMEVD.BatchSetEventFlags(eventFlagIdStart, eventFlagIdEnd, flagState) end

---@param respawnAreaEntityId number
function EMEVD.SetPlayerRespawnPoint(respawnAreaEntityId) end

---@param itemType ItemType
---@param itemId number
---@param number number
function EMEVD.RemoveItemFromPlayer(itemType, itemId, number) end

---@param signType SummonSignType
---@param summonedNPCEntityId number
---@param spawnAreaEntityId number
---@param summonEventFlagId number
---@param dismissalEventFlagId number
---@param unknown boolean
function EMEVD.PlaceNPCSummonSign(signType, summonedNPCEntityId, spawnAreaEntityId, summonEventFlagId,
                                  dismissalEventFlagId, unknown) end

---@param achievementId number
function EMEVD.AwardAchievement(achievementId) end

---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
---@param maximumAllowedValue number
function EMEVD.IncrementEventValue(baseEventFlagId, numberOfUsedFlagBits, maximumAllowedValue) end

---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
function EMEVD.ClearEventValue(baseEventFlagId, numberOfUsedFlagBits) end

---@param eventFlagId number
function EMEVD.SetSnugglyNextTrade(eventFlagId) end

---@param itemLotId number
---@param placementAreaEntityId number
---@param eventFlagId number
---@param hitEntityId number
function EMEVD.SpawnSnugglyItem(itemLotId, placementAreaEntityId, eventFlagId, hitEntityId) end

---@param sourceAreaEntityId number
---@param destinationAreaEntityId number
function EMEVD.MoveBloodstainAndDroppedItems(sourceAreaEntityId, destinationAreaEntityId) end

---@param itemLotId number
function EMEVD.AwardItemsIncludingClients(itemLotId) end

---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
---@param operand number
---@param baseEventFlagIdOperand number
---@param numberOfUsedEventFlagBitsOperand number
---@param calculationType CalculationType
function EMEVD.EventValueOperation(baseEventFlagId, numberOfUsedFlagBits, operand, baseEventFlagIdOperand,
                                   numberOfUsedEventFlagBitsOperand, calculationType) end

---@param itemType ItemType
---@param itemId number
---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
function EMEVD.StoreItemAmountHeldInEventValue(itemType, itemId, baseEventFlagId, numberOfUsedFlagBits) end

---@param itemType ItemType
---@param itemId number
---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
function EMEVD.DirectlyGivePlayerItem(itemType, itemId, baseEventFlagId, numberOfUsedFlagBits) end

---@param aiSoundParamId number
---@param entityId number
---@param originEntityType TargetEntityType
function EMEVD.TriggerAISound(aiSoundParamId, entityId, originEntityType) end

---@param generatorEntityId number
function EMEVD.InvokeEnemyGenerator(generatorEntityId) end

---@param eventFlagIdStart number
---@param eventFlagIdEnd number
---@param flagState OnOff
function EMEVD.BatchSetNetworkConnectedEventFlags(eventFlagIdStart, eventFlagIdEnd, flagState) end

---@param level1Count number
---@param level2Count number
function EMEVD.SetOmissionModeCounts(level1Count, level2Count) end

function EMEVD.ResetOmissionModeCountsToDefault() end

---@param targetEventFlagType TargetEventFlagType
---@param targetEventFlagId number
---@param desiredFlagState OnOff
function EMEVD.SetEventFlag(targetEventFlagType, targetEventFlagId, desiredFlagState) end

---@param weather Weather
---@param lifespanSeconds number
---@param shouldSwitchImmediately boolean
function EMEVD.ChangeWeather(weather, lifespanSeconds, shouldSwitchImmediately) end

---@param targetEventFlagType TargetEventFlagType
---@param targetEventFlagId number
---@param desiredFlagState OnOff
function EMEVD.SetNetworkConnectedEventFlag(targetEventFlagType, targetEventFlagId, desiredFlagState) end

---@param ignoreIsMyWorldCheck boolean
function EMEVD.TriggerAreaReload(ignoreIsMyWorldCheck) end

---@param gestureParamId number
function EMEVD.AwardGesture(gestureParamId) end

---@param decreaseRate number
---@param soulAmountSaveSlotId number
function EMEVD.ReduceBloodstainSouls(decreaseRate, soulAmountSaveSlotId) end

---@param entityId number
---@param fixedIncreaseAmount number
---@param soulAmountLoadSlotId number
function EMEVD.IncreaseEnemySoulDropAmount(entityId, fixedIncreaseAmount, soulAmountLoadSlotId) end

---@param success boolean
function EMEVD.IssueEndOfPseudoMultiplayerNotification(success) end

---@param farViewId number
---@param assetEntityId number
---@param dummypolyId number
function EMEVD.UseFarViewCamera(farViewId, assetEntityId, dummypolyId) end

---@param state DisabledEnabled
---@param aboveground boolean
---@param areaId number
---@param blockId number
---@param regionId number
---@param indexId number
---@param x number
---@param y number
---@param z number
function EMEVD.SetPlayerPositionDisplay(state, aboveground, areaId, blockId, regionId, indexId, x, y, z) end

---@param areaEntityId number
function EMEVD.SetPsuedoMultiplayerReturnPosition(areaEntityId) end

---@param worldMapPointParamId number
---@param distance number
function EMEVD.OpenWorldMapPoint(worldMapPointParamId, distance) end

---@param npcEntityId number
function EMEVD.SendNPCSummonHome(npcEntityId) end

---@param gestureParamId number
function EMEVD.RemoveGesture(gestureParamId) end

---@param npcEntityId number
function EMEVD.DeleteNPCSummonSign(npcEntityId) end

-- Character

---@param entityId number
---@param teamType TeamType
function EMEVD.SetCharacterTeamType(entityId, teamType) end

---@param entityId number
---@param shouldReceiveRunes boolean
function EMEVD.ForceCharacterDeath(entityId, shouldReceiveRunes) end

---@param entityId number
---@param command number
---@param slot number
function EMEVD.EzstateInstructionRequest(entityId, command, slot) end

---@param entityId number
function EMEVD.CreateBulletOwner(entityId) end

---@param entityId number
---@param SpEffectId number
function EMEVD.SetSpEffect(entityId, SpEffectId) end

---@param entityId number
---@param entityId2 number
function EMEVD.SetCharacterEventTarget(entityId, entityId2) end

---@param entityId number
---@param areaEntityId number
function EMEVD.SetCharacterHome(entityId, areaEntityId) end

---@param entityId number
---@param relativeEntityId number
---@param animationId number
---@param shouldWaitForCompletion boolean
function EMEVD.RotateCharacter(entityId, relativeEntityId, animationId, shouldWaitForCompletion) end

---@param entityId number
function EMEVD.ClearCharactersAITarget(entityId) end

---@param entityId number
---@param commandId number
---@param slotNumber number
function EMEVD.RequestCharacterAICommand(entityId, commandId, slotNumber) end

---@param entityId number
---@param relativeEntityId number
---@param reactionDistance number
function EMEVD.SetEventPoint(entityId, relativeEntityId, reactionDistance) end

---@param entityId number
---@param aiId number
function EMEVD.SetCharacterAIId(entityId, aiId) end

---@param entityId number
function EMEVD.RequestCharacterAIRePlan(entityId) end

---@param entityId number
---@param SpEffectId number
function EMEVD.ClearSpEffect(entityId, SpEffectId) end

---@param entityId number
---@param npcPartId number
---@param npcPartGroupIdx NPCPartType
---@param npcPartHP number
---@param damageCorrection number
---@param bodyDamageCompensation number
---@param isInvincible boolean
---@param startInStoppedState boolean
function EMEVD.CreateNPCPart(entityId, npcPartId, npcPartGroupIdx, npcPartHP, damageCorrection, bodyDamageCompensation,
                             isInvincible, startInStoppedState) end

---@param entityId number
---@param npcPartId number
---@param desiredHP number
---@param shouldAllowHPAboveMaxHP boolean
function EMEVD.SetNPCPartHP(entityId, npcPartId, desiredHP, shouldAllowHPAboveMaxHP) end

---@param entityId number
---@param npcPartId number
---@param defenseMaterialSEId number
---@param defenseMaterialSFXId number
---@param unknowna number
---@param unknownb number
---@param unknownc number
function EMEVD.SetNPCPartSEAndSFX(entityId, npcPartId, defenseMaterialSEId, defenseMaterialSFXId, unknowna, unknownb,
                                  unknownc) end

---@param entityId number
---@param npcPartId number
---@param bulletDamageMultiplier number
function EMEVD.SetNPCPartBulletDamageMultiplier(entityId, npcPartId, bulletDamageMultiplier) end

---@param entityId number
---@param bitNumber number
---@param switchType OnOffChange
function EMEVD.ChangeCharacterDispmask(entityId, bitNumber, switchType) end

---@param characterEntityId number
---@param bitNumber number
---@param switchType OnOffChange
function EMEVD.ChangeCharacterHitmask(characterEntityId, bitNumber, switchType) end

---@param entityId number
---@param authorityLevel AuthorityLevel
function EMEVD.SetNetworkUpdateAuthority(entityId, authorityLevel) end

---@param entityId number
---@param removed boolean
function EMEVD.SetCharacterBackreadState(entityId, removed) end

---@param entityId number
---@param disabled boolean
function EMEVD.SetCharacterMaphit(entityId, disabled) end

---@param sourceEntityId number
---@param targetEntityId number
function EMEVD.CreateReferredDamagePair(sourceEntityId, targetEntityId) end

---@param entityId number
---@param useFixedFrequency boolean
---@param updateFrequency CharacterUpdateFrequency
function EMEVD.SetNetworkUpdateRate(entityId, useFixedFrequency, updateFrequency) end

---@param characterEntityId number
function EMEVD.ForceCharacterTreasure(characterEntityId) end

---@param dummy number
function EMEVD.BetrayCharactersCurrentCovenant(dummy) end

---@param entityId number
---@param warpEntityType TargetEntityType
---@param warpDestinationEntityId number
---@param dummypolyId number
---@param warpDestinationHitEntityId number
function EMEVD.WarpCharacterAndSetFloor(entityId, warpEntityType, warpDestinationEntityId, dummypolyId,
                                        warpDestinationHitEntityId) end

---@param entityId number
---@param warpEntityType TargetEntityType
---@param warpDestinationEntityId number
---@param dummypolyId number
function EMEVD.IssueShortWarpRequest(entityId, warpEntityType, warpDestinationEntityId, dummypolyId) end

---@param entityId number
---@param warpEntityType TargetEntityType
---@param warpDestinationEntityId number
---@param dummypolyId number
---@param entityIdToCopyFloorFrom number
function EMEVD.WarpCharacterAndCopyFloor(entityId, warpEntityType, warpDestinationEntityId, dummypolyId,
                                         entityIdToCopyFloorFrom) end

---@param characterEntityId number
---@param state DisabledEnabled
function EMEVD.RequestCharacterAnimationReset(characterEntityId, state) end

function EMEVD.BonfireLikeRecovery() end

---@param entityId number
---@param bitNumber number
---@param stateId number
function EMEVD.ChangeCharactersCloth(entityId, bitNumber, stateId) end

---@param characterEntityId number
---@param patrolInformationEntityId number
function EMEVD.ChangeCharacterPatrolBehavior(characterEntityId, patrolInformationEntityId) end

---@param characterParamId number
function EMEVD.ChangeCharacter(characterParamId) end

---@param entityId number
---@param range number
function EMEVD.SetCharacterTalkRange(entityId, range) end

---@param characterEntityId number
---@param caravanAssetEntityId number
function EMEVD.ConnectCharacterToCaravan(characterEntityId, caravanAssetEntityId) end

---@param characterEntityId number
---@param distance number
function EMEVD.SetCharacterEnableDistance(characterEntityId, distance) end

---@param sourceCharacterEntityId number
---@param targetCharacterEntityId number
function EMEVD.CopyPlayerCharacterData(sourceCharacterEntityId, targetCharacterEntityId) end

---@param characterEntityId number
---@param dummypolyId number
---@param assetEntityId number
function EMEVD.AttachAssetToCharacter(characterEntityId, dummypolyId, assetEntityId) end

---@param entityId number
---@param warpEntityType TargetEntityType
---@param warpDestinationEntityId number
---@param dummypolyId number
---@param entityIdToCopyFloorFrom number
---@param useBonfireEffect boolean
---@param resetCamera boolean
function EMEVD.WarpCharacterAndCopyFloorWithFadeOut(entityId, warpEntityType, warpDestinationEntityId, dummypolyId,
                                                    entityIdToCopyFloorFrom, useBonfireEffect, resetCamera) end

---@param characterEntityId number
---@param overrideSlot number
---@param faceParamId number
function EMEVD.SetCharacterFaceParamOverride(characterEntityId, overrideSlot, faceParamId) end

---@param fadeToBlackRatio number
---@param fadeToBlackTimeS number
---@param freezePlayer boolean
---@param freezePlayerDelayS number
function EMEVD.FadeToBlack(fadeToBlackRatio, fadeToBlackTimeS, freezePlayer, freezePlayerDelayS) end

---@param poolType number
---@param fallbackCharacterParamId number
---@param targetEntityId number
function EMEVD.CopyCharacterDataFromOnlinePlayers(poolType, fallbackCharacterParamId, targetEntityId) end

---@param poolType number
---@param unknown number
function EMEVD.RequestCharacterDataFromOnlinePlayers(poolType, unknown) end

---@param poolType number
function EMEVD.SendCharacterDataToOnlinePlayers(poolType) end

---@param characterEntityId number
function EMEVD.ResetCharacterPosition(characterEntityId) end

---@param characterEntityId number
---@param flagState OnOff
function EMEVD.SetSpecialStandbyEndedFlag(characterEntityId, flagState) end

---@param opacity number
---@param fadeTimeS number
---@param freezePlayer boolean
---@param freezePlayerDelayS number
---@param red number
---@param green number
---@param blue number
function EMEVD.FadeToColor(opacity, fadeTimeS, freezePlayer, freezePlayerDelayS, red, green, blue) end

-- Asset

---@param entityId number
---@param slotNumber number
function EMEVD.RequestAssetDestruction(entityId, slotNumber) end

---@param entityId number
function EMEVD.RequestAssetRestoration(entityId) end

---@param entityId number
---@param objActParamId number
---@param relativeTargetIdx number
function EMEVD.InitializeObjAct(entityId, objActParamId, relativeTargetIdx) end

---@param targetAssetEntityId number
---@param animationId number
function EMEVD.ReproduceAssetAnimation(targetAssetEntityId, animationId) end

---@param entityId number
---@param slotNumber number
function EMEVD.ReproduceAssetDestruction(entityId, slotNumber) end

---@param eventFlagId number
---@param entityId number
---@param dummypolyId number
---@param behaviorId number
---@param target DamageTargetType
---@param radius number
---@param lifespan number
---@param repetitionTimeS number
function EMEVD.CreateDamagingAsset(eventFlagId, entityId, dummypolyId, behaviorId, target, radius, lifespan,
                                   repetitionTimeS) end

---@param entityId number
---@param characterEntityId number
---@param dummypolyId number
function EMEVD.WarpAssetToCharacter(entityId, characterEntityId, dummypolyId) end

---@param eventFlagId number
function EMEVD.DeleteAssetEvent(eventFlagId) end

---@param targetAssetEntityId number
function EMEVD.RerollAssetTreasure(targetAssetEntityId) end

---@param caravanAssetEntityId number
---@param characterEntityId number
function EMEVD.AttachCaravanToController(caravanAssetEntityId, characterEntityId) end

---@param childAssetEntityId number
---@param parentAssetEntityId number
---@param parentDummypolyId number
function EMEVD.AttachAssetToAsset(childAssetEntityId, parentAssetEntityId, parentDummypolyId) end

---@param eventFlagId number
---@param entityId number
---@param startingDummypolyId number
---@param endingDummypolyId number
---@param behaviorId number
---@param target DamageTargetType
---@param radius number
---@param lifespan number
---@param repetitionTimeS number
function EMEVD.CreateBigDamagingAsset(eventFlagId, entityId, startingDummypolyId, endingDummypolyId, behaviorId, target,
                                      radius, lifespan, repetitionTimeS) end

-- SFX

---@param entityId number
---@param onlyDeleteRoot boolean
function EMEVD.DeleteMapSFX(entityId, onlyDeleteRoot) end

---@param entityId number
function EMEVD.SpawnMapSFX(entityId) end

---@param targetEntityType TargetEntityType
---@param entityId number
---@param dummypolyId number
---@param sfxId number
function EMEVD.SpawnOneshotSFX(targetEntityType, entityId, dummypolyId, sfxId) end

---@param assetEntityId number
---@param dummypolyId number
---@param sfxId number
function EMEVD.CreateAssetFollowingSFX(assetEntityId, dummypolyId, sfxId) end

---@param assetEntityId number
---@param shouldDeleteRoot boolean
function EMEVD.DeleteAssetFollowingSFX(assetEntityId, shouldDeleteRoot) end

---@param windSFXId number
function EMEVD.SetWindSFX(windSFXId) end

-- Message

---@param messageId number
---@param dialogType PromptType
---@param numberOfOptions NumberOfOptions
---@param entityId number
---@param displayDistance number
function EMEVD.DisplayGenericDialog(messageId, dialogType, numberOfOptions, entityId, displayDistance) end

---@param bannerType TextBannerType
function EMEVD.DisplayBanner(bannerType) end

---@param messageId number
---@param padState DisabledEnabled
function EMEVD.DisplayStatusMessage(messageId, padState) end

---@param messageId number
function EMEVD.DisplayBlinkingMessage(messageId) end

---@param messageId number
function EMEVD.DisplayFullScreenMessage(messageId) end

---@param messageId number
---@param dialogType PromptType
---@param numberOfOptions NumberOfOptions
---@param entityId number
---@param displayDistance number
---@param leftResponseEventFlagId number
---@param rightResponseEventFlagId number
---@param cancelResponseEventFlagId number
function EMEVD.DisplayGenericDialogAndSetEventFlags(messageId, dialogType, numberOfOptions, entityId, displayDistance,
                                                    leftResponseEventFlagId, rightResponseEventFlagId,
                                                    cancelResponseEventFlagId) end

---@param messageId number
---@param priority number
---@param shouldInterrupt boolean
function EMEVD.DisplayBlinkingMessageWithPriority(messageId, priority, shouldInterrupt) end

---@param messageId number
function EMEVD.DisplaySubareaWelcomeMessage(messageId) end

---@param messageId number
function EMEVD.DisplayAreaWelcomeMessage(messageId) end

---@param tutorialParamId number
---@param unknown boolean
---@param unknown2 boolean
function EMEVD.ShowTutorialPopup(tutorialParamId, unknown, unknown2) end

---@param networkMessageId number
---@param unknown boolean
function EMEVD.DisplayNetworkMessage(networkMessageId, unknown) end

-- Camera

---@param normalCameraId number
---@param lockedCameraId number
function EMEVD.ChangeCamera(normalCameraId, lockedCameraId) end

---@param vibrationId number
---@param targetEntityType TargetEntityType
---@param entityId number
---@param dummypolyId number
---@param decayStartDistance number
---@param decayEndDistance number
function EMEVD.SetCameraVibration(vibrationId, targetEntityType, entityId, dummypolyId, decayStartDistance,
                                  decayEndDistance) end

---@param areaId number
---@param blockId number
---@param lockcamSlotNumber number
function EMEVD.SetLockcamSlotNumber(areaId, blockId, lockcamSlotNumber) end

---@param xAngle number
---@param yAngle number
function EMEVD.SetCameraAngle(xAngle, yAngle) end

-- Script

---@param disableTopEventFlagId number
---@param disableBottomEventFlagId number
---@param entityId number
function EMEVD.RegisterLadder(disableTopEventFlagId, disableBottomEventFlagId, entityId) end

---@param eventFlagId number
---@param entityId number
---@param reactionDistance number
---@param reactionAngle number
---@param setStandardKindlingLevel number
---@param enemyDeactivationDistance number
function EMEVD.RegisterBonfire(eventFlagId, entityId, reactionDistance, reactionAngle, setStandardKindlingLevel,
                               enemyDeactivationDistance) end

---@param entityId number
function EMEVD.ActivateMultiplayerDependantBuffs(entityId) end

---@param dummy number
function EMEVD.IssueBossRoomEntryNotification(dummy) end

---@param unknown number
function EMEVD.SendInvadingPhantomsHome(unknown) end

---@param dummy number
function EMEVD.SendAllPhantomsHome(dummy) end

---@param unknown number
function EMEVD.SendAllPhantomsHomeAndUpdateServerPvpStats(unknown) end

-- Sound

---@param entityId number
---@param soundType SoundType
---@param soundId number
function EMEVD.PlaySE(entityId, soundType, soundId) end

---@param soundType SoundType
---@param unknown number
---@param isSuppressionActive boolean
function EMEVD.SuppressSE(soundType, unknown, isSuppressionActive) end

---@param bgmBossConvParamId number
---@param state BossBGMState
function EMEVD.SetBossBGM(bgmBossConvParamId, state) end

---@param timeS number
function EMEVD.SuppressSoundForFogGate(timeS) end

---@param npcThreatLevel number
---@param heatUp boolean
function EMEVD.SetFieldBattleBGMHeatUp(npcThreatLevel, heatUp) end

-- Map

---@param gparamSubId number
---@param changeTimeS number
function EMEVD.ActivateGparamOverride(gparamSubId, changeTimeS) end

---@param changeTimeS number
function EMEVD.DeactivateGparamOverride(changeTimeS) end

-- System

function EMEVD.EnableNetworkSync() end

function EMEVD.DisableNetworkSync() end

-- Event

---@param generatorEntityId number
function EMEVD.EnableGenerator(generatorEntityId) end

---@param generatorEntityId number
function EMEVD.DisableGenerator(generatorEntityId) end

---@param entityId number
function EMEVD.EnableMapHit(entityId) end

---@param entityId number
function EMEVD.DisableMapHit(entityId) end

---@param entityId number
function EMEVD.EnableMapVisibility(entityId) end

---@param entityId number
function EMEVD.DisableMapVisibility(entityId) end

---@param messageEntityId number
function EMEVD.EnableMessageVisibility(messageEntityId) end

---@param messageEntityId number
function EMEVD.DisableMessageVisibility(messageEntityId) end

function EMEVD.EnableDirectionDisplay() end

function EMEVD.DisableDirectionDisplay() end

function EMEVD.EnableTextOnLoadingScreen() end

function EMEVD.DisableTextOnLoadingScreen() end

-- Character

---@param entityId number
function EMEVD.EnableCharacterAI(entityId) end

---@param entityId number
function EMEVD.DisableCharacterAI(entityId) end

---@param characterEntityId number
function EMEVD.EnableCharacter(characterEntityId) end

---@param characterEntityId number
function EMEVD.DisableCharacter(characterEntityId) end

---@param entityId number
function EMEVD.EnableCharacterGravity(entityId) end

---@param entityId number
function EMEVD.DisableCharacterGravity(entityId) end

---@param entityId number
function EMEVD.EnableCharacterImmortality(entityId) end

---@param entityId number
function EMEVD.DisableCharacterImmortality(entityId) end

---@param entityId number
function EMEVD.EnableCharacterInvincibility(entityId) end

---@param entityId number
function EMEVD.DisableCharacterInvincibility(entityId) end

---@param entityId number
function EMEVD.EnableCharacterHPBarDisplay(entityId) end

---@param entityId number
function EMEVD.DisableCharacterHPBarDisplay(entityId) end

---@param entityId number
function EMEVD.EnableCharacterDefaultBackread(entityId) end

---@param entityId number
function EMEVD.DisableCharacterDefaultBackread(entityId) end

---@param entityId number
function EMEVD.EnableCharacterCollision(entityId) end

---@param entityId number
function EMEVD.DisableCharacterCollision(entityId) end

---@param entityId number
---@param lockOnDummypolyId number
function EMEVD.EnableLockOnPoint(entityId, lockOnDummypolyId) end

---@param entityId number
---@param lockOnDummypolyId number
function EMEVD.DisableLockOnPoint(entityId, lockOnDummypolyId) end

---@param characterEntityId number
function EMEVD.EnableCharacterDisableOnHitUnload(characterEntityId) end

---@param characterEntityId number
function EMEVD.DisableCharacterDisableOnHitUnload(characterEntityId) end

---@param characterEntityId number
function EMEVD.EnableDistanceBasedNetworkUpdateAuthority(characterEntityId) end

---@param characterEntityId number
function EMEVD.DisableDistanceBasedNetworkUpdateAuthority(characterEntityId) end

---@param characterEntityId number
function EMEVD.EnableCharacterFadeOnEnable(characterEntityId) end

---@param characterEntityId number
function EMEVD.DisableCharacterFadeOnEnable(characterEntityId) end

-- Asset

---@param targetAssetEntityId number
function EMEVD.EnableAsset(targetAssetEntityId) end

---@param targetAssetEntityId number
function EMEVD.DisableAsset(targetAssetEntityId) end

---@param targetAssetEntityId number
function EMEVD.EnableAssetTreasure(targetAssetEntityId) end

---@param targetAssetEntityId number
function EMEVD.DisableAssetTreasure(targetAssetEntityId) end

---@param entityId number
---@param objActParamId number
function EMEVD.EnableObjAct(entityId, objActParamId) end

---@param entityId number
---@param objActParamId number
function EMEVD.DisableObjAct(entityId, objActParamId) end

---@param targetAssetEntityId number
function EMEVD.EnableAssetInvulnerability(targetAssetEntityId) end

---@param targetAssetEntityId number
function EMEVD.DisableAssetInvulnerability(targetAssetEntityId) end

---@param entityId number
---@param objActParamId number
---@param relativeTargetIdx number
function EMEVD.EnableObjActAssignIdx(entityId, objActParamId, relativeTargetIdx) end

---@param entityId number
---@param objActParamId number
---@param relativeTargetIdx number
function EMEVD.DisableObjActAssignIdx(entityId, objActParamId, relativeTargetIdx) end

-- Hit

---@param hitEntityId number
function EMEVD.EnableHit(hitEntityId) end

---@param hitEntityId number
function EMEVD.DisableHit(hitEntityId) end

---@param hitEntityId number
function EMEVD.EnableHitBackreadMask(hitEntityId) end

---@param hitEntityId number
function EMEVD.DisableHitBackreadMask(hitEntityId) end

---@param hitEntityId number
function EMEVD.EnableHitres(hitEntityId) end

---@param hitEntityId number
function EMEVD.DisableHitres(hitEntityId) end

-- Map

---@param mapPartEntityId number
function EMEVD.EnableMapPart(mapPartEntityId) end

---@param mapPartEntityId number
function EMEVD.DisableMapPart(mapPartEntityId) end

function EMEVD.EnableAreaWelcomeMessage() end

function EMEVD.DisableAreaWelcomeMessage() end

-- Condition - Timer

---@param hours number
---@param minutes number
---@param seconds number
---@return boolean
function EMEVD.TimeOfDay(hours, minutes, seconds) end

---@param startingHours number
---@param startingMinutes number
---@param startingSeconds number
---@param endingHours number
---@param endingMinutes number
---@param endingSeconds number
---@return boolean
function EMEVD.TimeOfDayInRange(startingHours, startingMinutes, startingSeconds, endingHours, endingMinutes,
                                endingSeconds) end

-- Condition - Event

---@param desiredFlagState OnOffChange
---@param targetEventFlagType TargetEventFlagType
---@param targetEventFlagId number
---@return boolean
function EMEVD.EventFlag(desiredFlagState, targetEventFlagType, targetEventFlagId) end

---@param desiredFlagState LogicalOperationType
---@param targetEventFlagType TargetEventFlagType
---@param startingTargetEventFlagId number
---@param endingTargetEventFlagId number
---@return boolean
function EMEVD.BatchEventFlags(desiredFlagState, targetEventFlagType, startingTargetEventFlagId, endingTargetEventFlagId) end

---@param desiredState InsideOutsideState
---@param targetEntityId number
---@param areaEntityId number
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.InOutsideArea(desiredState, targetEntityId, areaEntityId, numberOfTargetCharacters) end

---@param desiredState InsideOutsideState
---@param targetEntityIdA number
---@param targetEntityIdB number
---@param targetDistance number
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.EntityInOutsideRadiusOfEntity(desiredState, targetEntityIdA, targetEntityIdB, targetDistance,
                                             numberOfTargetCharacters) end

---@param itemType ItemType
---@param itemId number
---@param desiredPossessionState OwnershipState
---@return boolean
function EMEVD.PlayerHasDoesntHaveItem(itemType, itemId, desiredPossessionState) end

---@param desiredMultiplayerState MultiplayerState
---@return boolean
function EMEVD.MultiplayerState(desiredMultiplayerState) end

---@param desiredState InsideOutsideState
---@param areaEntityId number
---@return boolean
function EMEVD.AllPlayersInOutsideArea(desiredState, areaEntityId) end

---@param shouldPlayerBeInside boolean
---@param areaId number
---@param blockId number
---@param regionId number
---@param indexId number
---@return boolean
function EMEVD.PlayerInOutMap(shouldPlayerBeInside, areaId, blockId, regionId, indexId) end

---@param multiplayerEventId number
---@return boolean
function EMEVD.MultiplayerEvent(multiplayerEventId) end

---@param targetEventFlagType TargetEventFlagType
---@param startingTargetEventFlagId number
---@param endingTargetEventFlagId number
---@param comparisonType ComparisonType
---@param countThreshold number
---@return boolean
function EMEVD.CountEventFlags(targetEventFlagType, startingTargetEventFlagId, endingTargetEventFlagId, comparisonType,
                               countThreshold) end

---@param baseEventFlagId number
---@param numberOfUsedFlagBits number
---@param comparisonType ComparisonType
---@param thresholdValue number
---@return boolean
function EMEVD.EventValue(baseEventFlagId, numberOfUsedFlagBits, comparisonType, thresholdValue) end

---@param areaEntityId number
---@return boolean
function EMEVD.DroppedItemsInArea(areaEntityId) end

---@param itemType ItemType
---@param itemId number
---@return boolean
function EMEVD.DroppedItem(itemType, itemId) end

---@param itemType ItemType
---@param itemId number
---@param desiredPossessionState OwnershipState
---@return boolean
function EMEVD.PlayerHasDoesntHaveItemIncludingBbox(itemType, itemId, desiredPossessionState) end

---@param comparisonType ComparisonType
---@param completedGameCyclesThreshold number
---@return boolean
function EMEVD.GameCycle(comparisonType, completedGameCyclesThreshold) end

---@param leftSideBaseEventFlagId number
---@param leftSideNumberOfUsedFlagBits number
---@param comparisonType ComparisonType
---@param rightSideBaseEventFlagId number
---@param rightSideNumberOfUsedFlagBits number
---@return boolean
function EMEVD.CompareEventValues(leftSideBaseEventFlagId, leftSideNumberOfUsedFlagBits, comparisonType,
                                  rightSideBaseEventFlagId, rightSideNumberOfUsedFlagBits) end

---@param onlineMode boolean
---@return boolean
function EMEVD.OnlineMode(onlineMode) end

---@param targetEntityId number
---@param attackerEntityId number
---@param damageType DamageType
---@return boolean
function EMEVD.DamageType(targetEntityId, attackerEntityId, damageType) end

---@param actionButtonParameterId number
---@param targetEntityId number
---@return boolean
function EMEVD.ActionButtonInArea(actionButtonParameterId, targetEntityId) end

---@param worldType WorldType
---@return boolean
function EMEVD.PlayerIsInWorldType(worldType) end

---@param areaId number
---@param blockId number
---@param regionId number
---@param indexId number
---@return boolean
function EMEVD.MapLoaded(areaId, blockId, regionId, indexId) end

---@param weather Weather
---@param startDelayDuringChangeS number
---@param endDelayDuringChangeS number
---@return boolean
function EMEVD.WeatherActive(weather, startDelayDuringChangeS, endDelayDuringChangeS) end

---@param hasPermission boolean
---@param unknown boolean
---@param areaId number
---@param blockId number
---@param regionId number
---@param indexId number
---@return boolean
function EMEVD.MapHasPermissionToUpdate(hasPermission, unknown, areaId, blockId, regionId, indexId) end

---@param npcThreatLevel number
---@param isActive boolean
---@return boolean
function EMEVD.FieldBattleBGMActive(npcThreatLevel, isActive) end

---@param armorType ArmorType
---@param armorItemId number
---@param unknown number
---@return boolean
function EMEVD.PlayerHasArmorEquipped(armorType, armorItemId, unknown) end

---@param isActive boolean
---@param ceremonyId number
---@return boolean
function EMEVD.CeremonyActive(isActive, ceremonyId) end

---@param weatherLotParamId number
---@param isActive boolean
---@return boolean
function EMEVD.WeatherLotActive(weatherLotParamId, isActive) end

---@param gender Gender
---@return boolean
function EMEVD.PlayerGender(gender) end

---@param ready boolean
---@return boolean
function EMEVD.ArenaMatchReadyState(ready) end

---@param result ArenaResult
---@return boolean
function EMEVD.ArenaSoloResults(result) end

---@param comparisonType ComparisonType
---@param targetScore number
---@return boolean
function EMEVD.ArenaSoloScoreComparison(comparisonType, targetScore) end

---@param result ArenaResult
---@return boolean
function EMEVD.ArenaTeamResults(result) end

---@param comparisonType ComparisonType
---@param targetScore number
---@return boolean
function EMEVD.ArenaTeamScoreComparison(comparisonType, targetScore) end

---@param matchType ArenaMatchType
---@param hasSpiritSummon boolean
---@return boolean
function EMEVD.ArenaMatchType(matchType, hasSpiritSummon) end

---@return boolean
function EMEVD.PlayerRespawnedInArena() end

---@param tutorialParamId number
---@return boolean
function EMEVD.TutorialSeen(tutorialParamId) end

-- Condition - Character

---@param targetEntityId number
---@param desiredLifeState DeathState
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterDeadAlive(targetEntityId, desiredLifeState, comparisonType, numberOfTargetCharacters) end

---@param targetEntityId number
---@param comparisonType ComparisonType
---@param targetHPRatio number
---@param comparisonType2 ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterHPRatio(targetEntityId, comparisonType, targetHPRatio, comparisonType2, numberOfTargetCharacters) end

---@param targetEntityId number
---@param targetType TargetType
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterType(targetEntityId, targetType, comparisonType, numberOfTargetCharacters) end

---@param aggressorEntityId number
---@param targetEntityId number
---@param shouldHave boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterTargetedBy(aggressorEntityId, targetEntityId, shouldHave, comparisonType,
                                   numberOfTargetCharacters) end

---@param targetEntityId number
---@param SpEffectId number
---@param shouldHave boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterHasSpEffect(targetEntityId, SpEffectId, shouldHave, comparisonType, numberOfTargetCharacters) end

---@param targetEntityId number
---@param npcPartId number
---@param hpThreshold number
---@param comparisonType ComparisonType
---@return boolean
function EMEVD.NPCPartHP(targetEntityId, npcPartId, hpThreshold, comparisonType) end

---@param targetEntityId number
---@param isBackread boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterBackreadStatus(targetEntityId, isBackread, comparisonType, numberOfTargetCharacters) end

---@param targetEntityId number
---@param targetEventMessageId number
---@param shouldHave boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterHasEventMessage(targetEntityId, targetEventMessageId, shouldHave, comparisonType,
                                        numberOfTargetCharacters) end

---@param targetEntityId number
---@param aiState AIStateType
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterAIState(targetEntityId, aiState, comparisonType, numberOfTargetCharacters) end

---@param classType ClassType
---@return boolean
function EMEVD.PlayersClass(classType) end

---@param covenantIndex number
---@return boolean
function EMEVD.PlayersCovenant(covenantIndex) end

---@param comparisonType ComparisonType
---@param targetSoulLevel number
---@return boolean
function EMEVD.PlayersSoulLevel(comparisonType, targetSoulLevel) end

---@param targetEntityId number
---@param comparisonType ComparisonType
---@param targetHP number
---@param comparisonType2 ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterHPValue(targetEntityId, comparisonType, targetHP, comparisonType2, numberOfTargetCharacters) end

---@param targetEntityId number
---@param desiredLifeState DeathState
---@param comparisonType ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.CharacterRatioDeadAlive(targetEntityId, desiredLifeState, comparisonType, targetRatio) end

---@param targetEntityId number
---@param comparisonType ComparisonType
---@param targetAmount number
---@param comparisonType2 ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.CharacterRatioHPRatio(targetEntityId, comparisonType, targetAmount, comparisonType2, targetRatio) end

---@param targetEntityId number
---@param SpEffectId number
---@param shouldHave boolean
---@param comparisonType ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.CharacterRatioHasSpEffect(targetEntityId, SpEffectId, shouldHave, comparisonType, targetRatio) end

---@param targetEntityId number
---@param aiState AIStateType
---@param comparisonType ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.CharacterRatioAIState(targetEntityId, aiState, comparisonType, targetRatio) end

---@param minNPCThreatLevel number
---@param maxNPCThreatLevel number
---@param aiStateType AIStateType
---@return boolean
function EMEVD.PlayerTargeted(minNPCThreatLevel, maxNPCThreatLevel, aiStateType) end

---@param targetEntityId number
---@param npcPartId number
---@param attackerEntityId number
---@param damageType DamageType
---@return boolean
function EMEVD.NPCPartAttributeDamage(targetEntityId, npcPartId, attackerEntityId, damageType) end

---@param targetEntityId number
---@param invadeTypeUnknown number
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterInvadeType(targetEntityId, invadeTypeUnknown, comparisonType, numberOfTargetCharacters) end

---@param targetEntityId number
---@param isMounted boolean
---@return boolean
function EMEVD.CharacterRidingMount(targetEntityId, isMounted) end

---@param targetEntityId number
---@param stateInfo number
---@param shouldHave boolean
---@param comparisonType ComparisonType
---@param numberOfTargetCharacters number
---@return boolean
function EMEVD.CharacterHasStateInfo(targetEntityId, stateInfo, shouldHave, comparisonType, numberOfTargetCharacters) end

---@param targetEntityId number
---@param desiredFlagState OnOffChange
---@return boolean
function EMEVD.SpecialStandbyEndedFlag(targetEntityId, desiredFlagState) end

-- Condition - Asset

---@param damageState DestructionState
---@param targetAssetEntityId number
---@param comparisonType ComparisonType
---@param numberOfTargetAssets number
---@return boolean
function EMEVD.AssetDestroyed(damageState, targetAssetEntityId, comparisonType, numberOfTargetAssets) end

---@param targetEntityId number
---@param attackerEntityId number
---@return boolean
function EMEVD.AssetHitBy(targetEntityId, attackerEntityId) end

---@param objActEventFlag number
---@return boolean
function EMEVD.ObjActEventFlag(objActEventFlag) end

---@param targetEntityId number
---@param comparisonType ComparisonType
---@param hpThreshold number
---@param comparisonType2 ComparisonType
---@param numberOfTargetAssets number
---@return boolean
function EMEVD.AssetHP(targetEntityId, comparisonType, hpThreshold, comparisonType2, numberOfTargetAssets) end

---@param damageState DestructionState
---@param targetEntityId number
---@param comparisonType ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.AssetRatioDestroyed(damageState, targetEntityId, comparisonType, targetRatio) end

---@param targetEntityId number
---@param comparisonType ComparisonType
---@param burnStateUnknown number
---@param comparisonType2 ComparisonType
---@param numberOfTargetAssets number
---@return boolean
function EMEVD.AssetBurnState(targetEntityId, comparisonType, burnStateUnknown, comparisonType2, numberOfTargetAssets) end

---@param targetEntityId number
---@param isBackread boolean
---@param comparisonType ComparisonType
---@param numberOfTargetAssets number
---@return boolean
function EMEVD.AssetBackread(targetEntityId, isBackread, comparisonType, numberOfTargetAssets) end

---@param targetEntityId number
---@param isBackread boolean
---@param comparisonType ComparisonType
---@param targetRatio number
---@return boolean
function EMEVD.AssetRatioBackread(targetEntityId, isBackread, comparisonType, targetRatio) end

-- Condition - Hit

---@param hitEntityId number
---@return boolean
function EMEVD.PlayerMovingOnHit(hitEntityId) end

---@param hitEntityId number
---@return boolean
function EMEVD.PlayerAttackingOnHit(hitEntityId) end

---@param hitEntityId number
---@return boolean
function EMEVD.PlayerStandingOnHit(hitEntityId) end

---@param hitEntityId number
---@return boolean
function EMEVD.PlayerStandingOnHitGroup(hitEntityId) end
