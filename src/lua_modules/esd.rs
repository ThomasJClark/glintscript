use std::iter;

use eldenring::{
    cs::{BlockId, FieldInsHandle, FieldInsSelector, TalkScript, WorldChrMan},
    ez_state::{EzStateEvent, EzStateValue},
};
use fromsoftware_shared::FromStatic;
use mlua::prelude::*;

use crate::lua_modules::glintscript_error::GlintScriptError;

struct ESDLuaContext {
    talk_script: TalkScript,
}

impl ESDLuaContext {
    // Talk scripts have to have a character - use the main player until character scoped
    // scripts are implemented.
    fn set_chr(&mut self) -> LuaResult<()> {
        let world_chr_man = unsafe { WorldChrMan::instance() }.map_err(|_| {
            LuaError::external(GlintScriptError(
                "Can't use ESD functions while world isn't loaded".to_string(),
            ))
        })?;

        let main_player = world_chr_man.main_player.as_ref().ok_or_else(|| {
            LuaError::external(GlintScriptError(
                "Can't use ESD functions while world isn't loaded".to_string(),
            ))
        })?;

        self.talk_script.npc_talk.base.field_ins_handle = main_player.chr_ins.field_ins_handle;

        Ok(())
    }
}

unsafe impl Send for ESDLuaContext {}

fn esd_value_from_lua(value: &LuaValue) -> LuaResult<EzStateValue> {
    Ok(match value {
        LuaValue::Number(value) => EzStateValue::Float32(*value as f32),
        LuaValue::Integer(value) => EzStateValue::Int32(*value as i32),
        LuaValue::Boolean(true) => EzStateValue::Int32(1),
        LuaValue::Boolean(false) => EzStateValue::Int32(0),
        LuaValue::Nil => EzStateValue::Int32(0),
        other => {
            return Err(LuaError::FromLuaConversionError {
                from: other.type_name(),
                to: "EzStateValue".to_string(),
                message: None,
            });
        }
    })
}

// Create a Lua wrapper function for invoking an ESD event with the given ID and argument count
fn event_function(lua: &Lua, event_id: i32, arg_count: usize) -> LuaResult<LuaFunction> {
    assert!(arg_count < EzStateEvent::default().args.capacity());

    lua.create_function(move |lua: &Lua, values: LuaMultiValue| {
        let args: Vec<_> = iter::once(Ok(EzStateValue::Int32(event_id)))
            .chain(values.iter().take(arg_count).map(esd_value_from_lua))
            .collect::<LuaResult<_>>()?;

        let mut context = lua.app_data_mut::<ESDLuaContext>().unwrap();

        context.set_chr()?;

        context
            .talk_script
            .event(args)
            .map_err(LuaError::external)?;

        Ok(())
    })
}

// Create a Lua wrapper function for invoking an ESD env with the given ID and argument count
fn env_function(
    lua: &Lua,
    env_id: i32,
    arg_count: usize,
    is_bool_result: bool,
) -> LuaResult<LuaFunction> {
    assert!(arg_count < 8);

    lua.create_function(
        move |lua: &Lua, values: LuaMultiValue| -> LuaResult<LuaValue> {
            let args: Vec<_> = iter::once(Ok(EzStateValue::Int32(env_id)))
                .chain(values.iter().take(arg_count).map(esd_value_from_lua))
                .collect::<LuaResult<_>>()?;

            let mut context = lua.app_data_mut::<ESDLuaContext>().unwrap();

            context.set_chr()?;

            let result = context.talk_script.env(args).map_err(LuaError::external)?;
            match result {
                EzStateValue::Float32(value) => Ok(if is_bool_result {
                    LuaValue::Boolean(value != 0f32)
                } else {
                    LuaValue::Number(value as f64)
                }),
                EzStateValue::Int32(value) => Ok(if is_bool_result {
                    LuaValue::Boolean(value != 0i32)
                } else {
                    LuaValue::Integer(value as i64)
                }),
                EzStateValue::Unk64(_) => Err(LuaError::ToLuaConversionError {
                    from: "EzStateValue".to_string(),
                    to: "other",
                    message: None,
                }),
            }
        },
    )
}

/**
 * The `ESD` module. Allows calling ESD operations from Lua.
 *
 * Instructions and enums are based on the documentation reverse engineered for ESDLang by
 * thefifthmatt:
 * https://github.com/thefifthmatt/ESDLang/blob/9fa7fa90849a662b36839f077e321a02f9e992f4/dist/ESDScriptingDocumentation_Talk.json
 */
