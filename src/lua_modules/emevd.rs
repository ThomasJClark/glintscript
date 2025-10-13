/**
 * The `glint.emevd` module. Allows calling EMEVD operations from Lua.
 *
 * Instructions and enums are based on the EMEDF documentation reverse engineered for DarkScript3
 * by AinTunez and thefifthmatt:
 * https://github.com/AinTunez/DarkScript3/blob/d243ce692bf42b92bace74d2873e1970fb4d0f94/DarkScript3/Resources/er-common.emedf.json
 */
use crate::{lua_emevd_commands, lua_emevd_conditions, lua_emevd_enable_disable_commands};
use anyhow::Result;
use mlua::prelude::*;

lua_emevd_commands! {
    fn register_emevd_commands(lua: &Lua, table: &LuaTable) -> LuaResult<()>;

    // System
    struct SaveRequest(2000, 5) {
        dummy: u8,
    }
    struct StartPS5Activity(2000, 7) {
        activity_id: i32,
    }
    struct EndPS5Activity(2000, 8) {
        activity_id: i32,
    }

    // Timer
    struct SetCurrentTime(2001, 4) {
        hours: u8,
        minutes: u8,
        seconds: u8,
        fade_transition: bool,
        should_wait_for_completion: bool,
        show_clock: bool,
        clock_startup_delay_s: f32,
        clock_move_time_s: f32,
        clock_finish_delay_s: f32,
    }
    struct FreezeTime(2001, 5) {
        should_freeze: bool,
    }

    // Cutscene
    struct PlayCutsceneToAll(2002, 1) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
    }
    struct PlayCutsceneToPlayer(2002, 3) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
        player_entity_id: u32,
    }
    struct PlayCutsceneToPlayerWithWeatherAndTime(2002, 10) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
        player_entity_id: u32,
        should_change_weather: bool,
        weather: i8, // Weather
        weather_lifespan_seconds: f32,
        should_change_time: bool,
        hours: u8,
        minutes: u8,
        seconds: u8,
    }
    struct PlayCutsceneToPlayerAndWarp(2002, 11) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
        area_entity_id: u32,
        map_id: i32,
        player_entity_id: u32,
        unknown14: i32,
        unknown18: bool,
    }
    struct PlayCutsceneToPlayerAndWarpWithWeatherAndTime(2002, 12) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
        area_entity_id: u32,
        map_id: i32,
        player_entity_id: u32,
        unknown14: i32,
        unknown18: bool,
        should_change_weather: bool,
        weather: i8, // Weather
        weather_lifespan_seconds: f32,
        should_change_time: bool,
        hours: u8,
        minutes: u8,
        seconds: u8,
    }
    struct PlayCutsceneToPlayerAndWarpWithStablePositionUpdate(2002, 13) {
        cutscene_id: i32,
        playback_method: u32, // Cutscene Play Mode
        area_entity_id: u32,
        map_id: i32,
        player_entity_id: u32,
        unknown14: i32,
        unknown18: bool,
        should_update_stable_position: bool,
    }

    // Event
    struct AwardItemLot(2003, 4) {
        item_lot_id: i32,
    }
    struct ShootBullet(2003, 5) {
        bullet_team_entity_id: u32,
        bullet_producer_entity_id: u32,
        dummypoly_id: i32,
        behavior_id: i32,
        firing_angle_x: i32,
        firing_angle_y: i32,
        firing_angle_z: i32,
    }
    struct InvertEventFlag(2003, 9) {
        event_flag_id: u32,
    }
    struct DisplayBossHealthBar(2003, 11) {
        disabled_enabled: i8, // Disabled/Enabled
        entity_id: u32,
        slot_number: i16,
        name_id: i32,
    }
    struct HandleBossDefeatAndDisplayBanner(2003, 12) {
        entity_id: u32,
        banner_type: u8, // Text Banner Type
    }
    struct ModifyNavimeshConnectionBitflag(2003, 13) {
        navimesh_entity_id: u32,
        navimesh_type: u32, // Navimesh Type
        type_bit_operation: u8, // Bitop Type
    }
    struct WarpPlayer(2003, 14) {
        area_id: u8,
        block_id: u8,
        region_id: u8,
        index_id: u8,
        initial_area_entity_id: u32,
        subarea_name_popup_message_id: i32,
    }
    struct HandleMinibossDefeat(2003, 15) {
        entity_id: u32,
    }
    struct TriggerMultiplayerEvent(2003, 16) {
        multiplayer_event_id: u32,
    }
    struct RandomlySetEventFlagInRange(2003, 17) {
        event_flag_id_min: u32,
        event_flag_id_max: u32,
        flag_state: u8, // ON/OFF
    }
    struct ForceAnimationPlayback(2003, 18) {
        entity_id: u32,
        animation_id: i32,
        should_loop: bool,
        should_wait_for_completion: bool,
        ignore_wait_for_transition: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct IncrementGameCycle(2003, 21) {
        dummy: u8,
    }
    struct BatchSetEventFlags(2003, 22) {
        event_flag_id_start: u32,
        event_flag_id_end: u32,
        flag_state: u8, // ON/OFF
    }
    struct SetPlayerRespawnPoint(2003, 23) {
        respawn_area_entity_id: u32,
    }
    struct RemoveItemFromPlayer(2003, 24) {
        item_type: u8, // Item Type
        item_id: i32,
        number: i32,
    }
    struct PlaceNPCSummonSign(2003, 25) {
        sign_type: i32, // Summon Sign Type
        summoned_npc_entity_id: u32,
        spawn_area_entity_id: u32,
        summon_event_flag_id: u32,
        dismissal_event_flag_id: u32,
        unknown: bool,
    }
    struct AwardAchievement(2003, 28) {
        achievement_id: i32,
    }
    struct IncrementEventValue(2003, 31) {
        base_event_flag_id: u32,
        number_of_used_flag_bits: u32,
        maximum_allowed_value: u32,
    }
    struct ClearEventValue(2003, 32) {
        base_event_flag_id: u32,
        number_of_used_flag_bits: u32,
    }
    struct SetSnugglyNextTrade(2003, 33) {
        event_flag_id: u32,
    }
    struct SpawnSnugglyItem(2003, 34) {
        item_lot_id: i32,
        placement_area_entity_id: u32,
        event_flag_id: u32,
        hit_entity_id: u32,
    }
    struct MoveBloodstainAndDroppedItems(2003, 35) {
        source_area_entity_id: u32,
        destination_area_entity_id: u32,
    }
    struct AwardItemsIncludingClients(2003, 36) {
        item_lot_id: i32,
    }
    struct EventValueOperation(2003, 41) {
        base_event_flag_id: u32,
        number_of_used_flag_bits: u32,
        operand: i32,
        base_event_flag_id_operand: u32,
        number_of_used_event_flag_bits_operand: u32,
        calculation_type: i8, // Calculation Type
    }
    struct StoreItemAmountHeldInEventValue(2003, 42) {
        item_type: u8, // Item Type
        item_id: i32,
        base_event_flag_id: u32,
        number_of_used_flag_bits: u32,
    }
    struct DirectlyGivePlayerItem(2003, 43) {
        item_type: u8, // Item Type
        item_id: i32,
        base_event_flag_id: u32,
        number_of_used_flag_bits: u32,
    }
    struct TriggerAISound(2003, 52) {
        ai_sound_param_id: i32,
        entity_id: u32,
        origin_entity_type: u8, // Target Entity Type
    }
    struct InvokeEnemyGenerator(2003, 54) {
        generator_entity_id: u32,
    }
    struct BatchSetNetworkConnectedEventFlags(2003, 63) {
        event_flag_id_start: u32,
        event_flag_id_end: u32,
        flag_state: u8, // ON/OFF
    }
    struct SetOmissionModeCounts(2003, 64) {
        level_1_count: i32,
        level_2_count: i32,
    }
    struct ResetOmissionModeCountsToDefault(2003, 65) {}
    struct SetEventFlag(2003, 66) {
        target_event_flag_type: u8, // Target Event Flag Type
        target_event_flag_id: u32,
        desired_flag_state: u8, // ON/OFF
    }
    struct ChangeWeather(2003, 68) {
        weather: i8, // Weather
        lifespan_seconds: f32,
        should_switch_immediately: bool,
    }
    struct SetNetworkConnectedEventFlag(2003, 69) {
        target_event_flag_type: u8, // Target Event Flag Type
        target_event_flag_id: u32,
        desired_flag_state: u8, // ON/OFF
    }
    struct TriggerAreaReload(2003, 70) {
        ignore_is_my_world_check: bool,
    }
    struct AwardGesture(2003, 71) {
        gesture_param_id: i32,
    }
    struct ReduceBloodstainSouls(2003, 72) {
        decrease_rate: f32,
        soul_amount_save_slot_id: i32,
    }
    struct IncreaseEnemySoulDropAmount(2003, 73) {
        entity_id: u32,
        fixed_increase_amount: i32,
        soul_amount_load_slot_id: i32,
    }
    struct IssueEndOfPseudoMultiplayerNotification(2003, 74) {
        success: bool,
    }
    struct UseFarViewCamera(2003, 75) {
        far_view_id: u32,
        asset_entity_id: u32,
        dummypoly_id: i32,
    }
    struct SetPlayerPositionDisplay(2003, 76) {
        state: u8, // Disabled/Enabled
        aboveground: bool,
        area_id: u8,
        block_id: u8,
        region_id: u8,
        index_id: u8,
        x: f32,
        y: f32,
        z: f32,
    }
    struct SetPsuedoMultiplayerReturnPosition(2003, 77) {
        area_entity_id: u32,
    }
    struct OpenWorldMapPoint(2003, 78) {
        world_map_point_param_id: i32,
        distance: f32,
    }
    struct SendNPCSummonHome(2003, 79) {
        npc_entity_id: u32,
    }
    struct RemoveGesture(2003, 81) {
        gesture_param_id: i32,
    }
    struct DeleteNPCSummonSign(2003, 82) {
        npc_entity_id: u32,
    }

    // Character
    struct SetCharacterTeamType(2004, 2) {
        entity_id: u32,
        team_type: u8, // Team Type
    }
    struct ForceCharacterDeath(2004, 4) {
        entity_id: u32,
        should_receive_runes: bool,
    }
    struct EzstateInstructionRequest(2004, 6) {
        entity_id: u32,
        command: i32,
        slot: u8,
    }
    struct CreateBulletOwner(2004, 7) {
        entity_id: u32,
    }
    struct SetSpEffect(2004, 8) {
        entity_id: u32,
        sp_effect_id: i32,
    }
    struct SetCharacterEventTarget(2004, 11) {
        entity_id: u32,
        entity_id_2: u32,
    }
    struct SetCharacterHome(2004, 13) {
        entity_id: u32,
        area_entity_id: u32,
    }
    struct RotateCharacter(2004, 14) {
        entity_id: u32,
        relative_entity_id: u32,
        animation_id: i32,
        should_wait_for_completion: bool,
    }
    struct ClearCharactersAITarget(2004, 16) {
        entity_id: u32,
    }
    struct RequestCharacterAICommand(2004, 17) {
        entity_id: u32,
        command_id: i32,
        slot_number: u8,
    }
    struct SetEventPoint(2004, 18) {
        entity_id: u32,
        relative_entity_id: u32,
        reaction_distance: f32,
    }
    struct SetCharacterAIId(2004, 19) {
        entity_id: u32,
        ai_id: i32,
    }
    struct RequestCharacterAIRePlan(2004, 20) {
        entity_id: u32,
    }
    struct ClearSpEffect(2004, 21) {
        entity_id: u32,
        sp_effect_id: i32,
    }
    struct CreateNPCPart(2004, 22) {
        entity_id: u32,
        npc_part_id: i16,
        npc_part_group_idx: i16, // NPC Part Type
        npc_part_hp: i32,
        damage_correction: f32,
        body_damage_compensation: f32,
        is_invincible: bool,
        start_in_stopped_state: bool,
    }
    struct SetNPCPartHP(2004, 23) {
        entity_id: u32,
        npc_part_id: i32,
        desired_hp: i32,
        should_allow_hp_above_max_hp: bool,
    }
    struct SetNPCPartSEAndSFX(2004, 24) {
        entity_id: u32,
        npc_part_id: i32,
        defense_material_se_id: i32,
        defense_material_sfx_id: i32,
        unknowna: i32,
        unknownb: i32,
        unknownc: i32,
    }
    struct SetNPCPartBulletDamageMultiplier(2004, 25) {
        entity_id: u32,
        npc_part_id: i32,
        bullet_damage_multiplier: f32,
    }
    struct ChangeCharacterDispmask(2004, 26) {
        entity_id: u32,
        bit_number: u8,
        switch_type: u8, // ON/OFF/CHANGE
    }
    struct ChangeCharacterHitmask(2004, 27) {
        character_entity_id: u32,
        bit_number: u8,
        switch_type: u8, // ON/OFF/CHANGE
    }
    struct SetNetworkUpdateAuthority(2004, 28) {
        entity_id: u32,
        authority_level: i32, // Authority Level
    }
    struct SetCharacterBackreadState(2004, 29) {
        entity_id: u32,
        removed: bool,
    }
    struct SetCharacterMaphit(2004, 31) {
        entity_id: u32,
        disabled: bool,
    }
    struct CreateReferredDamagePair(2004, 33) {
        source_entity_id: u32,
        target_entity_id: u32,
    }
    struct SetNetworkUpdateRate(2004, 34) {
        entity_id: u32,
        use_fixed_frequency: bool,
        update_frequency: i8, // Character Update Frequency
    }
    struct ForceCharacterTreasure(2004, 37) {
        character_entity_id: u32,
    }
    struct BetrayCharactersCurrentCovenant(2004, 38) {
        dummy: u8,
    }
    struct WarpCharacterAndSetFloor(2004, 40) {
        entity_id: u32,
        warp_entity_type: u8, // Target Entity Type
        warp_destination_entity_id: u32,
        dummypoly_id: i32,
        warp_destination_hit_entity_id: u32,
    }
    struct IssueShortWarpRequest(2004, 41) {
        entity_id: u32,
        warp_entity_type: u8, // Target Entity Type
        warp_destination_entity_id: u32,
        dummypoly_id: i32,
    }
    struct WarpCharacterAndCopyFloor(2004, 42) {
        entity_id: u32,
        warp_entity_type: u8, // Target Entity Type
        warp_destination_entity_id: u32,
        dummypoly_id: i32,
        entity_id_to_copy_floor_from: u32,
    }
    struct RequestCharacterAnimationReset(2004, 43) {
        character_entity_id: u32,
        state: u8, // Disabled/Enabled
    }
    struct BonfireLikeRecovery(2004, 47) {}
    struct ChangeCharactersCloth(2004, 48) {
        entity_id: u32,
        bit_number: u8,
        state_id: u8,
    }
    struct ChangeCharacterPatrolBehavior(2004, 49) {
        character_entity_id: u32,
        patrol_information_entity_id: u32,
    }
    struct ChangeCharacter(2004, 52) {
        character_param_id: i32,
    }
    struct SetCharacterTalkRange(2004, 55) {
        entity_id: u32,
        range: f32,
    }
    struct ConnectCharacterToCaravan(2004, 60) {
        character_entity_id: u32,
        caravan_asset_entity_id: u32,
    }
    struct SetCharacterEnableDistance(2004, 63) {
        character_entity_id: u32,
        distance: f32,
    }
    struct CopyPlayerCharacterData(2004, 67) {
        source_character_entity_id: u32,
        target_character_entity_id: u32,
    }
    struct AttachAssetToCharacter(2004, 68) {
        character_entity_id: u32,
        dummypoly_id: i32,
        asset_entity_id: u32,
    }
    struct WarpCharacterAndCopyFloorWithFadeOut(2004, 74) {
        entity_id: u32,
        warp_entity_type: u8, // Target Entity Type
        warp_destination_entity_id: u32,
        dummypoly_id: i32,
        entity_id_to_copy_floor_from: u32,
        use_bonfire_effect: bool,
        reset_camera: bool,
    }
    struct SetCharacterFaceParamOverride(2004, 75) {
        character_entity_id: u32,
        override_slot: i8,
        face_param_id: i32,
    }
    struct FadeToBlack(2004, 77) {
        fade_to_black_ratio: f32,
        fade_to_black_time_s: f32,
        freeze_player: bool,
        freeze_player_delay_s: f32,
    }
    struct CopyCharacterDataFromOnlinePlayers(2004, 78) {
        pool_type: i8,
        fallback_character_param_id: i32,
        target_entity_id: u32,
    }
    struct RequestCharacterDataFromOnlinePlayers(2004, 79) {
        pool_type: i8,
        unknown: i32,
    }
    struct SendCharacterDataToOnlinePlayers(2004, 80) {
        pool_type: i8,
    }
    struct ResetCharacterPosition(2004, 81) {
        character_entity_id: u32,
    }
    struct SetSpecialStandbyEndedFlag(2004, 83) {
        character_entity_id: u32,
        flag_state: u8, // ON/OFF
    }
    struct FadeToColor(2004, 85) {
        opacity: f32,
        fade_time_s: f32,
        freeze_player: bool,
        freeze_player_delay_s: f32,
        red: f32,
        green: f32,
        blue: f32,
    }

    // Asset
    struct RequestAssetDestruction(2005, 1) {
        entity_id: u32,
        slot_number: i8,
    }
    struct RequestAssetRestoration(2005, 2) {
        entity_id: u32,
    }
    struct InitializeObjAct(2005, 5) {
        entity_id: u32,
        obj_act_param_id: i32,
        relative_target_idx: i32,
    }
    struct ReproduceAssetAnimation(2005, 7) {
        target_asset_entity_id: u32,
        animation_id: i32,
    }
    struct ReproduceAssetDestruction(2005, 8) {
        entity_id: u32,
        slot_number: i8,
    }
    struct CreateDamagingAsset(2005, 9) {
        event_flag_id: u32,
        entity_id: u32,
        dummypoly_id: i32,
        behavior_id: i32,
        target: i32, // Damage Target Type
        radius: f32,
        lifespan: f32,
        repetition_time_s: f32,
    }
    struct WarpAssetToCharacter(2005, 11) {
        entity_id: u32,
        character_entity_id: u32,
        dummypoly_id: i16,
    }
    struct DeleteAssetEvent(2005, 12) {
        event_flag_id: u32,
    }
    struct RerollAssetTreasure(2005, 15) {
        target_asset_entity_id: u32,
    }
    struct AttachCaravanToController(2005, 17) {
        caravan_asset_entity_id: u32,
        character_entity_id: u32,
    }
    struct AttachAssetToAsset(2005, 18) {
        child_asset_entity_id: u32,
        parent_asset_entity_id: u32,
        parent_dummypoly_id: i32,
    }
    struct CreateBigDamagingAsset(2005, 20) {
        event_flag_id: u32,
        entity_id: u32,
        starting_dummypoly_id: i32,
        ending_dummypoly_id: i32,
        behavior_id: i32,
        target: i32, // Damage Target Type
        radius: f32,
        lifespan: f32,
        repetition_time_s: f32,
    }

    // SFX
    struct DeleteMapSFX(2006, 1) {
        entity_id: u32,
        only_delete_root: bool,
    }
    struct SpawnMapSFX(2006, 2) {
        entity_id: u32,
    }
    struct SpawnOneshotSFX(2006, 3) {
        target_entity_type: i32, // Target Entity Type
        entity_id: u32,
        dummypoly_id: i32,
        sfx_id: i32,
    }
    struct CreateAssetFollowingSFX(2006, 4) {
        asset_entity_id: u32,
        dummypoly_id: i32,
        sfx_id: i32,
    }
    struct DeleteAssetFollowingSFX(2006, 5) {
        asset_entity_id: u32,
        should_delete_root: bool,
    }
    struct SetWindSFX(2006, 6) {
        wind_sfx_id: i32,
    }

    // Message
    struct DisplayGenericDialog(2007, 1) {
        message_id: i32,
        dialog_type: i16, // Prompt Type
        number_of_options: i16, // Number of Options
        entity_id: u32,
        display_distance: f32,
    }
    struct DisplayBanner(2007, 2) {
        banner_type: u8, // Text Banner Type
    }
    struct DisplayStatusMessage(2007, 3) {
        message_id: i32,
        pad_state: u8, // Disabled/Enabled
    }
    struct DisplayBlinkingMessage(2007, 4) {
        message_id: i32,
    }
    struct DisplayFullScreenMessage(2007, 9) {
        message_id: i32,
    }
    struct DisplayGenericDialogAndSetEventFlags(2007, 10) {
        message_id: i32,
        dialog_type: i16, // Prompt Type
        number_of_options: i16, // Number of Options
        entity_id: u32,
        display_distance: f32,
        left_response_event_flag_id: u32,
        right_response_event_flag_id: u32,
        cancel_response_event_flag_id: u32,
    }
    struct DisplayBlinkingMessageWithPriority(2007, 12) {
        message_id: i32,
        priority: i16,
        should_interrupt: bool,
    }
    struct DisplaySubareaWelcomeMessage(2007, 13) {
        message_id: i32,
    }
    struct DisplayAreaWelcomeMessage(2007, 14) {
        message_id: i32,
    }
    struct ShowTutorialPopup(2007, 15) {
        tutorial_param_id: i32,
        unknown: bool,
        unknown2: bool,
    }
    struct DisplayNetworkMessage(2007, 16) {
        network_message_id: i32,
        unknown: bool,
    }

    // Camera
    struct ChangeCamera(2008, 1) {
        normal_camera_id: i32,
        locked_camera_id: i32,
    }
    struct SetCameraVibration(2008, 2) {
        vibration_id: i32,
        target_entity_type: i32, // Target Entity Type
        entity_id: u32,
        dummypoly_id: i32,
        decay_start_distance: f32,
        decay_end_distance: f32,
    }
    struct SetLockcamSlotNumber(2008, 3) {
        area_id: u8,
        block_id: u8,
        lockcam_slot_number: u16,
    }
    struct SetCameraAngle(2008, 4) {
        x_angle: f32,
        y_angle: f32,
    }

    // Script
    struct RegisterLadder(2009, 0) {
        disable_top_event_flag_id: u32,
        disable_bottom_event_flag_id: u32,
        entity_id: u32,
    }
    struct RegisterBonfire(2009, 3) {
        event_flag_id: u32,
        entity_id: u32,
        reaction_distance: f32,
        reaction_angle: f32,
        set_standard_kindling_level: i32,
        enemy_deactivation_distance: f32,
    }
    struct ActivateMultiplayerDependantBuffs(2009, 4) {
        entity_id: u32,
    }
    struct IssueBossRoomEntryNotification(2009, 6) {
        dummy: u8,
    }
    struct SendInvadingPhantomsHome(2009, 8) {
        unknown: i32,
    }
    struct SendAllPhantomsHome(2009, 11) {
        dummy: i32,
    }
    struct SendAllPhantomsHomeAndUpdateServerPvpStats(2009, 12) {
        unknown: i32,
    }

    // Sound
    struct PlaySE(2010, 2) {
        entity_id: u32,
        sound_type: i32, // Sound Type
        sound_id: i32,
    }
    struct SuppressSE(2010, 7) {
        sound_type: i32, // Sound Type
        unknown: i32,
        is_suppression_active: bool,
    }
    struct SetBossBGM(2010, 10) {
        bgm_boss_conv_param_id: i32,
        state: i32, // Boss BGM State
    }
    struct SuppressSoundForFogGate(2010, 11) {
        time_s: f32,
    }
    struct SetFieldBattleBGMHeatUp(2010, 12) {
        npc_threat_level: u32,
        heat_up: bool,
    }

    // Map
    struct ActivateGparamOverride(2012, 11) {
        gparam_sub_id: i32,
        change_time_s: f32,
    }
    struct DeactivateGparamOverride(2012, 12) {
        change_time_s: f32,
    }
}

