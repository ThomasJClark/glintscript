---@meta
glint = {}
glint.emevd = {}

-- System

---@param dummy number
function glint.emevd.SaveRequest(dummy) end

---@param activity_id number
function glint.emevd.StartPS5Activity(activity_id) end

---@param activity_id number
function glint.emevd.EndPS5Activity(activity_id) end

-- Timer

---@param hours number
---@param minutes number
---@param seconds number
---@param fade_transition boolean
---@param should_wait_for_completion boolean
---@param show_clock boolean
---@param clock_startup_delay_s number
---@param clock_move_time_s number
---@param clock_finish_delay_s number
function glint.emevd.SetCurrentTime(hours, minutes, seconds, fade_transition, should_wait_for_completion, show_clock,
                                    clock_startup_delay_s, clock_move_time_s, clock_finish_delay_s)
end

---@param should_freeze boolean
function glint.emevd.FreezeTime(should_freeze) end

-- Cutscene

---@param cutscene_id number
---@param playback_method number
function glint.emevd.PlayCutsceneToAll(cutscene_id, playback_method) end

---@param cutscene_id number
---@param playback_method number
---@param player_entity_id number
function glint.emevd.PlayCutsceneToPlayer(cutscene_id, playback_method, player_entity_id) end

---@param cutscene_id number
---@param playback_method number
---@param player_entity_id number
---@param should_change_weather boolean
---@param weather number
---@param weather_lifespan_seconds number
---@param should_change_time boolean
---@param hours number
---@param minutes number
---@param seconds number
function glint.emevd.PlayCutsceneToPlayerWithWeatherAndTime(cutscene_id, playback_method, player_entity_id,
                                                            should_change_weather, weather, weather_lifespan_seconds,
                                                            should_change_time, hours, minutes, seconds)
end

---@param cutscene_id number
---@param playback_method number
---@param area_entity_id number
---@param map_id number
---@param player_entity_id number
---@param unknown14 number
---@param unknown18 boolean
function glint.emevd.PlayCutsceneToPlayerAndWarp(cutscene_id, playback_method, area_entity_id, map_id, player_entity_id,
                                                 unknown14, unknown18)
end

---@param cutscene_id number
---@param playback_method number
---@param area_entity_id number
---@param map_id number
---@param player_entity_id number
---@param unknown14 number
---@param unknown18 boolean
---@param should_change_weather boolean
---@param weather number
---@param weather_lifespan_seconds number
---@param should_change_time boolean
---@param hours number
---@param minutes number
---@param seconds number
function glint.emevd.PlayCutsceneToPlayerAndWarpWithWeatherAndTime(cutscene_id, playback_method, area_entity_id, map_id,
                                                                   player_entity_id, unknown14, unknown18,
                                                                   should_change_weather, weather,
                                                                   weather_lifespan_seconds, should_change_time, hours,
                                                                   minutes, seconds)
end

---@param cutscene_id number
---@param playback_method number
---@param area_entity_id number
---@param map_id number
---@param player_entity_id number
---@param unknown14 number
---@param unknown18 boolean
---@param should_update_stable_position boolean
function glint.emevd.PlayCutsceneToPlayerAndWarpWithStablePositionUpdate(cutscene_id, playback_method, area_entity_id,
                                                                         map_id, player_entity_id, unknown14, unknown18,
                                                                         should_update_stable_position)
end

-- Event

---@param item_lot_id number
function glint.emevd.AwardItemLot(item_lot_id) end

---@param bullet_team_entity_id number
---@param bullet_producer_entity_id number
---@param dummypoly_id number
---@param behavior_id number
---@param firing_angle_x number
---@param firing_angle_y number
---@param firing_angle_z number
function glint.emevd.ShootBullet(bullet_team_entity_id, bullet_producer_entity_id, dummypoly_id, behavior_id,
                                 firing_angle_x, firing_angle_y, firing_angle_z)
end

---@param event_flag_id number
function glint.emevd.InvertEventFlag(event_flag_id) end

---@param disabled_enabled number
---@param entity_id number
---@param slot_number number
---@param name_id number
function glint.emevd.DisplayBossHealthBar(disabled_enabled, entity_id, slot_number, name_id) end

---@param entity_id number
---@param banner_type number
function glint.emevd.HandleBossDefeatAndDisplayBanner(entity_id, banner_type) end

---@param navimesh_entity_id number
---@param navimesh_type number
---@param type_bit_operation number
function glint.emevd.ModifyNavimeshConnectionBitflag(navimesh_entity_id, navimesh_type, type_bit_operation) end

---@param area_id number
---@param block_id number
---@param region_id number
---@param index_id number
---@param initial_area_entity_id number
---@param subarea_name_popup_message_id number
function glint.emevd.WarpPlayer(area_id, block_id, region_id, index_id, initial_area_entity_id,
                                subarea_name_popup_message_id)
end

---@param entity_id number
function glint.emevd.HandleMinibossDefeat(entity_id) end

---@param multiplayer_event_id number
function glint.emevd.TriggerMultiplayerEvent(multiplayer_event_id) end

---@param event_flag_id_min number
---@param event_flag_id_max number
---@param flag_state number
function glint.emevd.RandomlySetEventFlagInRange(event_flag_id_min, event_flag_id_max, flag_state) end

---@param entity_id number
---@param animation_id number
---@param should_loop boolean
---@param should_wait_for_completion boolean
---@param ignore_wait_for_transition boolean
---@param comparison_type number
---@param number_of_target_characters number
function glint.emevd.ForceAnimationPlayback(entity_id, animation_id, should_loop, should_wait_for_completion,
                                            ignore_wait_for_transition, comparison_type, number_of_target_characters)
end

---@param dummy number
function glint.emevd.IncrementGameCycle(dummy) end

---@param event_flag_id_start number
---@param event_flag_id_end number
---@param flag_state number
function glint.emevd.BatchSetEventFlags(event_flag_id_start, event_flag_id_end, flag_state) end

