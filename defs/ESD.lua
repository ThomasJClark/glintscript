---@meta
ESD = {}

---@enum ESD.ChangeType
ESD.ChangeType = {
    Add = 0,
    Subtract = 1,
    Multiply = 2,
    Divide = 3,
    Modulus = 4,
    Set = 5,
}

---@enum ESD.ChrType
ESD.ChrType = {
    Hollow = 8,
}

---@enum ESD.CompareType
ESD.CompareType = {
    Equal = 0,
    NotEqual = 1,
    Greater = 2,
    Less = 3,
    GreaterOrEqual = 4,
    LessOrEqual = 5,
}

---@enum ESD.DialogBoxStyle
ESD.DialogBoxStyle = {
    OrnateNoOptions = 0,
    DialogOptions = 1,
    OrnateOptions = 2,
    OrnateYesOption = 3,
    Unk = 4,
}

---@enum ESD.DialogBoxType
ESD.DialogBoxType = {
    CenterMiddleDimScreen1 = 1,
    CenterMiddleDimScreen2 = 2,
    CenterBottom1 = 7,
    CenterBottom2 = 8,
}

---@enum ESD.DialogResult
ESD.DialogResult = {
    Cancel = 0,
    Left = 1,
    Right = 2,
    Leave = 3,
}

---@enum ESD.EnhanceType
ESD.EnhanceType = {
    UnlimitedRange = 0,
    LimitedRange = 1,
}

---@enum ESD.EstusType
ESD.EstusType = {
    HP = 0,
    FP = 1,
}

---@enum ESD.FlagState
ESD.FlagState = {
    Off = 0,
    On = 1,
}

---@enum ESD.ItemType
ESD.ItemType = {
    Weapon = 0,
    Protector = 1,
    Accessory = 2,
    Goods = 3,
}

---@enum ESD.MenuType
ESD.MenuType = {
    Talk = 11,
    Repair = 12,
    Reinforcement = 13,
    LevelUp = 23,
    Attunement = 25,
    Storage = 26,
    CharacterEdit = 30,
    CovenantOffering = 31,
    Warp = 36,
    Unk = 53,
    Bonfire = 63,
}

---@enum ESD.PlayerStat
ESD.PlayerStat = {
    Vigor = 0,
    Mind = 1,
    Endurance = 2,
    Strength = 3,
    Dexterity = 4,
    Intelligence = 5,
    Faith = 6,
    Arcane = 7,
    RunesCollected = 8,
    TotalGetRunes = 9,
    Humanity = 10,
    CovenantType = 11,
    Gender = 12,
    EquippedCovenantPoints = 15,
    EquippedCovenantLevel = 16,
    BladeOfDarkmoonPoints = 17,
    WarriorOfSunlightPoints = 18,
    MoundMakersPoints = 19,
    SpearsOfTheChurchPoints = 20,
    RosariasFingersPoints = 21,
    WatchdogsOfFarronPoints = 22,
    AldrichFaithfulPoints = 23,
    BladeOfDarkmoonLevel = 24,
    WarriorOfSunlightLevel = 25,
    MoundMakersLevel = 26,
    SpearsOfTheChurchLevel = 27,
    RosariasFingersLevel = 28,
    WatchdogsOfFarronLevel = 29,
    AldrichFaithfulLevel = 30,
    Hollowing = 31,
    HollowingCovenantLevel = 32,
    RuneLevel = 33,
    RemainingYoelLevels = 34,
    WayOfBluePoints = 35,
    WayOfBlueLevel = 36,
    BlueSentinelsPoints = 37,
    BlueSentinelsLevel = 38,
}

---@enum ESD.TalkOptionsType
ESD.TalkOptionsType = {
    Old = 0,
    Regular = 1,
}