lua_emevd_enable_disable_commands! {
    fn register_emevd_enable_disable_commands(lua: &Lua, table: &LuaTable) -> LuaResult<()>;

    // System
    struct NetworkSync(2000, 2) {}

    // Event
    struct Generator(2003, 3) {
        generator_entity_id: u32,
    }
    struct MapHit(2003, 6) {
        entity_id: u32,
    }
    struct MapVisibility(2003, 7) {
        entity_id: u32,
    }
    struct MessageVisibility(2003, 26) {
        message_entity_id: u32,
    }
    struct DirectionDisplay(2003, 44) {}
    struct TextOnLoadingScreen(2003, 80) {}

    // Character
    struct CharacterAI(2004, 1) {
        entity_id: u32,
    }
    struct Character(2004, 5) {
        character_entity_id: u32,
    }
    struct CharacterGravity(2004, 10) {
        entity_id: u32,
    }
    struct CharacterImmortality(2004, 12) {
        entity_id: u32,
    }
    struct CharacterInvincibility(2004, 15) {
        entity_id: u32,
    }
    struct CharacterHPBarDisplay(2004, 30) {
        entity_id: u32,
    }
    struct CharacterDefaultBackread(2004, 35) {
        entity_id: u32,
    }
    struct CharacterCollision(2004, 39) {
        entity_id: u32,
    }
    struct LockOnPoint(2004, 50) {
        entity_id: u32,
        lock_on_dummypoly_id: i32,
    }
    struct CharacterDisableOnHitUnload(2004, 69) {
        character_entity_id: u32,
    }
    struct DistanceBasedNetworkUpdateAuthority(2004, 70) {
        character_entity_id: u32,
    }
    struct CharacterFadeOnEnable(2004, 73) {
        character_entity_id: u32,
    }

    // Asset
    struct Asset(2005, 3) {
        target_asset_entity_id: u32,
    }
    struct AssetTreasure(2005, 4) {
        target_asset_entity_id: u32,
    }
    struct ObjAct(2005, 6) {
        entity_id: u32,
        obj_act_param_id: i32,
    }
    struct AssetInvulnerability(2005, 13) {
        target_asset_entity_id: u32,
    }
    struct ObjActAssignIdx(2005, 14) {
        entity_id: u32,
        obj_act_param_id: i32,
        relative_target_idx: i32,
    }

    // Hit
    struct Hit(2011, 1) {
        hit_entity_id: u32,
    }
    struct HitBackreadMask(2011, 2) {
        hit_entity_id: u32,
    }
    struct Hitres(2011, 3) {
        hit_entity_id: u32,
    }

    // Map
    struct MapPart(2012, 1) {
        map_part_entity_id: u32,
    }
    struct AreaWelcomeMessage(2012, 8) {}
}