---@param respawn_area_entity_id number
function glint.emevd.SetPlayerRespawnPoint(respawn_area_entity_id) end

---@param item_type number
---@param item_id number
---@param number number
function glint.emevd.RemoveItemFromPlayer(item_type, item_id, number) end

---@param sign_type number
---@param summoned_npc_entity_id number
---@param spawn_area_entity_id number
---@param summon_event_flag_id number
---@param dismissal_event_flag_id number
---@param unknown boolean
function glint.emevd.PlaceNPCSummonSign(sign_type, summoned_npc_entity_id, spawn_area_entity_id, summon_event_flag_id,
                                        dismissal_event_flag_id, unknown)
end

---@param achievement_id number
function glint.emevd.AwardAchievement(achievement_id) end

---@param base_event_flag_id number
---@param number_of_used_flag_bits number
---@param maximum_allowed_value number
function glint.emevd.IncrementEventValue(base_event_flag_id, number_of_used_flag_bits, maximum_allowed_value) end

---@param base_event_flag_id number
---@param number_of_used_flag_bits number
function glint.emevd.ClearEventValue(base_event_flag_id, number_of_used_flag_bits) end

---@param event_flag_id number
function glint.emevd.SetSnugglyNextTrade(event_flag_id) end

---@param item_lot_id number
---@param placement_area_entity_id number
---@param event_flag_id number
---@param hit_entity_id number
function glint.emevd.SpawnSnugglyItem(item_lot_id, placement_area_entity_id, event_flag_id, hit_entity_id) end

---@param source_area_entity_id number
---@param destination_area_entity_id number
function glint.emevd.MoveBloodstainAndDroppedItems(source_area_entity_id, destination_area_entity_id) end

---@param item_lot_id number
function glint.emevd.AwardItemsIncludingClients(item_lot_id) end

---@param base_event_flag_id number
---@param number_of_used_flag_bits number
---@param operand number
---@param base_event_flag_id_operand number
---@param number_of_used_event_flag_bits_operand number
---@param calculation_type number
function glint.emevd.EventValueOperation(base_event_flag_id, number_of_used_flag_bits, operand,
                                         base_event_flag_id_operand, number_of_used_event_flag_bits_operand,
                                         calculation_type)
end

---@param item_type number
---@param item_id number
---@param base_event_flag_id number
---@param number_of_used_flag_bits number
function glint.emevd.StoreItemAmountHeldInEventValue(item_type, item_id, base_event_flag_id, number_of_used_flag_bits) end

---@param item_type number
---@param item_id number
---@param base_event_flag_id number
---@param number_of_used_flag_bits number
function glint.emevd.DirectlyGivePlayerItem(item_type, item_id, base_event_flag_id, number_of_used_flag_bits) end

---@param ai_sound_param_id number
---@param entity_id number
---@param origin_entity_type number
function glint.emevd.TriggerAISound(ai_sound_param_id, entity_id, origin_entity_type) end

---@param generator_entity_id number
function glint.emevd.InvokeEnemyGenerator(generator_entity_id) end

---@param event_flag_id_start number
---@param event_flag_id_end number
---@param flag_state number
function glint.emevd.BatchSetNetworkConnectedEventFlags(event_flag_id_start, event_flag_id_end, flag_state) end

---@param level_1_count number
---@param level_2_count number
function glint.emevd.SetOmissionModeCounts(level_1_count, level_2_count) end

function glint.emevd.ResetOmissionModeCountsToDefault() end

---@param target_event_flag_type number
---@param target_event_flag_id number
---@param desired_flag_state number
function glint.emevd.SetEventFlag(target_event_flag_type, target_event_flag_id, desired_flag_state) end

---@param weather number
---@param lifespan_seconds number
---@param should_switch_immediately boolean
function glint.emevd.ChangeWeather(weather, lifespan_seconds, should_switch_immediately) end

---@param target_event_flag_type number
---@param target_event_flag_id number
---@param desired_flag_state number
function glint.emevd.SetNetworkConnectedEventFlag(target_event_flag_type, target_event_flag_id, desired_flag_state) end

---@param ignore_is_my_world_check boolean
function glint.emevd.TriggerAreaReload(ignore_is_my_world_check) end

---@param gesture_param_id number
function glint.emevd.AwardGesture(gesture_param_id) end

---@param decrease_rate number
---@param soul_amount_save_slot_id number
function glint.emevd.ReduceBloodstainSouls(decrease_rate, soul_amount_save_slot_id) end

---@param entity_id number
---@param fixed_increase_amount number
---@param soul_amount_load_slot_id number
function glint.emevd.IncreaseEnemySoulDropAmount(entity_id, fixed_increase_amount, soul_amount_load_slot_id) end

---@param success boolean
function glint.emevd.IssueEndOfPseudoMultiplayerNotification(success) end

---@param far_view_id number
---@param asset_entity_id number
---@param dummypoly_id number
function glint.emevd.UseFarViewCamera(far_view_id, asset_entity_id, dummypoly_id) end

---@param state number
---@param aboveground boolean
---@param area_id number
---@param block_id number
---@param region_id number
---@param index_id number
---@param x number
---@param y number
---@param z number
function glint.emevd.SetPlayerPositionDisplay(state, aboveground, area_id, block_id, region_id, index_id, x, y, z) end

---@param area_entity_id number
function glint.emevd.SetPsuedoMultiplayerReturnPosition(area_entity_id) end

---@param world_map_point_param_id number
---@param distance number
function glint.emevd.OpenWorldMapPoint(world_map_point_param_id, distance) end

---@param npc_entity_id number
function glint.emevd.SendNPCSummonHome(npc_entity_id) end

---@param gesture_param_id number
function glint.emevd.RemoveGesture(gesture_param_id) end

---@param npc_entity_id number
function glint.emevd.DeleteNPCSummonSign(npc_entity_id) end

-- Character

---@param entity_id number
---@param team_type number
function glint.emevd.SetCharacterTeamType(entity_id, team_type) end