---@enum ESD.Trophy
ESD.Trophy = {
    AllAchievements = 0,
    EldenLord = 1,
    AgeOfTheStars = 2,
    LordOfFrenziedFlame = 3,
    ShardbearerGodrick = 4,
    ShardbearerRadahn = 5,
    ShardbearerMorgott = 6,
    ShardbearerRykard = 7,
    ShardbearerMalenia = 8,
    ShardbearerMohg = 9,
    MalikethTheBlackBlade = 10,
    HoarahLouxWarrior = 11,
    DragonlordPlacidusax = 12,
    GodSlayingArmament = 13,
    LegendaryArmaments = 14,
    LegendaryAshenRemains = 15,
    LegendarySorceriesAndIncantations = 16,
    LegendaryTalismans = 17,
    RennalaQueenOfTheFullMoon = 18,
    LichdragonFortissax = 19,
    GodskinDuo = 20,
    FireGiant = 21,
    DragonkinSoldierOfNokstella = 22,
    RegalAncestorSpirit = 23,
    ValiantGargoyles = 24,
    MargitTheFellOmen = 25,
    RedWolfOfRadagon = 26,
    GodskinNoble = 27,
    MagmaWyrmMakar = 28,
    GodfreyFirstEldenLord = 29,
    MohgTheOmen = 30,
    MimicTear = 31,
    LorettaKnightOfTheHaligtree = 32,
    AstelNaturalbornOfTheVoid = 33,
    LeonineMisbegotten = 34,
    RoyalKnightLoretta = 35,
    ElemerOfTheBriar = 36,
    AncestorSpirit = 37,
    CommanderNiall = 38,
    RoundtableHold = 39,
    GreatRune = 40,
    ErdtreeAflame = 41,
}

---@enum ESD.MissionFlag
ESD.MissionFlag = {
    Unlocked = 0,
    Complete = 1,
}

---@enum ESD.MissionAltType
ESD.MissionAltType = {
    Original = 0,
    Alt = 1,
}

---@param gestureId integer
function ESD.AcquireGesture(gestureId) end

function ESD.AddIzalithRankingPoints() end

---@param slot integer
---@param textId integer
---@param unk1 integer
function ESD.AddTalkListData(slot, textId, unk1) end

---@param slot integer
---@param textId integer
---@param unk1 integer
---@param sortId integer
---@param addIndicator boolean
function ESD.AddTalkListDataAlt(slot, textId, unk1, sortId, addIndicator) end

---@param areaEntityId integer
---@return boolean
function ESD.AreaExists(areaEntityId) end

---@param itemLotParamRow integer
function ESD.AwardItemLot(itemLotParamRow) end

---@param newBonfireLevelTotal integer
function ESD.BonfireActivation(newBonfireLevelTotal) end

---@return any
function ESD.BonfireRegistration0() end

---@return any
function ESD.BonfireRegistration1() end

---@return any
function ESD.BonfireRegistration2() end

---@return any
function ESD.BonfireRegistration3() end

---@return any
function ESD.BonfireRegistration4() end

---@param unk1 integer
function ESD.ChangeCamera(unk1) end

---@param stat ESD.PlayerStat
---@param operation ESD.ChangeType
---@param value integer
function ESD.ChangePlayerStat(stat, operation, value) end

function ESD.ChangeTeamType() end

---@param actionButtonParamRow integer
---@return boolean
function ESD.CheckActionButtonArea(actionButtonParamRow) end

---@return boolean
function ESD.CheckSelfDeath() end

---@param unk1 integer
---@return boolean
function ESD.CheckSpecificPersonGenericDialogIsOpen(unk1) end

---@param unk1 integer
---@param unk2 integer
---@return boolean
function ESD.CheckSpecificPersonMenuIsOpen(unk1, unk2) end

---@param unk1 integer
---@return boolean
function ESD.CheckSpecificPersonTalkHasEnded(unk1) end

function ESD.ClearPlayerDamageInfo() end

function ESD.ClearPreviousMenuSelection() end

function ESD.ClearQuantityValueOfChooseQuantityDialog() end

function ESD.ClearTalkActionState() end

function ESD.ClearTalkListData() end

function ESD.ClearTalkProgressData() end

function ESD.CloseShopMessage() end

---@param menuFlagId integer
---@param eventFlagId integer
function ESD.CombineMenuFlagAndEventFlag(menuFlagId, eventFlagId) end