lua_emevd_conditions! {
    fn register_emevd_conditions(lua: &Lua, table: &LuaTable) -> LuaResult<()>;

    // Condition - Timer
    struct TimeOfDay(1, 4) {
        hours: u8,
        minutes: u8,
        seconds: u8,
    }
    struct TimeOfDayInRange(1, 5) {
        starting_hours: u8,
        starting_minutes: u8,
        starting_seconds: u8,
        ending_hours: u8,
        ending_minutes: u8,
        ending_seconds: u8,
    }

    // Condition - Event
    struct EventFlag(3, 0) {
        desired_flag_state: u8, // ON/OFF/CHANGE
        target_event_flag_type: u8, // Target Event Flag Type
        target_event_flag_id: u32,
    }
    struct BatchEventFlags(3, 1) {
        desired_flag_state: u8, // Logical Operation Type
        target_event_flag_type: u8, // Target Event Flag Type
        starting_target_event_flag_id: u32,
        ending_target_event_flag_id: u32,
    }
    struct InOutsideArea(3, 2) {
        desired_state: u8, // Inside/Outside State
        target_entity_id: u32,
        area_entity_id: u32,
        number_of_target_characters: i32,
    }
    struct EntityInOutsideRadiusOfEntity(3, 3) {
        desired_state: u8, // Inside/Outside State
        target_entity_id_a: u32,
        target_entity_id_b: u32,
        target_distance: f32,
        number_of_target_characters: i32,
    }
    struct PlayerHasDoesntHaveItem(3, 4) {
        item_type: u8, // Item Type
        item_id: i32,
        desired_possession_state: u8, // Ownership State
    }
    struct MultiplayerState(3, 6) {
        desired_multiplayer_state: i8, // Multiplayer State
    }
    struct AllPlayersInOutsideArea(3, 7) {
        desired_state: u8, // Inside/Outside State
        area_entity_id: u32,
    }
    struct PlayerInOutMap(3, 8) {
        should_player_be_inside: bool,
        area_id: i8,
        block_id: i8,
        region_id: i8,
        index_id: i8,
    }
    struct MultiplayerEvent(3, 9) {
        multiplayer_event_id: u32,
    }
    struct CountEventFlags(3, 10) {
        target_event_flag_type: u8, // Target Event Flag Type
        starting_target_event_flag_id: u32,
        ending_target_event_flag_id: u32,
        comparison_type: i8, // Comparison Type
        count_threshold: i32,
    }
    struct EventValue(3, 12) {
        base_event_flag_id: u32,
        number_of_used_flag_bits: u8,
        comparison_type: u8, // Comparison Type
        threshold_value: u32,
    }
    struct DroppedItemsInArea(3, 14) {
        area_entity_id: u32,
    }
    struct DroppedItem(3, 15) {
        item_type: u8, // Item Type
        item_id: i32,
    }
    struct PlayerHasDoesntHaveItemIncludingBbox(3, 16) {
        item_type: u8, // Item Type
        item_id: i32,
        desired_possession_state: u8, // Ownership State
    }
    struct GameCycle(3, 17) {
        comparison_type: u8, // Comparison Type
        completed_game_cycles_threshold: u8,
    }
    struct CompareEventValues(3, 20) {
        left_side_base_event_flag_id: u32,
        left_side_number_of_used_flag_bits: u8,
        comparison_type: u8, // Comparison Type
        right_side_base_event_flag_id: u32,
        right_side_number_of_used_flag_bits: u8,
    }
    struct OnlineMode(3, 22) {
        online_mode: bool,
    }
    struct DamageType(3, 23) {
        target_entity_id: u32,
        attacker_entity_id: u32,
        damage_type: u8, // Damage Type
    }
    struct ActionButtonInArea(3, 24) {
        action_button_parameter_id: i32,
        target_entity_id: u32,
    }
    struct PlayerIsInWorldType(3, 26) {
        world_type: u8, // World Type
    }
    struct MapLoaded(3, 30) {
        area_id: u8,
        block_id: u8,
        region_id: u8,
        index_id: u8,
    }
    struct WeatherActive(3, 31) {
        weather: i8, // Weather
        start_delay_during_change_s: f32,
        end_delay_during_change_s: f32,
    }
    struct MapHasPermissionToUpdate(3, 32) {
        has_permission: bool,
        unknown: bool,
        area_id: i8,
        block_id: i8,
        region_id: i8,
        index_id: i8,
    }
    struct FieldBattleBGMActive(3, 33) {
        npc_threat_level: u32,
        is_active: bool,
    }
    struct PlayerHasArmorEquipped(3, 34) {
        armor_type: u8, // Armor Type
        armor_item_id: i32,
        unknown: i32,
    }
    struct CeremonyActive(3, 35) {
        is_active: bool,
        ceremony_id: i32,
    }
    struct WeatherLotActive(3, 37) {
        weather_lot_param_id: i32,
        is_active: bool,
    }
    struct PlayerGender(3, 38) {
        gender: u8, // Gender
    }
    struct ArenaMatchReadyState(3, 39) {
        ready: bool,
    }
    struct ArenaSoloResults(3, 40) {
        result: u8, // Arena Result
    }
    struct ArenaSoloScoreComparison(3, 41) {
        comparison_type: i8, // Comparison Type
        target_score: i32,
    }
    struct ArenaTeamResults(3, 42) {
        result: u8, // Arena Result
    }
    struct ArenaTeamScoreComparison(3, 43) {
        comparison_type: i8, // Comparison Type
        target_score: i32,
    }
    struct ArenaMatchType(3, 44) {
        match_type: u8, // Arena Match Type
        has_spirit_summon: bool,
    }
    struct PlayerRespawnedInArena(3, 45) {}
    struct TutorialSeen(3, 46) {
        tutorial_param_id: i32,
    }

    // Condition - Character
    struct CharacterDeadAlive(4, 0) {
        target_entity_id: u32,
        desired_life_state: u8, // Death State
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterHPRatio(4, 2) {
        target_entity_id: u32,
        comparison_type: i8, // Comparison Type
        target_hp_ratio: f32,
        comparison_type2: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterType(4, 3) {
        target_entity_id: u32,
        target_type: i8, // Target Type
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterTargetedBy(4, 4) {
        aggressor_entity_id: u32,
        target_entity_id: u32,
        should_have: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterHasSpEffect(4, 5) {
        target_entity_id: u32,
        sp_effect_id: i32,
        should_have: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct NPCPartHP(4, 6) {
        target_entity_id: u32,
        npc_part_id: i32,
        hp_threshold: i32,
        comparison_type: i8, // Comparison Type
    }
    struct CharacterBackreadStatus(4, 7) {
        target_entity_id: u32,
        is_backread: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterHasEventMessage(4, 8) {
        target_entity_id: u32,
        target_event_message_id: i32,
        should_have: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterAIState(4, 9) {
        target_entity_id: u32,
        ai_state: u8, // AI State Type
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct PlayersClass(4, 11) {
        class_type: u8, // Class Type
    }
    struct PlayersCovenant(4, 12) {
        covenant_index: u8,
    }
    struct PlayersSoulLevel(4, 13) {
        comparison_type: u8, // Comparison Type
        target_soul_level: u32,
    }
    struct CharacterHPValue(4, 14) {
        target_entity_id: u32,
        comparison_type: i8, // Comparison Type
        target_hp: i32,
        comparison_type2: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterRatioDeadAlive(4, 15) {
        target_entity_id: u32,
        desired_life_state: u8, // Death State
        comparison_type: i8, // Comparison Type
        target_ratio: f32,
    }
    struct CharacterRatioHPRatio(4, 16) {
        target_entity_id: u32,
        comparison_type: i8, // Comparison Type
        target_amount: f32,
        comparison_type2: i8, // Comparison Type
        target_ratio: f32,
    }
    struct CharacterRatioHasSpEffect(4, 19) {
        target_entity_id: u32,
        sp_effect_id: i32,
        should_have: bool,
        comparison_type: i8, // Comparison Type
        target_ratio: f32,
    }
    struct CharacterRatioAIState(4, 22) {
        target_entity_id: u32,
        ai_state: u8, // AI State Type
        comparison_type: i8, // Comparison Type
        target_ratio: f32,
    }
    struct PlayerTargeted(4, 28) {
        min_npc_threat_level: u32,
        max_npc_threat_level: u32,
        ai_state_type: u8, // AI State Type
    }
    struct NPCPartAttributeDamage(4, 30) {
        target_entity_id: u32,
        npc_part_id: i32,
        attacker_entity_id: u32,
        damage_type: u8, // Damage Type
    }
    struct CharacterInvadeType(4, 31) {
        target_entity_id: u32,
        invade_type_unknown: u8,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct CharacterRidingMount(4, 32) {
        target_entity_id: u32,
        is_mounted: bool,
    }
    struct CharacterHasStateInfo(4, 34) {
        target_entity_id: u32,
        state_info: i16,
        should_have: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_characters: f32,
    }
    struct SpecialStandbyEndedFlag(4, 35) {
        target_entity_id: u32,
        desired_flag_state: u8, // ON/OFF/CHANGE
    }

    // Condition - Asset
    struct AssetDestroyed(5, 0) {
        damage_state: u8, // Destruction State
        target_asset_entity_id: u32,
        comparison_type: i8, // Comparison Type
        number_of_target_assets: f32,
    }
    struct AssetHitBy(5, 1) {
        target_entity_id: u32,
        attacker_entity_id: u32,
    }
    struct ObjActEventFlag(5, 2) {
        obj_act_event_flag: u32,
    }
    struct AssetHP(5, 3) {
        target_entity_id: u32,
        comparison_type: i8, // Comparison Type
        hp_threshold: i32,
        comparison_type2: i8, // Comparison Type
        number_of_target_assets: f32,
    }
    struct AssetRatioDestroyed(5, 6) {
        damage_state: u8, // Destruction State
        target_entity_id: u32,
        comparison_type: i8, // Comparison Type
        target_ratio: f32,
    }
    struct AssetBurnState(5, 9) {
        target_entity_id: u32,
        comparison_type: u8, // Comparison Type
        burn_state_unknown: u8,
        comparison_type2: i8, // Comparison Type
        number_of_target_assets: f32,
    }
    struct AssetBackread(5, 10) {
        target_entity_id: u32,
        is_backread: bool,
        comparison_type: i8, // Comparison Type
        number_of_target_assets: f32,
    }
    struct AssetRatioBackread(5, 11) {
        target_entity_id: u32,
        is_backread: bool,
        comparison_type: i8, // Comparison Type
        target_ratio: f32,
    }

    // Condition - Hit
    struct PlayerMovingOnHit(11, 0) {
        hit_entity_id: u32,
    }
    struct PlayerAttackingOnHit(11, 1) {
        hit_entity_id: u32,
    }
    struct PlayerStandingOnHit(11, 2) {
        hit_entity_id: u32,
    }
    struct PlayerStandingOnHitGroup(11, 3) {
        hit_entity_id: u32,
    }
}

pub(crate) fn create(lua: &Lua) -> Result<LuaTable> {
    let emevd = lua.create_table()?;
    register_emevd_commands(lua, &emevd)?;
    register_emevd_enable_disable_commands(lua, &emevd)?;
    register_emevd_conditions(lua, &emevd)?;
    Ok(emevd)
}