---@param entity_id number
---@param should_receive_runes boolean
function glint.emevd.ForceCharacterDeath(entity_id, should_receive_runes) end

---@param entity_id number
---@param command number
---@param slot number
function glint.emevd.EzstateInstructionRequest(entity_id, command, slot) end

---@param entity_id number
function glint.emevd.CreateBulletOwner(entity_id) end

---@param entity_id number
---@param sp_effect_id number
function glint.emevd.SetSpEffect(entity_id, sp_effect_id) end

---@param entity_id number
---@param entity_id_2 number
function glint.emevd.SetCharacterEventTarget(entity_id, entity_id_2) end

---@param entity_id number
---@param area_entity_id number
function glint.emevd.SetCharacterHome(entity_id, area_entity_id) end

---@param entity_id number
---@param relative_entity_id number
---@param animation_id number
---@param should_wait_for_completion boolean
function glint.emevd.RotateCharacter(entity_id, relative_entity_id, animation_id, should_wait_for_completion) end

---@param entity_id number
function glint.emevd.ClearCharactersAITarget(entity_id) end

---@param entity_id number
---@param command_id number
---@param slot_number number
function glint.emevd.RequestCharacterAICommand(entity_id, command_id, slot_number) end

---@param entity_id number
---@param relative_entity_id number
---@param reaction_distance number
function glint.emevd.SetEventPoint(entity_id, relative_entity_id, reaction_distance) end

---@param entity_id number
---@param ai_id number
function glint.emevd.SetCharacterAIId(entity_id, ai_id) end

---@param entity_id number
function glint.emevd.RequestCharacterAIRePlan(entity_id) end

---@param entity_id number
---@param sp_effect_id number
function glint.emevd.ClearSpEffect(entity_id, sp_effect_id) end

---@param entity_id number
---@param npc_part_id number
---@param npc_part_group_idx number
---@param npc_part_hp number
---@param damage_correction number
---@param body_damage_compensation number
---@param is_invincible boolean
---@param start_in_stopped_state boolean
function glint.emevd.CreateNPCPart(entity_id, npc_part_id, npc_part_group_idx, npc_part_hp, damage_correction,
                                   body_damage_compensation, is_invincible, start_in_stopped_state)
end

---@param entity_id number
---@param npc_part_id number
---@param desired_hp number
---@param should_allow_hp_above_max_hp boolean
function glint.emevd.SetNPCPartHP(entity_id, npc_part_id, desired_hp, should_allow_hp_above_max_hp) end

---@param entity_id number
---@param npc_part_id number
---@param defense_material_se_id number
---@param defense_material_sfx_id number
---@param unknowna number
---@param unknownb number
---@param unknownc number
function glint.emevd.SetNPCPartSEAndSFX(entity_id, npc_part_id, defense_material_se_id, defense_material_sfx_id, unknowna,
                                        unknownb, unknownc)
end

---@param entity_id number
---@param npc_part_id number
---@param bullet_damage_multiplier number
function glint.emevd.SetNPCPartBulletDamageMultiplier(entity_id, npc_part_id, bullet_damage_multiplier) end

---@param entity_id number
---@param bit_number number
---@param switch_type number
function glint.emevd.ChangeCharacterDispmask(entity_id, bit_number, switch_type) end

---@param character_entity_id number
---@param bit_number number
---@param switch_type number
function glint.emevd.ChangeCharacterHitmask(character_entity_id, bit_number, switch_type) end

---@param entity_id number
---@param authority_level number
function glint.emevd.SetNetworkUpdateAuthority(entity_id, authority_level) end

---@param entity_id number
---@param removed boolean
function glint.emevd.SetCharacterBackreadState(entity_id, removed) end

---@param entity_id number
---@param disabled boolean
function glint.emevd.SetCharacterMaphit(entity_id, disabled) end

---@param source_entity_id number
---@param target_entity_id number
function glint.emevd.CreateReferredDamagePair(source_entity_id, target_entity_id) end

---@param entity_id number
---@param use_fixed_frequency boolean
---@param update_frequency number
function glint.emevd.SetNetworkUpdateRate(entity_id, use_fixed_frequency, update_frequency) end

---@param character_entity_id number
function glint.emevd.ForceCharacterTreasure(character_entity_id) end

---@param dummy number
function glint.emevd.BetrayCharactersCurrentCovenant(dummy) end

---@param entity_id number
---@param warp_entity_type number
---@param warp_destination_entity_id number
---@param dummypoly_id number
---@param warp_destination_hit_entity_id number
function glint.emevd.WarpCharacterAndSetFloor(entity_id, warp_entity_type, warp_destination_entity_id, dummypoly_id,
                                              warp_destination_hit_entity_id)
end

---@param entity_id number
---@param warp_entity_type number
---@param warp_destination_entity_id number
---@param dummypoly_id number
function glint.emevd.IssueShortWarpRequest(entity_id, warp_entity_type, warp_destination_entity_id, dummypoly_id) end

---@param entity_id number
---@param warp_entity_type number
---@param warp_destination_entity_id number
---@param dummypoly_id number
---@param entity_id_to_copy_floor_from number
function glint.emevd.WarpCharacterAndCopyFloor(entity_id, warp_entity_type, warp_destination_entity_id, dummypoly_id,
                                               entity_id_to_copy_floor_from)
end

---@param character_entity_id number
---@param state number
function glint.emevd.RequestCharacterAnimationReset(character_entity_id, state) end

function glint.emevd.BonfireLikeRecovery() end

---@param entity_id number
---@param bit_number number
---@param state_id number
function glint.emevd.ChangeCharactersCloth(entity_id, bit_number, state_id) end

---@param character_entity_id number
---@param patrol_information_entity_id number
function glint.emevd.ChangeCharacterPatrolBehavior(character_entity_id, patrol_information_entity_id) end

---@param character_param_id number
function glint.emevd.ChangeCharacter(character_param_id) end