---@param comparison ESD.CompareType
---@param level integer
---@return boolean
function ESD.CompareBonfireLevel(comparison, level) end

---@param unk1 integer
---@return boolean
function ESD.CompareBonfireState(unk1) end

---@return any
function ESD.CompareParentBonfire() end

---@param itemCategory ESD.ItemType
---@param itemId integer
---@param comparison ESD.CompareType
---@param value integer
---@param checkStorage boolean
---@return boolean
function ESD.ComparePlayerInventoryNumber(itemCategory, itemId, comparison, value, checkStorage) end

---@param stat ESD.PlayerStat
---@param comparison ESD.CompareType
---@param value integer
---@return boolean
function ESD.ComparePlayerStat(stat, comparison, value) end

---@param comparison ESD.CompareType
---@param value integer
---@return boolean
function ESD.CompareRNGValue(comparison, value) end

---@param unk1 integer
---@param unk2 integer
---@param unk3 integer
function ESD.CreateAssetfollowingSFX(unk1, unk2, unk3) end

---@param unk1 integer
---@param unk2 integer
function ESD.DeleteAssetfollowingSFX(unk1, unk2) end

---@param menu ESD.MenuType
---@return boolean
function ESD.DidYouDoSomethingInTheMenu(menu) end

---@param itemCategory ESD.ItemType
---@param itemId integer
---@return boolean
function ESD.DoesPlayerHaveItem(itemCategory, itemId) end

---@param itemCategory ESD.ItemType
---@param itemId integer
---@return boolean
function ESD.DoesPlayerHaveItemEquipped(itemCategory, itemId) end

---@param spEffectParamRow integer
---@return boolean
function ESD.DoesPlayerHaveSpEffect(spEffectParamRow) end

---@param spEffectParamRow integer
---@return boolean
function ESD.DoesSelfHaveSpEffect(spEffectParamRow) end

---@param unk1 integer
function ESD.EndBonfireKindleAnimLoop(unk1) end

---@param machineId integer
function ESD.EndMachine(machineId) end

function ESD.EnterBonfireEventRange() end

---@param newFlaskCount integer
---@param unk1 integer
function ESD.EstusAllocationUpdate(newFlaskCount, unk1) end

---@param resetWorld boolean
---@param resetMainCharacter boolean
---@param resetMagicCharges boolean
---@param restoreEstus boolean
---@param addHours integer
---@param addMinutes integer
---@param addSeconds integer
---@param blackScreenTime number
---@param clockStartupDelayS number
---@param clockMoveTimeS number
---@param clockFinishDelayS number
---@param fadeOutTime number
---@param fadeInTime number
function ESD.FadeOutAndPassTime(resetWorld, resetMainCharacter, resetMagicCharges, restoreEstus, addHours, addMinutes, addSeconds, blackScreenTime, clockStartupDelayS, clockMoveTimeS, clockFinishDelayS, fadeOutTime, fadeInTime) end

function ESD.ForceCloseGenericDialog() end

function ESD.ForceCloseMenu() end

---@param unk1 integer
function ESD.ForceEndTalk(unk1) end

---@return integer
function ESD.GetBuddyPlatoonEliminateTarget() end

---@return number
function ESD.GetBuddyStoneActivateRange() end

---@return integer
function ESD.GetBuddyStoneBuddyID() end

---@return integer
function ESD.GetBuddyStoneDopingSpEffect() end

---@return integer
function ESD.GetBuddyStoneEliminateTarget() end

---@return boolean
function ESD.GetBuddyStoneIsSpecial() end

---@return integer
function ESD.GetBuddyStoneOverwriteActivateRegion() end

---@param unk1 any
---@return integer
function ESD.GetBuddyStoneSpEffect(unk1) end

---@return integer
function ESD.GetBuddyStoneSummonedEventFlag() end

---@return integer
function ESD.GetCurrentStateElapsedFrames() end

---@return number
function ESD.GetCurrentStateElapsedTime() end