pub(crate) fn register(lua: &Lua) -> LuaResult<()> {
    let esd = lua.create_table()?;

    lua.set_app_data(ESDLuaContext {
        talk_script: TalkScript::new(
            BlockId::none(),
            1000,
            FieldInsHandle {
                selector: FieldInsSelector(0),
                block_id: BlockId::none(),
            },
        ),
    });

    esd.set("AcquireGesture", event_function(lua, 131, 1)?)?;
    esd.set("AddIzalithRankingPoints", event_function(lua, 64, 0)?)?;
    esd.set("AddTalkListData", event_function(lua, 19, 3)?)?;
    esd.set("AddTalkListDataAlt", event_function(lua, 149, 5)?)?;
    esd.set("AreaExists", env_function(lua, 217, 1, true)?)?;
    esd.set("AwardItemLot", event_function(lua, 104, 1)?)?;
    esd.set("BonfireActivation", event_function(lua, 109, 1)?)?;
    esd.set("BonfireRegistration0", env_function(lua, 40, 0, false)?)?;
    esd.set("BonfireRegistration1", env_function(lua, 41, 0, false)?)?;
    esd.set("BonfireRegistration2", env_function(lua, 42, 0, false)?)?;
    esd.set("BonfireRegistration3", env_function(lua, 43, 0, false)?)?;
    esd.set("BonfireRegistration4", env_function(lua, 44, 0, false)?)?;
    esd.set("ChangeCamera", event_function(lua, 138, 1)?)?;
    esd.set("ChangePlayerStat", event_function(lua, 47, 3)?)?;
    esd.set("ChangeTeamType", event_function(lua, 15, 0)?)?;
    esd.set("CheckActionButtonArea", env_function(lua, 56, 1, true)?)?;
    esd.set("CheckSelfDeath", env_function(lua, 3, 0, true)?)?;
    esd.set(
        "CheckSpecificPersonGenericDialogIsOpen",
        env_function(lua, 58, 1, true)?,
    )?;
    esd.set(
        "CheckSpecificPersonMenuIsOpen",
        env_function(lua, 59, 2, true)?,
    )?;
    esd.set(
        "CheckSpecificPersonTalkHasEnded",
        env_function(lua, 57, 1, true)?,
    )?;
    esd.set("ClearPlayerDamageInfo", event_function(lua, 39, 0)?)?;
    esd.set("ClearPreviousMenuSelection", event_function(lua, 110, 0)?)?;
    esd.set(
        "ClearQuantityValueOfChooseQuantityDialog",
        event_function(lua, 83, 0)?,
    )?;
    esd.set("ClearTalkActionState", event_function(lua, 35, 0)?)?;
    esd.set("ClearTalkListData", event_function(lua, 20, 0)?)?;
    esd.set("ClearTalkProgressData", event_function(lua, 9, 0)?)?;
    esd.set("CloseShopMessage", event_function(lua, 12, 0)?)?;
    esd.set("CombineMenuFlagAndEventFlag", event_function(lua, 49, 2)?)?;
    esd.set("CompareBonfireLevel", env_function(lua, 38, 2, true)?)?;
    esd.set("CompareBonfireState", env_function(lua, 37, 1, true)?)?;
    esd.set("CompareParentBonfire", env_function(lua, 39, 0, false)?)?;
    esd.set(
        "ComparePlayerInventoryNumber",
        env_function(lua, 47, 5, true)?,
    )?;
    esd.set("ComparePlayerStat", env_function(lua, 45, 3, true)?)?;
    esd.set("CompareRNGValue", env_function(lua, 50, 2, true)?)?;
    esd.set("CreateAssetfollowingSFX", event_function(lua, 126, 3)?)?;
    esd.set("DeleteAssetfollowingSFX", event_function(lua, 127, 2)?)?;
    esd.set(
        "DidYouDoSomethingInTheMenu",
        env_function(lua, 28, 1, true)?,
    )?;
    esd.set("DoesPlayerHaveItem", env_function(lua, 16, 2, true)?)?;
    esd.set(
        "DoesPlayerHaveItemEquipped",
        env_function(lua, 17, 2, true)?,
    )?;
    esd.set("DoesPlayerHaveSpEffect", env_function(lua, 61, 1, true)?)?;
    esd.set("DoesSelfHaveSpEffect", env_function(lua, 60, 1, true)?)?;
    esd.set("EndBonfireKindleAnimLoop", event_function(lua, 43, 1)?)?;
    esd.set("EndMachine", event_function(lua, 120, 1)?)?;
    esd.set("EnterBonfireEventRange", event_function(lua, 54, 0)?)?;
    esd.set("EstusAllocationUpdate", event_function(lua, 108, 2)?)?;
    esd.set("FadeOutAndPassTime", event_function(lua, 117, 13)?)?;
    esd.set("ForceCloseGenericDialog", event_function(lua, 18, 0)?)?;
    esd.set("ForceCloseMenu", event_function(lua, 67, 0)?)?;
    esd.set("ForceEndTalk", event_function(lua, 8, 1)?)?;
    esd.set(
        "GetBuddyPlatoonEliminateTarget",
        env_function(lua, 210, 0, false)?,
    )?;
    esd.set(
        "GetBuddyStoneActivateRange",
        env_function(lua, 216, 0, false)?,
    )?;
    esd.set("GetBuddyStoneBuddyID", env_function(lua, 208, 0, false)?)?;
    esd.set(
        "GetBuddyStoneDopingSpEffect",
        env_function(lua, 212, 0, false)?,
    )?;
    esd.set(
        "GetBuddyStoneEliminateTarget",
        env_function(lua, 207, 0, false)?,
    )?;
    esd.set("GetBuddyStoneIsSpecial", env_function(lua, 205, 0, true)?)?;
    esd.set(
        "GetBuddyStoneOverwriteActivateRegion",
        env_function(lua, 215, 0, false)?,
    )?;
    esd.set("GetBuddyStoneSpEffect", env_function(lua, 209, 1, false)?)?;
    esd.set(
        "GetBuddyStoneSummonedEventFlag",
        env_function(lua, 206, 0, false)?,
    )?;
    esd.set(
        "GetCurrentStateElapsedFrames",
        env_function(lua, 102, 0, false)?,
    )?;
    esd.set(
        "GetCurrentStateElapsedTime",
        env_function(lua, 103, 0, false)?,
    )?;
    esd.set("GetDistanceFromEnemy", env_function(lua, 7, 0, false)?)?;
    esd.set("GetDistanceToPlayer", env_function(lua, 1, 0, false)?)?;
    esd.set("GetEntityID", env_function(lua, 211, 0, false)?)?;
    esd.set("GetEquipmentSortID", env_function(lua, 236, 2, false)?)?;
    esd.set("GetEstusAllocation", env_function(lua, 109, 1, false)?)?;
    esd.set("GetEventFlag", env_function(lua, 15, 1, false)?)?;
    esd.set("GetEventFlagValue", env_function(lua, 101, 2, false)?)?;
    esd.set(
        "GetGenericDialogButtonResult",
        env_function(lua, 22, 0, false)?,
    )?;
    esd.set("GetIsHost", env_function(lua, 213, 0, true)?)?;
    esd.set("GetIsOnline", env_function(lua, 111, 0, true)?)?;
    esd.set("GetIsRealMultiplayer", env_function(lua, 234, 0, true)?)?;
    esd.set("GetMachineResult", env_function(lua, 202, 0, false)?)?;
    esd.set("GetMorningHours", env_function(lua, 219, 0, false)?)?;
    esd.set("GetMorningMinutes", env_function(lua, 220, 0, false)?)?;
    esd.set("GetMorningSeconds", env_function(lua, 221, 0, false)?)?;
    esd.set("GetNightHours", env_function(lua, 225, 0, false)?)?;
    esd.set("GetNightMinutes", env_function(lua, 226, 0, false)?)?;
    esd.set("GetNightSeconds", env_function(lua, 227, 0, false)?)?;
    esd.set("GetNoonHours", env_function(lua, 222, 0, false)?)?;
    esd.set("GetNoonMinutes", env_function(lua, 223, 0, false)?)?;
    esd.set("GetNoonSeconds", env_function(lua, 224, 0, false)?)?;
    esd.set("GetOneLineHelpStatus", env_function(lua, 14, 0, true)?)?;
    esd.set("GetPlayerRemainingHP", env_function(lua, 55, 0, false)?)?;
    esd.set("GetPlayerStat", env_function(lua, 104, 1, false)?)?;
    esd.set("GetPlayerYDistance", env_function(lua, 34, 0, false)?)?;
    esd.set(
        "GetRelativeAngleBetweenPlayerAndSelf",
        env_function(lua, 8, 0, false)?,
    )?;
    esd.set(
        "GetRelativeAngleBetweenSelfAndPlayer",
        env_function(lua, 10, 0, false)?,
    )?;
    esd.set(
        "GetRelativeAngleToPlayerWithAxis",
        env_function(lua, 231, 1, false)?,
    )?;
    esd.set(
        "GetReveredSpiritAshLevel",
        env_function(lua, 238, 0, false)?,
    )?;
    esd.set("GetScadutreeLevel", env_function(lua, 237, 0, false)?)?;
    esd.set("GetSelfHP", env_function(lua, 6, 0, false)?)?;
    esd.set("GetTalkInterruptReason", env_function(lua, 12, 0, false)?)?;
    esd.set("GetTalkListEntryResult", env_function(lua, 23, 0, false)?)?;
    esd.set("GetTotalBonfireLevel", env_function(lua, 110, 0, false)?)?;
    esd.set(
        "GetValueFromNumberSelectDialog",
        env_function(lua, 62, 0, false)?,
    )?;
    esd.set(
        "GetWhetherChrEventAnimHasEnded",
        env_function(lua, 107, 1, true)?,
    )?;
    esd.set(
        "GetWhetherChrTurnAnimHasEnded",
        env_function(lua, 106, 0, true)?,
    )?;
    esd.set("GetWhetherEnemiesAreNearby", env_function(lua, 0, 1, true)?)?;
    esd.set("GetWorkValue", env_function(lua, 100, 1, false)?)?;
    esd.set("GiveSpEffectToEntity", event_function(lua, 124, 2)?)?;
    esd.set("GiveSpEffectToPlayer", event_function(lua, 62, 1)?)?;
    esd.set("GiveSpEffectToSelf", event_function(lua, 121, 1)?)?;
    esd.set("HasPlayerBeenAttacked", env_function(lua, 33, 0, true)?)?;
    esd.set("HideClock", event_function(lua, 133, 1)?)?;
    esd.set("IsAttackedBySomeone", env_function(lua, 5, 0, true)?)?;
    esd.set("IsCharacterDisabled", env_function(lua, 26, 0, true)?)?;
    esd.set("IsClientPlayer", env_function(lua, 19, 0, true)?)?;
    esd.set(
        "IsEliminateTargetInBuddyArea",
        env_function(lua, 214, 0, true)?,
    )?;
    esd.set("IsEntityInArea", env_function(lua, 218, 3, true)?)?;
    esd.set("IsMenuOpen", env_function(lua, 25, 1, true)?)?;
    esd.set("IsMultiplayerInProgress", env_function(lua, 52, 0, true)?)?;
    esd.set("IsPlayerAttacking", env_function(lua, 9, 0, true)?)?;
    esd.set("IsPlayerDead", env_function(lua, 27, 0, true)?)?;
    esd.set("IsTimeOfDayInRange", env_function(lua, 200, 6, true)?)?;
    esd.set(
        "IsTimePassFadeOutInProgress",
        env_function(lua, 233, 0, true)?,
    )?;
    esd.set("MachineExists", env_function(lua, 203, 1, true)?)?;
    esd.set("OfferHumanity", event_function(lua, 40, 0)?)?;
    esd.set("OpenArenaMenu", event_function(lua, 151, 4)?)?;
    esd.set("OpenAshOfWarShop", event_function(lua, 143, 2)?)?;
    esd.set("OpenBuddyUpgradeMenu", event_function(lua, 136, 0)?)?;
    esd.set("OpenChampionsEquipmentShop", event_function(lua, 148, 2)?)?;
    esd.set("OpenCharaMakeMenu", event_function(lua, 81, 1)?)?;
    esd.set("OpenChooseQuantityDialog", event_function(lua, 82, 2)?)?;
    esd.set("OpenConversationChoicesMenu", event_function(lua, 76, 1)?)?;
    esd.set("OpenDragonCommunionShop", event_function(lua, 135, 2)?)?;
    esd.set("OpenDupeShop", event_function(lua, 146, 3)?)?;
    esd.set("OpenEnhanceShop", event_function(lua, 24, 1)?)?;
    esd.set(
        "OpenEquipmentChangeOfPurposeShop",
        event_function(lua, 48, 0)?,
    )?;
    esd.set("OpenEstusAllotMenu", event_function(lua, 105, 0)?)?;
    esd.set("OpenGenericDialog", event_function(lua, 17, 5)?)?;
    esd.set("OpenGreatRuneEquipMenu", event_function(lua, 137, 0)?)?;
    esd.set("OpenMagicEquip", event_function(lua, 28, 2)?)?;
    esd.set("OpenPhysickMenu", event_function(lua, 130, 0)?)?;
    esd.set("OpenPuppetShop", event_function(lua, 144, 2)?)?;
    esd.set("OpenRegularShop", event_function(lua, 22, 2)?)?;
    esd.set("OpenRepository", event_function(lua, 30, 0)?)?;
    esd.set("OpenSellShop", event_function(lua, 46, 2)?)?;
    esd.set("OpenSoul", event_function(lua, 31, 0)?)?;
    esd.set("OpenTailoringShop", event_function(lua, 142, 2)?)?;
    esd.set("OpenTranspositionShop", event_function(lua, 111, 2)?)?;
    esd.set("PlayerDiedFromFallDamage", env_function(lua, 229, 0, true)?)?;
    esd.set(
        "PlayerDiedFromFallInstantly",
        env_function(lua, 228, 0, true)?,
    )?;
    esd.set("PlayerEquipmentQuantityChange", event_function(lua, 52, 3)?)?;
    esd.set("PlayerHasTool", env_function(lua, 230, 1, true)?)?;
    esd.set("ReallocateAttributes", event_function(lua, 113, 0)?)?;
    esd.set("RecordPlayLog", event_function(lua, 141, 1)?)?;
    esd.set(
        "RelativeAngleBetweenTwoPlayersWithAxis",
        env_function(lua, 46, 1, false)?,
    )?;
    esd.set("RemoveDynamicCharacter", event_function(lua, 129, 2)?)?;
    esd.set("RemoveMyAggro", event_function(lua, 5, 0)?)?;
    esd.set("ReplaceTool", event_function(lua, 59, 3)?)?;
    esd.set(
        "ReportConversationEndToHavokBehavior",
        event_function(lua, 71, 0)?,
    )?;
    esd.set("RequestAnimation", event_function(lua, 123, 2)?)?;
    esd.set("RequestSave", event_function(lua, 50, 1)?)?;
    esd.set("RequestUnlockTrophy", event_function(lua, 53, 1)?)?;
    esd.set("RunMachine", event_function(lua, 119, 1)?)?;
    esd.set("SetBuddyEliminateTarget", event_function(lua, 125, 3)?)?;
    esd.set("SetBuddySpawnPoint", event_function(lua, 122, 0)?)?;
    esd.set("SetCanOpenMap", event_function(lua, 140, 1)?)?;
    esd.set("SetCurrentTime", event_function(lua, 134, 13)?)?;
    esd.set("SetDefaultTeamType", event_function(lua, 16, 0)?)?;
    esd.set("SetEventFlag", event_function(lua, 11, 2)?)?;
    esd.set("SetEventFlagRange", event_function(lua, 33, 2)?)?;
    esd.set("SetEventFlagValue", event_function(lua, 147, 3)?)?;
    esd.set("SetLookAtEntityForTalk", event_function(lua, 139, 2)?)?;
    esd.set("SetMessageTagValue", event_function(lua, 102, 2)?)?;
    esd.set("SetRNGSeed", event_function(lua, 58, 0)?)?;
    esd.set("SetReveredSpiritAshLevel", event_function(lua, 153, 1)?)?;
    esd.set("SetScadutreeLevel", event_function(lua, 152, 1)?)?;
    esd.set("SetTalkTime", event_function(lua, 68, 1)?)?;
    esd.set("SetUpdateDistance", event_function(lua, 38, 1)?)?;
    esd.set("SetWorkValue", event_function(lua, 100, 2)?)?;
    esd.set("ShowClock", event_function(lua, 132, 1)?)?;
    esd.set("ShowShopMessage", event_function(lua, 10, 1)?)?;
    esd.set("ShowShopMessageAlt", event_function(lua, 150, 2)?)?;
    esd.set("ShuffleRNGSeed", event_function(lua, 57, 1)?)?;
    esd.set("SpawnDynamicCharacter", event_function(lua, 128, 8)?)?;
    esd.set("StartBonfireAnimLoop", event_function(lua, 42, 6)?)?;
    esd.set("StartWarpMenuInit", event_function(lua, 41, 1)?)?;
    esd.set(
        "StopEventAnimWithoutForcingConversationEnd",
        event_function(lua, 80, 1)?,
    )?;
    esd.set("TalkToPlayer", event_function(lua, 1, 4)?)?;
    esd.set("TurnCharacterToFaceEntity", event_function(lua, 103, 4)?)?;
    esd.set("TurnToFacePlayer", event_function(lua, 7, 0)?)?;
    esd.set("UpdatePlayerRespawnPoint", event_function(lua, 101, 0)?)?;

    lua.globals().set("ESD", esd)
}