---@param entity_id number
---@param range number
function glint.emevd.SetCharacterTalkRange(entity_id, range) end

---@param character_entity_id number
---@param caravan_asset_entity_id number
function glint.emevd.ConnectCharacterToCaravan(character_entity_id, caravan_asset_entity_id) end

---@param character_entity_id number
---@param distance number
function glint.emevd.SetCharacterEnableDistance(character_entity_id, distance) end

---@param source_character_entity_id number
---@param target_character_entity_id number
function glint.emevd.CopyPlayerCharacterData(source_character_entity_id, target_character_entity_id) end

---@param character_entity_id number
---@param dummypoly_id number
---@param asset_entity_id number
function glint.emevd.AttachAssetToCharacter(character_entity_id, dummypoly_id, asset_entity_id) end

---@param entity_id number
---@param warp_entity_type number
---@param warp_destination_entity_id number
---@param dummypoly_id number
---@param entity_id_to_copy_floor_from number
---@param use_bonfire_effect boolean
---@param reset_camera boolean
function glint.emevd.WarpCharacterAndCopyFloorWithFadeOut(entity_id, warp_entity_type, warp_destination_entity_id,
                                                          dummypoly_id, entity_id_to_copy_floor_from, use_bonfire_effect,
                                                          reset_camera)
end

---@param character_entity_id number
---@param override_slot number
---@param face_param_id number
function glint.emevd.SetCharacterFaceParamOverride(character_entity_id, override_slot, face_param_id) end

---@param fade_to_black_ratio number
---@param fade_to_black_time_s number
---@param freeze_player boolean
---@param freeze_player_delay_s number
function glint.emevd.FadeToBlack(fade_to_black_ratio, fade_to_black_time_s, freeze_player, freeze_player_delay_s) end

---@param pool_type number
---@param fallback_character_param_id number
---@param target_entity_id number
function glint.emevd.CopyCharacterDataFromOnlinePlayers(pool_type, fallback_character_param_id, target_entity_id) end

---@param pool_type number
---@param unknown number
function glint.emevd.RequestCharacterDataFromOnlinePlayers(pool_type, unknown) end

---@param pool_type number
function glint.emevd.SendCharacterDataToOnlinePlayers(pool_type) end

---@param character_entity_id number
function glint.emevd.ResetCharacterPosition(character_entity_id) end

---@param character_entity_id number
---@param flag_state number
function glint.emevd.SetSpecialStandbyEndedFlag(character_entity_id, flag_state) end

---@param opacity number
---@param fade_time_s number
---@param freeze_player boolean
---@param freeze_player_delay_s number
---@param red number
---@param green number
---@param blue number
function glint.emevd.FadeToColor(opacity, fade_time_s, freeze_player, freeze_player_delay_s, red, green, blue) end

-- Asset

---@param entity_id number
---@param slot_number number
function glint.emevd.RequestAssetDestruction(entity_id, slot_number) end

---@param entity_id number
function glint.emevd.RequestAssetRestoration(entity_id) end

---@param entity_id number
---@param obj_act_param_id number
---@param relative_target_idx number
function glint.emevd.InitializeObjAct(entity_id, obj_act_param_id, relative_target_idx) end

---@param target_asset_entity_id number
---@param animation_id number
function glint.emevd.ReproduceAssetAnimation(target_asset_entity_id, animation_id) end

---@param entity_id number
---@param slot_number number
function glint.emevd.ReproduceAssetDestruction(entity_id, slot_number) end

---@param event_flag_id number
---@param entity_id number
---@param dummypoly_id number
---@param behavior_id number
---@param target number
---@param radius number
---@param lifespan number
---@param repetition_time_s number
function glint.emevd.CreateDamagingAsset(event_flag_id, entity_id, dummypoly_id, behavior_id, target, radius, lifespan,
                                         repetition_time_s)
end

---@param entity_id number
---@param character_entity_id number
---@param dummypoly_id number
function glint.emevd.WarpAssetToCharacter(entity_id, character_entity_id, dummypoly_id) end

---@param event_flag_id number
function glint.emevd.DeleteAssetEvent(event_flag_id) end

---@param target_asset_entity_id number
function glint.emevd.RerollAssetTreasure(target_asset_entity_id) end

---@param caravan_asset_entity_id number
---@param character_entity_id number
function glint.emevd.AttachCaravanToController(caravan_asset_entity_id, character_entity_id) end

---@param child_asset_entity_id number
---@param parent_asset_entity_id number
---@param parent_dummypoly_id number
function glint.emevd.AttachAssetToAsset(child_asset_entity_id, parent_asset_entity_id, parent_dummypoly_id) end

---@param event_flag_id number
---@param entity_id number
---@param starting_dummypoly_id number
---@param ending_dummypoly_id number
---@param behavior_id number
---@param target number
---@param radius number
---@param lifespan number
---@param repetition_time_s number
function glint.emevd.CreateBigDamagingAsset(event_flag_id, entity_id, starting_dummypoly_id, ending_dummypoly_id,
                                            behavior_id, target, radius, lifespan, repetition_time_s)
end

-- SFX

---@param entity_id number
---@param only_delete_root boolean
function glint.emevd.DeleteMapSFX(entity_id, only_delete_root) end

---@param entity_id number
function glint.emevd.SpawnMapSFX(entity_id) end

---@param target_entity_type number
---@param entity_id number
---@param dummypoly_id number
---@param sfx_id number
function glint.emevd.SpawnOneshotSFX(target_entity_type, entity_id, dummypoly_id, sfx_id) end

---@param asset_entity_id number
---@param dummypoly_id number
---@param sfx_id number
function glint.emevd.CreateAssetFollowingSFX(asset_entity_id, dummypoly_id, sfx_id) end

---@param asset_entity_id number
---@param should_delete_root boolean
function glint.emevd.DeleteAssetFollowingSFX(asset_entity_id, should_delete_root) end

---@param wind_sfx_id number
function glint.emevd.SetWindSFX(wind_sfx_id) end