---@return number
function ESD.GetDistanceFromEnemy() end

---@return number
function ESD.GetDistanceToPlayer() end

---@return integer
function ESD.GetEntityID() end

---@param itemCategory ESD.ItemType
---@param itemId integer
---@return integer
function ESD.GetEquipmentSortID(itemCategory, itemId) end

---@param flaskToCheck ESD.EstusType
---@return integer
function ESD.GetEstusAllocation(flaskToCheck) end

---@param eventFlagId integer
---@return ESD.FlagState
function ESD.GetEventFlag(eventFlagId) end

---@param baseEventFlagId integer
---@param value integer
---@return integer
function ESD.GetEventFlagValue(baseEventFlagId, value) end

---@return ESD.DialogResult
function ESD.GetGenericDialogButtonResult() end

---@return boolean
function ESD.GetIsHost() end

---@return boolean
function ESD.GetIsOnline() end

---@return boolean
function ESD.GetIsRealMultiplayer() end

---@return integer
function ESD.GetMachineResult() end

---@return integer
function ESD.GetMorningHours() end

---@return integer
function ESD.GetMorningMinutes() end

---@return integer
function ESD.GetMorningSeconds() end

---@return integer
function ESD.GetNightHours() end

---@return integer
function ESD.GetNightMinutes() end

---@return integer
function ESD.GetNightSeconds() end

---@return integer
function ESD.GetNoonHours() end

---@return integer
function ESD.GetNoonMinutes() end

---@return integer
function ESD.GetNoonSeconds() end

---@return boolean
function ESD.GetOneLineHelpStatus() end

---@return number
function ESD.GetPlayerRemainingHP() end

---@param stat ESD.PlayerStat
---@return integer
function ESD.GetPlayerStat(stat) end

---@return number
function ESD.GetPlayerYDistance() end

---@return number
function ESD.GetRelativeAngleBetweenPlayerAndSelf() end

---@return number
function ESD.GetRelativeAngleBetweenSelfAndPlayer() end

---@param unk1 integer
---@return number
function ESD.GetRelativeAngleToPlayerWithAxis(unk1) end

---@return integer
function ESD.GetReveredSpiritAshLevel() end

---@return integer
function ESD.GetScadutreeLevel() end

---@return integer
function ESD.GetSelfHP() end

---@return any
function ESD.GetTalkInterruptReason() end

---@return integer
function ESD.GetTalkListEntryResult() end

---@return integer
function ESD.GetTotalBonfireLevel() end

---@return integer
function ESD.GetValueFromNumberSelectDialog() end

---@param characterEntityId integer
---@return boolean
function ESD.GetWhetherChrEventAnimHasEnded(characterEntityId) end

---@return boolean
function ESD.GetWhetherChrTurnAnimHasEnded() end

---@param unk1 any
---@return boolean
function ESD.GetWhetherEnemiesAreNearby(unk1) end

---@param unk1 integer
---@return integer
function ESD.GetWorkValue(unk1) end

---@param entityId integer
---@param spEffectId integer
function ESD.GiveSpEffectToEntity(entityId, spEffectId) end

---@param spEffectParamRow integer
function ESD.GiveSpEffectToPlayer(spEffectParamRow) end

---@param speffectId integer
function ESD.GiveSpEffectToSelf(speffectId) end

---@return boolean
function ESD.HasPlayerBeenAttacked() end

---@param unk1 number
function ESD.HideClock(unk1) end

---@return boolean
function ESD.IsAttackedBySomeone() end

---@return boolean
function ESD.IsCharacterDisabled() end

---@return boolean
function ESD.IsClientPlayer() end

---@return boolean
function ESD.IsEliminateTargetInBuddyArea() end

---@param inArea boolean
---@param targetEntityId integer
---@param areaEntityId integer
---@return boolean
function ESD.IsEntityInArea(inArea, targetEntityId, areaEntityId) end

---@param menu ESD.MenuType
---@return boolean
function ESD.IsMenuOpen(menu) end

---@return boolean
function ESD.IsMultiplayerInProgress() end