-- Message

---@param message_id number
---@param dialog_type number
---@param number_of_options number
---@param entity_id number
---@param display_distance number
function glint.emevd.DisplayGenericDialog(message_id, dialog_type, number_of_options, entity_id, display_distance) end

---@param banner_type number
function glint.emevd.DisplayBanner(banner_type) end

---@param message_id number
---@param pad_state number
function glint.emevd.DisplayStatusMessage(message_id, pad_state) end

---@param message_id number
function glint.emevd.DisplayBlinkingMessage(message_id) end

---@param message_id number
function glint.emevd.DisplayFullScreenMessage(message_id) end

---@param message_id number
---@param dialog_type number
---@param number_of_options number
---@param entity_id number
---@param display_distance number
---@param left_response_event_flag_id number
---@param right_response_event_flag_id number
---@param cancel_response_event_flag_id number
function glint.emevd.DisplayGenericDialogAndSetEventFlags(message_id, dialog_type, number_of_options, entity_id,
                                                          display_distance, left_response_event_flag_id,
                                                          right_response_event_flag_id, cancel_response_event_flag_id)
end

---@param message_id number
---@param priority number
---@param should_interrupt boolean
function glint.emevd.DisplayBlinkingMessageWithPriority(message_id, priority, should_interrupt) end

---@param message_id number
function glint.emevd.DisplaySubareaWelcomeMessage(message_id) end

---@param message_id number
function glint.emevd.DisplayAreaWelcomeMessage(message_id) end

---@param tutorial_param_id number
---@param unknown boolean
---@param unknown2 boolean
function glint.emevd.ShowTutorialPopup(tutorial_param_id, unknown, unknown2) end

---@param network_message_id number
---@param unknown boolean
function glint.emevd.DisplayNetworkMessage(network_message_id, unknown) end

-- Camera

---@param normal_camera_id number
---@param locked_camera_id number
function glint.emevd.ChangeCamera(normal_camera_id, locked_camera_id) end

---@param vibration_id number
---@param target_entity_type number
---@param entity_id number
---@param dummypoly_id number
---@param decay_start_distance number
---@param decay_end_distance number
function glint.emevd.SetCameraVibration(vibration_id, target_entity_type, entity_id, dummypoly_id, decay_start_distance,
                                        decay_end_distance)
end

---@param area_id number
---@param block_id number
---@param lockcam_slot_number number
function glint.emevd.SetLockcamSlotNumber(area_id, block_id, lockcam_slot_number) end

---@param x_angle number
---@param y_angle number
function glint.emevd.SetCameraAngle(x_angle, y_angle) end

-- Script

---@param disable_top_event_flag_id number
---@param disable_bottom_event_flag_id number
---@param entity_id number
function glint.emevd.RegisterLadder(disable_top_event_flag_id, disable_bottom_event_flag_id, entity_id) end

---@param event_flag_id number
---@param entity_id number
---@param reaction_distance number
---@param reaction_angle number
---@param set_standard_kindling_level number
---@param enemy_deactivation_distance number
function glint.emevd.RegisterBonfire(event_flag_id, entity_id, reaction_distance, reaction_angle,
                                     set_standard_kindling_level, enemy_deactivation_distance)
end

---@param entity_id number
function glint.emevd.ActivateMultiplayerDependantBuffs(entity_id) end

---@param dummy number
function glint.emevd.IssueBossRoomEntryNotification(dummy) end

---@param unknown number
function glint.emevd.SendInvadingPhantomsHome(unknown) end

---@param dummy number
function glint.emevd.SendAllPhantomsHome(dummy) end

---@param unknown number
function glint.emevd.SendAllPhantomsHomeAndUpdateServerPvpStats(unknown) end

-- Sound

---@param entity_id number
---@param sound_type number
---@param sound_id number
function glint.emevd.PlaySE(entity_id, sound_type, sound_id) end

---@param sound_type number
---@param unknown number
---@param is_suppression_active boolean
function glint.emevd.SuppressSE(sound_type, unknown, is_suppression_active) end

---@param bgm_boss_conv_param_id number
---@param state number
function glint.emevd.SetBossBGM(bgm_boss_conv_param_id, state) end

---@param time_s number
function glint.emevd.SuppressSoundForFogGate(time_s) end

---@param npc_threat_level number
---@param heat_up boolean
function glint.emevd.SetFieldBattleBGMHeatUp(npc_threat_level, heat_up) end

-- Map

---@param gparam_sub_id number
---@param change_time_s number
function glint.emevd.ActivateGparamOverride(gparam_sub_id, change_time_s) end

---@param change_time_s number
function glint.emevd.DeactivateGparamOverride(change_time_s) end

-- System

function glint.emevd.EnableNetworkSync() end

function glint.emevd.DisableNetworkSync() end

-- Event

---@param generator_entity_id number
function glint.emevd.EnableGenerator(generator_entity_id) end

---@param generator_entity_id number
function glint.emevd.DisableGenerator(generator_entity_id) end

---@param entity_id number
function glint.emevd.EnableMapHit(entity_id) end

---@param entity_id number
function glint.emevd.DisableMapHit(entity_id) end

---@param entity_id number
function glint.emevd.EnableMapVisibility(entity_id) end

---@param entity_id number
function glint.emevd.DisableMapVisibility(entity_id) end

---@param message_entity_id number
function glint.emevd.EnableMessageVisibility(message_entity_id) end

---@param message_entity_id number
function glint.emevd.DisableMessageVisibility(message_entity_id) end

function glint.emevd.EnableDirectionDisplay() end

function glint.emevd.DisableDirectionDisplay() end

function glint.emevd.EnableTextOnLoadingScreen() end

function glint.emevd.DisableTextOnLoadingScreen() end

-- Character

---@param entity_id number
function glint.emevd.EnableCharacterAI(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterAI(entity_id) end

---@param character_entity_id number
function glint.emevd.EnableCharacter(character_entity_id) end

---@param character_entity_id number
function glint.emevd.DisableCharacter(character_entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterGravity(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterGravity(entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterImmortality(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterImmortality(entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterInvincibility(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterInvincibility(entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterHPBarDisplay(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterHPBarDisplay(entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterDefaultBackread(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterDefaultBackread(entity_id) end

---@param entity_id number
function glint.emevd.EnableCharacterCollision(entity_id) end

---@param entity_id number
function glint.emevd.DisableCharacterCollision(entity_id) end

---@param entity_id number
---@param lock_on_dummypoly_id number
function glint.emevd.EnableLockOnPoint(entity_id, lock_on_dummypoly_id) end

---@param entity_id number
---@param lock_on_dummypoly_id number
function glint.emevd.DisableLockOnPoint(entity_id, lock_on_dummypoly_id) end

---@param character_entity_id number
function glint.emevd.EnableCharacterDisableOnHitUnload(character_entity_id) end

---@param character_entity_id number
function glint.emevd.DisableCharacterDisableOnHitUnload(character_entity_id) end

---@param character_entity_id number
function glint.emevd.EnableDistanceBasedNetworkUpdateAuthority(character_entity_id) end

---@param character_entity_id number
function glint.emevd.DisableDistanceBasedNetworkUpdateAuthority(character_entity_id) end

---@param character_entity_id number
function glint.emevd.EnableCharacterFadeOnEnable(character_entity_id) end

---@param character_entity_id number
function glint.emevd.DisableCharacterFadeOnEnable(character_entity_id) end

-- Asset

---@param target_asset_entity_id number
function glint.emevd.EnableAsset(target_asset_entity_id) end

---@param target_asset_entity_id number
function glint.emevd.DisableAsset(target_asset_entity_id) end

---@param target_asset_entity_id number
function glint.emevd.EnableAssetTreasure(target_asset_entity_id) end

---@param target_asset_entity_id number
function glint.emevd.DisableAssetTreasure(target_asset_entity_id) end

---@param entity_id number
---@param obj_act_param_id number
function glint.emevd.EnableObjAct(entity_id, obj_act_param_id) end

---@param entity_id number
---@param obj_act_param_id number
function glint.emevd.DisableObjAct(entity_id, obj_act_param_id) end

---@param target_asset_entity_id number
function glint.emevd.EnableAssetInvulnerability(target_asset_entity_id) end

---@param target_asset_entity_id number
function glint.emevd.DisableAssetInvulnerability(target_asset_entity_id) end

---@param entity_id number
---@param obj_act_param_id number
---@param relative_target_idx number
function glint.emevd.EnableObjActAssignIdx(entity_id, obj_act_param_id, relative_target_idx) end

---@param entity_id number
---@param obj_act_param_id number
---@param relative_target_idx number
function glint.emevd.DisableObjActAssignIdx(entity_id, obj_act_param_id, relative_target_idx) end

-- Hit

---@param hit_entity_id number
function glint.emevd.EnableHit(hit_entity_id) end

---@param hit_entity_id number
function glint.emevd.DisableHit(hit_entity_id) end

---@param hit_entity_id number
function glint.emevd.EnableHitBackreadMask(hit_entity_id) end

---@param hit_entity_id number
function glint.emevd.DisableHitBackreadMask(hit_entity_id) end

---@param hit_entity_id number
function glint.emevd.EnableHitres(hit_entity_id) end

---@param hit_entity_id number
function glint.emevd.DisableHitres(hit_entity_id) end

-- Map

---@param map_part_entity_id number
function glint.emevd.EnableMapPart(map_part_entity_id) end

---@param map_part_entity_id number
function glint.emevd.DisableMapPart(map_part_entity_id) end

function glint.emevd.EnableAreaWelcomeMessage() end

function glint.emevd.DisableAreaWelcomeMessage() end

-- Condition - Timer

---@param hours number
---@param minutes number
---@param seconds number
---@return boolean
function glint.emevd.TimeOfDay(hours, minutes, seconds) end

---@param starting_hours number
---@param starting_minutes number
---@param starting_seconds number
---@param ending_hours number
---@param ending_minutes number
---@param ending_seconds number
---@return boolean
function glint.emevd.TimeOfDayInRange(starting_hours, starting_minutes, starting_seconds, ending_hours, ending_minutes,
                                      ending_seconds)
end

-- Condition - Event

---@param desired_flag_state number
---@param target_event_flag_type number
---@param target_event_flag_id number
---@return boolean
function glint.emevd.EventFlag(desired_flag_state, target_event_flag_type, target_event_flag_id) end

---@param desired_flag_state number
---@param target_event_flag_type number
---@param starting_target_event_flag_id number
---@param ending_target_event_flag_id number
---@return boolean
function glint.emevd.BatchEventFlags(desired_flag_state, target_event_flag_type, starting_target_event_flag_id,
                                     ending_target_event_flag_id)
end

---@param desired_state number
---@param target_entity_id number
---@param area_entity_id number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.InOutsideArea(desired_state, target_entity_id, area_entity_id, number_of_target_characters) end

---@param desired_state number
---@param target_entity_id_a number
---@param target_entity_id_b number
---@param target_distance number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.EntityInOutsideRadiusOfEntity(desired_state, target_entity_id_a, target_entity_id_b, target_distance,
                                                   number_of_target_characters)
end

---@param item_type number
---@param item_id number
---@param desired_possession_state number
---@return boolean
function glint.emevd.PlayerHasDoesntHaveItem(item_type, item_id, desired_possession_state) end

---@param desired_multiplayer_state number
---@return boolean
function glint.emevd.MultiplayerState(desired_multiplayer_state) end

---@param desired_state number
---@param area_entity_id number
---@return boolean
function glint.emevd.AllPlayersInOutsideArea(desired_state, area_entity_id) end

---@param should_player_be_inside boolean
---@param area_id number
---@param block_id number
---@param region_id number
---@param index_id number
---@return boolean
function glint.emevd.PlayerInOutMap(should_player_be_inside, area_id, block_id, region_id, index_id) end

---@param multiplayer_event_id number
---@return boolean
function glint.emevd.MultiplayerEvent(multiplayer_event_id) end

---@param target_event_flag_type number
---@param starting_target_event_flag_id number
---@param ending_target_event_flag_id number
---@param comparison_type number
---@param count_threshold number
---@return boolean
function glint.emevd.CountEventFlags(target_event_flag_type, starting_target_event_flag_id, ending_target_event_flag_id,
                                     comparison_type, count_threshold)
end

---@param base_event_flag_id number
---@param number_of_used_flag_bits number
---@param comparison_type number
---@param threshold_value number
---@return boolean
function glint.emevd.EventValue(base_event_flag_id, number_of_used_flag_bits, comparison_type, threshold_value) end

---@param area_entity_id number
---@return boolean
function glint.emevd.DroppedItemsInArea(area_entity_id) end

---@param item_type number
---@param item_id number
---@return boolean
function glint.emevd.DroppedItem(item_type, item_id) end

---@param item_type number
---@param item_id number
---@param desired_possession_state number
---@return boolean
function glint.emevd.PlayerHasDoesntHaveItemIncludingBbox(item_type, item_id, desired_possession_state) end

---@param comparison_type number
---@param completed_game_cycles_threshold number
---@return boolean
function glint.emevd.GameCycle(comparison_type, completed_game_cycles_threshold) end

---@param left_side_base_event_flag_id number
---@param left_side_number_of_used_flag_bits number
---@param comparison_type number
---@param right_side_base_event_flag_id number
---@param right_side_number_of_used_flag_bits number
---@return boolean
function glint.emevd.CompareEventValues(left_side_base_event_flag_id, left_side_number_of_used_flag_bits, comparison_type,
                                        right_side_base_event_flag_id, right_side_number_of_used_flag_bits)
end

---@param online_mode boolean
---@return boolean
function glint.emevd.OnlineMode(online_mode) end

---@param target_entity_id number
---@param attacker_entity_id number
---@param damage_type number
---@return boolean
function glint.emevd.DamageType(target_entity_id, attacker_entity_id, damage_type) end

---@param action_button_parameter_id number
---@param target_entity_id number
---@return boolean
function glint.emevd.ActionButtonInArea(action_button_parameter_id, target_entity_id) end

---@param world_type number
---@return boolean
function glint.emevd.PlayerIsInWorldType(world_type) end

---@param area_id number
---@param block_id number
---@param region_id number
---@param index_id number
---@return boolean
function glint.emevd.MapLoaded(area_id, block_id, region_id, index_id) end

---@param weather number
---@param start_delay_during_change_s number
---@param end_delay_during_change_s number
---@return boolean
function glint.emevd.WeatherActive(weather, start_delay_during_change_s, end_delay_during_change_s) end

---@param has_permission boolean
---@param unknown boolean
---@param area_id number
---@param block_id number
---@param region_id number
---@param index_id number
---@return boolean
function glint.emevd.MapHasPermissionToUpdate(has_permission, unknown, area_id, block_id, region_id, index_id) end

---@param npc_threat_level number
---@param is_active boolean
---@return boolean
function glint.emevd.FieldBattleBGMActive(npc_threat_level, is_active) end

---@param armor_type number
---@param armor_item_id number
---@param unknown number
---@return boolean
function glint.emevd.PlayerHasArmorEquipped(armor_type, armor_item_id, unknown) end

---@param is_active boolean
---@param ceremony_id number
---@return boolean
function glint.emevd.CeremonyActive(is_active, ceremony_id) end

---@param weather_lot_param_id number
---@param is_active boolean
---@return boolean
function glint.emevd.WeatherLotActive(weather_lot_param_id, is_active) end

---@param gender number
---@return boolean
function glint.emevd.PlayerGender(gender) end

---@param ready boolean
---@return boolean
function glint.emevd.ArenaMatchReadyState(ready) end

---@param result number
---@return boolean
function glint.emevd.ArenaSoloResults(result) end

---@param comparison_type number
---@param target_score number
---@return boolean
function glint.emevd.ArenaSoloScoreComparison(comparison_type, target_score) end

---@param result number
---@return boolean
function glint.emevd.ArenaTeamResults(result) end

---@param comparison_type number
---@param target_score number
---@return boolean
function glint.emevd.ArenaTeamScoreComparison(comparison_type, target_score) end

---@param match_type number
---@param has_spirit_summon boolean
---@return boolean
function glint.emevd.ArenaMatchType(match_type, has_spirit_summon) end

---@return boolean
function glint.emevd.PlayerRespawnedInArena() end

---@param tutorial_param_id number
---@return boolean
function glint.emevd.TutorialSeen(tutorial_param_id) end

-- Condition - Character

---@param target_entity_id number
---@param desired_life_state number
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterDeadAlive(target_entity_id, desired_life_state, comparison_type,
                                        number_of_target_characters)
end

---@param target_entity_id number
---@param comparison_type number
---@param target_hp_ratio number
---@param comparison_type2 number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterHPRatio(target_entity_id, comparison_type, target_hp_ratio, comparison_type2,
                                      number_of_target_characters)
end

---@param target_entity_id number
---@param target_type number
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterType(target_entity_id, target_type, comparison_type, number_of_target_characters) end

---@param aggressor_entity_id number
---@param target_entity_id number
---@param should_have boolean
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterTargetedBy(aggressor_entity_id, target_entity_id, should_have, comparison_type,
                                         number_of_target_characters)
end

---@param target_entity_id number
---@param sp_effect_id number
---@param should_have boolean
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterHasSpEffect(target_entity_id, sp_effect_id, should_have, comparison_type,
                                          number_of_target_characters)
end

---@param target_entity_id number
---@param npc_part_id number
---@param hp_threshold number
---@param comparison_type number
---@return boolean
function glint.emevd.NPCPartHP(target_entity_id, npc_part_id, hp_threshold, comparison_type) end

---@param target_entity_id number
---@param is_backread boolean
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterBackreadStatus(target_entity_id, is_backread, comparison_type, number_of_target_characters) end

---@param target_entity_id number
---@param target_event_message_id number
---@param should_have boolean
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterHasEventMessage(target_entity_id, target_event_message_id, should_have, comparison_type,
                                              number_of_target_characters)
end

---@param target_entity_id number
---@param ai_state number
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterAIState(target_entity_id, ai_state, comparison_type, number_of_target_characters) end

---@param class_type number
---@return boolean
function glint.emevd.PlayersClass(class_type) end

---@param covenant_index number
---@return boolean
function glint.emevd.PlayersCovenant(covenant_index) end

---@param comparison_type number
---@param target_soul_level number
---@return boolean
function glint.emevd.PlayersSoulLevel(comparison_type, target_soul_level) end

---@param target_entity_id number
---@param comparison_type number
---@param target_hp number
---@param comparison_type2 number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterHPValue(target_entity_id, comparison_type, target_hp, comparison_type2,
                                      number_of_target_characters)
end

---@param target_entity_id number
---@param desired_life_state number
---@param comparison_type number
---@param target_ratio number
---@return boolean
function glint.emevd.CharacterRatioDeadAlive(target_entity_id, desired_life_state, comparison_type, target_ratio) end

---@param target_entity_id number
---@param comparison_type number
---@param target_amount number
---@param comparison_type2 number
---@param target_ratio number
---@return boolean
function glint.emevd.CharacterRatioHPRatio(target_entity_id, comparison_type, target_amount, comparison_type2,
                                           target_ratio)
end

---@param target_entity_id number
---@param sp_effect_id number
---@param should_have boolean
---@param comparison_type number
---@param target_ratio number
---@return boolean
function glint.emevd.CharacterRatioHasSpEffect(target_entity_id, sp_effect_id, should_have, comparison_type, target_ratio) end

---@param target_entity_id number
---@param ai_state number
---@param comparison_type number
---@param target_ratio number
---@return boolean
function glint.emevd.CharacterRatioAIState(target_entity_id, ai_state, comparison_type, target_ratio) end

---@param min_npc_threat_level number
---@param max_npc_threat_level number
---@param ai_state_type number
---@return boolean
function glint.emevd.PlayerTargeted(min_npc_threat_level, max_npc_threat_level, ai_state_type) end

---@param target_entity_id number
---@param npc_part_id number
---@param attacker_entity_id number
---@param damage_type number
---@return boolean
function glint.emevd.NPCPartAttributeDamage(target_entity_id, npc_part_id, attacker_entity_id, damage_type) end

---@param target_entity_id number
---@param invade_type_unknown number
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterInvadeType(target_entity_id, invade_type_unknown, comparison_type,
                                         number_of_target_characters)
end

---@param target_entity_id number
---@param is_mounted boolean
---@return boolean
function glint.emevd.CharacterRidingMount(target_entity_id, is_mounted) end

---@param target_entity_id number
---@param state_info number
---@param should_have boolean
---@param comparison_type number
---@param number_of_target_characters number
---@return boolean
function glint.emevd.CharacterHasStateInfo(target_entity_id, state_info, should_have, comparison_type,
                                           number_of_target_characters)
end

---@param target_entity_id number
---@param desired_flag_state number
---@return boolean
function glint.emevd.SpecialStandbyEndedFlag(target_entity_id, desired_flag_state) end

-- Condition - Asset

---@param damage_state number
---@param target_asset_entity_id number
---@param comparison_type number
---@param number_of_target_assets number
---@return boolean
function glint.emevd.AssetDestroyed(damage_state, target_asset_entity_id, comparison_type, number_of_target_assets) end

---@param target_entity_id number
---@param attacker_entity_id number
---@return boolean
function glint.emevd.AssetHitBy(target_entity_id, attacker_entity_id) end

---@param obj_act_event_flag number
---@return boolean
function glint.emevd.ObjActEventFlag(obj_act_event_flag) end

---@param target_entity_id number
---@param comparison_type number
---@param hp_threshold number
---@param comparison_type2 number
---@param number_of_target_assets number
---@return boolean
function glint.emevd.AssetHP(target_entity_id, comparison_type, hp_threshold, comparison_type2, number_of_target_assets) end

---@param damage_state number
---@param target_entity_id number
---@param comparison_type number
---@param target_ratio number
---@return boolean
function glint.emevd.AssetRatioDestroyed(damage_state, target_entity_id, comparison_type, target_ratio) end

---@param target_entity_id number
---@param comparison_type number
---@param burn_state_unknown number
---@param comparison_type2 number
---@param number_of_target_assets number
---@return boolean
function glint.emevd.AssetBurnState(target_entity_id, comparison_type, burn_state_unknown, comparison_type2,
                                    number_of_target_assets)
end

---@param target_entity_id number
---@param is_backread boolean
---@param comparison_type number
---@param number_of_target_assets number
---@return boolean
function glint.emevd.AssetBackread(target_entity_id, is_backread, comparison_type, number_of_target_assets) end

---@param target_entity_id number
---@param is_backread boolean
---@param comparison_type number
---@param target_ratio number
---@return boolean
function glint.emevd.AssetRatioBackread(target_entity_id, is_backread, comparison_type, target_ratio) end

-- Condition - Hit

---@param hit_entity_id number
---@return boolean
function glint.emevd.PlayerMovingOnHit(hit_entity_id) end

---@param hit_entity_id number
---@return boolean
function glint.emevd.PlayerAttackingOnHit(hit_entity_id) end

---@param hit_entity_id number
---@return boolean
function glint.emevd.PlayerStandingOnHit(hit_entity_id) end

---@param hit_entity_id number
---@return boolean
function glint.emevd.PlayerStandingOnHitGroup(hit_entity_id) end