---@return boolean
function ESD.IsPlayerAttacking() end

---@return boolean
function ESD.IsPlayerDead() end

---@param startingHours integer
---@param startingMinutes integer
---@param startingSeconds integer
---@param endingHours integer
---@param endingMinutes integer
---@param endingSeconds integer
---@return boolean
function ESD.IsTimeOfDayInRange(startingHours, startingMinutes, startingSeconds, endingHours, endingMinutes, endingSeconds) end

---@return boolean
function ESD.IsTimePassFadeOutInProgress() end

---@param machineId integer
---@return boolean
function ESD.MachineExists(machineId) end

function ESD.OfferHumanity() end

---@param unk1 any
---@param unk2 any
---@param unk3 any
---@param unk4 any
function ESD.OpenArenaMenu(unk1, unk2, unk3, unk4) end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenAshOfWarShop(startShopLineupParamRow, endShopLineupParamRow) end

function ESD.OpenBuddyUpgradeMenu() end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenChampionsEquipmentShop(startShopLineupParamRow, endShopLineupParamRow) end

---@param unk1 integer
function ESD.OpenCharaMakeMenu(unk1) end

---@param goodsId integer
---@param textId integer
function ESD.OpenChooseQuantityDialog(goodsId, textId) end

---@param unk1 integer
function ESD.OpenConversationChoicesMenu(unk1) end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenDragonCommunionShop(startShopLineupParamRow, endShopLineupParamRow) end

---@param unk1 boolean
---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenDupeShop(unk1, startShopLineupParamRow, endShopLineupParamRow) end

---@param type ESD.EnhanceType
function ESD.OpenEnhanceShop(type) end

function ESD.OpenEquipmentChangeOfPurposeShop() end

function ESD.OpenEstusAllotMenu() end

---@param boxType ESD.DialogBoxType
---@param textId integer
---@param defaultResult ESD.DialogResult
---@param boxStyle ESD.DialogBoxStyle
---@param unk1 integer
function ESD.OpenGenericDialog(boxType, textId, defaultResult, boxStyle, unk1) end

function ESD.OpenGreatRuneEquipMenu() end

---@param startId integer
---@param endId integer
function ESD.OpenMagicEquip(startId, endId) end

function ESD.OpenPhysickMenu() end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenPuppetShop(startShopLineupParamRow, endShopLineupParamRow) end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenRegularShop(startShopLineupParamRow, endShopLineupParamRow) end

function ESD.OpenRepository() end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenSellShop(startShopLineupParamRow, endShopLineupParamRow) end

function ESD.OpenSoul() end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenTailoringShop(startShopLineupParamRow, endShopLineupParamRow) end

---@param startShopLineupParamRow integer
---@param endShopLineupParamRow integer
function ESD.OpenTranspositionShop(startShopLineupParamRow, endShopLineupParamRow) end

---@return boolean
function ESD.PlayerDiedFromFallDamage() end

---@return boolean
function ESD.PlayerDiedFromFallInstantly() end

---@param itemCategory ESD.ItemType
---@param itemId integer
---@param quantityChange integer
function ESD.PlayerEquipmentQuantityChange(itemCategory, itemId, quantityChange) end

---@param unk1 integer
---@return boolean
function ESD.PlayerHasTool(unk1) end

function ESD.ReallocateAttributes() end

---@param unk1 integer
function ESD.RecordPlayLog(unk1) end

---@param unk1 integer
---@return any
function ESD.RelativeAngleBetweenTwoPlayersWithAxis(unk1) end

---@param unk1 any
---@param unk2 number
function ESD.RemoveDynamicCharacter(unk1, unk2) end

function ESD.RemoveMyAggro() end

---@param itemIdToReplace integer
---@param newItemId integer
---@param newItemQuantity integer
function ESD.ReplaceTool(itemIdToReplace, newItemId, newItemQuantity) end

function ESD.ReportConversationEndToHavokBehavior() end

---@param unk1 integer
---@param unk2 integer
function ESD.RequestAnimation(unk1, unk2) end

---@param unk1 integer
function ESD.RequestSave(unk1) end

---@param achievement ESD.Trophy
function ESD.RequestUnlockTrophy(achievement) end

---@param machineId integer
function ESD.RunMachine(machineId) end

---@param unk1 integer
---@param unk2 integer
---@param unk3 any
function ESD.SetBuddyEliminateTarget(unk1, unk2, unk3) end

function ESD.SetBuddySpawnPoint() end

---@param canOpen boolean
function ESD.SetCanOpenMap(canOpen) end

---@param unk1 integer
---@param unk2 integer
---@param unk3 integer
---@param unk4 integer
---@param hours integer
---@param minutes integer
---@param seconds integer
---@param unk5 number
---@param unk6 number
---@param unk7 integer
---@param unk8 integer
---@param unk9 number
---@param unk10 number
function ESD.SetCurrentTime(unk1, unk2, unk3, unk4, hours, minutes, seconds, unk5, unk6, unk7, unk8, unk9, unk10) end

function ESD.SetDefaultTeamType() end

---@param eventFlagId integer
---@param newFlagState ESD.FlagState
function ESD.SetEventFlag(eventFlagId, newFlagState) end

---@param eventFlagId_A integer
---@param eventFlagId_B integer
function ESD.SetEventFlagRange(eventFlagId_A, eventFlagId_B) end

---@param baseEventFlagId integer
---@param numberOfUsedFlagBits integer
---@param newValue integer
function ESD.SetEventFlagValue(baseEventFlagId, numberOfUsedFlagBits, newValue) end

---@param unk1 integer
---@param entityId integer
function ESD.SetLookAtEntityForTalk(unk1, entityId) end

---@param unk1 integer
---@param cost integer
function ESD.SetMessageTagValue(unk1, cost) end

function ESD.SetRNGSeed() end

---@param level integer
function ESD.SetReveredSpiritAshLevel(level) end

---@param level integer
function ESD.SetScadutreeLevel(level) end

---@param time number
function ESD.SetTalkTime(time) end

---@param distance number
function ESD.SetUpdateDistance(distance) end

---@param workValueIndex integer
---@param valueToStore integer
function ESD.SetWorkValue(workValueIndex, valueToStore) end

---@param unk1 integer
function ESD.ShowClock(unk1) end

---@param optionsType ESD.TalkOptionsType
function ESD.ShowShopMessage(optionsType) end

---@param optionsType ESD.TalkOptionsType
---@param useSortId boolean
function ESD.ShowShopMessageAlt(optionsType, useSortId) end

---@param maxValue integer
function ESD.ShuffleRNGSeed(maxValue) end

---@param unk1 integer
---@param unk2 integer
---@param unk3 integer
---@param unk4 integer
---@param unk5 any
---@param unk6 any
---@param unk7 any
---@param unk8 any
function ESD.SpawnDynamicCharacter(unk1, unk2, unk3, unk4, unk5, unk6, unk7, unk8) end

---@param resetWorld boolean
---@param resetMainCharacter boolean
---@param resetMagicCharges boolean
---@param restoreEstus boolean
---@param animationIdOffset integer
---@param worldResetDelayS number
function ESD.StartBonfireAnimLoop(resetWorld, resetMainCharacter, resetMagicCharges, restoreEstus, animationIdOffset, worldResetDelayS) end

---@param bonfireWarpId integer
function ESD.StartWarpMenuInit(bonfireWarpId) end

---@param unk1 integer
function ESD.StopEventAnimWithoutForcingConversationEnd(unk1) end

---@param talkParamRow integer
---@param unk1 integer
---@param unk2 integer
---@param eventFlagId integer
function ESD.TalkToPlayer(talkParamRow, unk1, unk2, eventFlagId) end

---@param animationId integer
---@param characterEntityId integer
---@param unk1 integer
---@param unk2 integer
function ESD.TurnCharacterToFaceEntity(animationId, characterEntityId, unk1, unk2) end

function ESD.TurnToFacePlayer() end

function ESD.UpdatePlayerRespawnPoint() end

