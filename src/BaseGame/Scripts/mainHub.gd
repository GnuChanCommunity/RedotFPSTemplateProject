extends Node3D

var EnergyReadyArea = false
var FusionStartArea = false
var StartEngineFusion = false
var SettingsArea = false
var PortalEnter = false
var DoorArea = false
var DoorOpen = false

# Energy material preloads
var EnergyReayMaterial_0 = preload("res://BaseGame/3D/HUB/fusion_ready_0.tres")
var EnergyReayMaterial_1 = preload("res://BaseGame/3D/HUB/fusion_ready_1.tres")
var EnergyReayMaterial_2 = preload("res://BaseGame/3D/HUB/fusion_ready_2.tres")

var SpaceScaneTime = randf()
var ScanPositionR0 = randf_range(-0.5, 0.5)
var ScanPositionR1 = randf_range(-0.5, 0.5)
var ScanPositionR2 = randf_range(-0.5, 0.5)
var ScanPositionR3 = randf_range(-0.5, 0.5)

var PortalEnergy = preload("res://BaseGame/3D/HUB/teleportEnergy.tres")

var TalkNow_bool = false

# talk settings
@onready var talk_streamer: TalkStreamer = TalkStreamer.new()

var TalkStart = false
var hello = false
var name_ = false
var welcome = false
var TalkEnd = false


func _ready() -> void:
	add_child(talk_streamer)
	if $GC/talk is AudioStreamPlayer3D:
		talk_streamer.sound_resource = $GC/talk
	else:
		printerr("Error: $GC/talk is not an AudioStreamPlayer3D or not found. TalkStreamer will not play sounds.")

	$idl0.play()
	$idl1.play()
	EnergyReayMaterial_0.emission_enabled = false
	EnergyReayMaterial_1.emission_enabled = false
	EnergyReayMaterial_2.emission_enabled = false
	
	PortalEnergy.emission_enabled = false
	$lights.hide()
	$portal_enter/portal_door/AnimationPlayer.play("PortalDoorOpen")
	$portal_enter/PDoorOpenSound.play()
	$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled", true)
	$GC/gcAnim.play("FirtTalk")
	GLobalVar.walkNow = true
	GLobalVar.PlayerSettings["CanWalk"] = false
	GLobalVar.PlayerSettings["CanJump"] = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$fps/effect/name.grab_focus()
	$pcArea/pcCAM/UI.visible = false

func _rotatePosition():
	if not GLobalVar.PlayerSettings["GiveLife"]:
		$GC.look_at($fps.global_transform.origin)

func _GiveLife():
	if Input.is_action_just_pressed("l"):
		if not GLobalVar.PlayerSettings["GiveLife"] and not GLobalVar.firstLoading:
			GLobalVar.PlayerSettings["GiveLife"] = true
		else: 
			GLobalVar.PlayerSettings["GiveLife"] = false

func _EnergyStatusRotate(delta):
	$Cardis/energyDC/rotate.rotate_y(5 * delta)

# Energy Ready X3
func _EnergyReadyArea():
	if Input.is_action_just_pressed("left_m"):
		if EnergyReadyArea and not GLobalVar.FusionReady:
			if $fps/head/standCam/hitRay.is_colliding():
				var hit = $fps/head/standCam/hitRay.get_collider()
				if hit.name == "EnergyReady0":
					if not GLobalVar.EnergyReady0:
						$EnergyReadyArea/EnergyReady0/ready0Anim.play("ready0")
					else:
						$EnergyReadyArea/EnergyReady0/ready0Anim.play_backwards("ready0")
				elif hit.name == "EnergyReady1":
					if not GLobalVar.EnergyReady1:
						$EnergyReadyArea/EnergyReady1/ready1Anim.play("ready1")
					else:
						$EnergyReadyArea/EnergyReady1/ready1Anim.play_backwards("ready1")
				elif hit.name == "EnergyReady2":
					if not GLobalVar.EnergyReady2:
						$EnergyReadyArea/EnergyReady2/ready2Anim.play("ready2")
					else:
						$EnergyReadyArea/EnergyReady2/ready2Anim.play_backwards("ready2")

func _on_ready_0_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready0":
		if not GLobalVar.EnergyReady0:
			GLobalVar.EnergyReady0 = true
			EnergyReayMaterial_0.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady0 = false
			EnergyReayMaterial_0.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()

func _on_ready_1_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready1":
		if not GLobalVar.EnergyReady1:
			GLobalVar.EnergyReady1 = true
			EnergyReayMaterial_1.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady1 = false
			EnergyReayMaterial_1.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()

func _on_ready_2_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready2":
		if not GLobalVar.EnergyReady2:
			GLobalVar.EnergyReady2 = true
			EnergyReayMaterial_2.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady2 = false
			EnergyReayMaterial_2.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()

# Fusion Start
func _handle_fusion_start_panel():
	if Input.is_action_just_pressed("left_m"):
		if FusionStartArea and not GLobalVar.EngineReady:
			if GLobalVar.EnergyReady0 and GLobalVar.EnergyReady1 and GLobalVar.EnergyReady2:
				if not GLobalVar.FusionReady:
					$FusionStartArea/fsAnim.play("fsStart")
					$FusionStartArea/FsStart.play()
				else:
					$FusionStartArea/fsAnim.play_backwards("fsStart")
					$FusionStartArea/FsClose.play()

func _animate_space_map_rotors(delta):
	if GLobalVar.FusionReady:
		if SpaceScaneTime > 0:
			SpaceScaneTime -= delta
		else:
			SpaceScaneTime = randf()
			ScanPositionR0 = randf_range(-0.5, 0.5)
			ScanPositionR1 = randf_range(-0.5, 0.5)
			ScanPositionR2 = randf_range(-0.5, 0.5)
			ScanPositionR3 = randf_range(-0.5, 0.5)
		
		$Cardis/r0.rotate_y(ScanPositionR0 * delta)
		$Cardis/r1.rotate_y(ScanPositionR1 * delta)
		$Cardis/r2.rotate_y(ScanPositionR2 * delta)
		$Cardis/r3.rotate_y(ScanPositionR3 * delta)

func _on_fs_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fsStart":
		if not GLobalVar.FusionReady:
			GLobalVar.FusionReady = true
			$lights.show()
		else:
			GLobalVar.FusionReady = false
			$lights.hide()

# Start Engine
func _handle_engine_start_panel_interaction():
	if Input.is_action_just_pressed("left_m"):
		if GLobalVar.FusionReady:
			if StartEngineFusion:
				if not GLobalVar.EngineReady:
					$StartEgineFusion/SEFAnim.play("EngineStart")
					$StartEgineFusion/SEFSound_open.play()
				else:
					$StartEgineFusion/SEFAnim.play_backwards("EngineStart")
					$StartEgineFusion/SEFSound_close.play()
		
		# Bu if bloğu dışarıda olmalı gibi duruyor, FusionReady kontrolü olmadan da çalışabilir mi?
		# Orijinal mantığa sadık kalındı.
		if GLobalVar.EngineReady:
			$Cardis/AnimationPlayer.play("1_energy_ready")
			$Cardis/centerObject/COAnim.play("dik")

func _on_sef_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "EngineStart":
		if not GLobalVar.EngineReady:
			GLobalVar.EngineReady = true
		else:
			GLobalVar.EngineReady = false

# Door
func _handle_cardis_door_interaction():
	if Input.is_action_just_pressed("left_m"):
		if not DoorOpen and DoorArea:
			$Cardis/Cardis_portable/AnimationPlayer.play("doorAction")
			$DoorArea/Open.play()
			DoorOpen = true
		elif DoorOpen and DoorArea:
			$Cardis/Cardis_portable/AnimationPlayer.play_backwards("doorAction")
			$DoorArea/Close.play()
			DoorOpen = false

# Handle conversation and portal transition
func _process_gc_conversation_and_level_change():
	if GLobalVar.EngineReady:
		if TalkStart:
			# Handle greeting
			if not hello:
				talk_streamer.play_sound("hi")
				hello = true
			
			# Handle name if greeting is done and sound is not playing
			if talk_streamer.sound_resource and not talk_streamer.sound_resource.playing and hello and not name_:
				var player_name = GLobalVar.PlayerSettings["Name"].to_lower()
				talk_streamer.play_name(player_name)
				name_ = true
			
			# Handle welcome message after name and sound is not playing
			if talk_streamer.sound_resource and not talk_streamer.sound_resource.playing and hello and name_ and not welcome:
				talk_streamer.play_sound("welcome")
				welcome = true
			
			# Handle final message and sound is not playing
			if talk_streamer.sound_resource and not talk_streamer.sound_resource.playing and hello and name_ and welcome and not TalkEnd:
				talk_streamer.play_sound("lastTalk")
				TalkEnd = true
	
	# Change scene when talk is completed and sound is not playing
	if TalkEnd and talk_streamer.sound_resource and not talk_streamer.sound_resource.playing:
		get_tree().change_scene_to_file("res://MainGame/Scene/main_gaym.tscn")

var PlayFirstTalkWalk = false
func _on_portal_ready_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Ready":
		if not PlayFirstTalkWalk:
			PortalEnergy.emission_enabled = true
			$GC/gcAnim.play("TalkStart")
			PlayFirstTalkWalk = true
			GLobalVar.walkNow = true # Bu satır orijinalde de vardı, mantığını kontrol edin.

func _on_gc_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "TalkStart":
		TalkStart = true
		GLobalVar.walkNow = false
	if anim_name == "FirtTalk":
		GLobalVar.walkNow = false

func _handle_settings_panel_interaction():
	if Input.is_action_just_pressed("left_m"):
		if SettingsArea:
			if $fps/head/standCam/hitRay.is_colliding():
				var hit = $fps/head/standCam/hitRay.get_collider()
				match hit.name:
					"ST0":
						GLobalVar.settings0 = not GLobalVar.settings0
						$Settings/ST0/Anim_ST0.play("open0" if GLobalVar.settings0 else &"open0_reverse")
						if not GLobalVar.settings0: $Settings/ST0/Anim_ST0.play_backwards("open0") # Alternatif
					"ST1":
						GLobalVar.settings1 = not GLobalVar.settings1
						$Settings/ST1/Anim_ST1.play("open1" if GLobalVar.settings1 else &"open1_reverse")
						if not GLobalVar.settings1: $Settings/ST1/Anim_ST1.play_backwards("open1")
					"ST2":
						GLobalVar.settings2 = not GLobalVar.settings2
						$Settings/ST2/Anim_ST2.play("open2" if GLobalVar.settings2 else &"open2_reverse")
						if not GLobalVar.settings2: $Settings/ST2/Anim_ST2.play_backwards("open2")
					"ST3":
						GLobalVar.settings3 = not GLobalVar.settings3
						$Settings/ST3/Anim_ST3.play("open3" if GLobalVar.settings3 else &"open3_reverse")
						if not GLobalVar.settings3: $Settings/ST3/Anim_ST3.play_backwards("open3")
					"ST4":
						GLobalVar.settings4 = not GLobalVar.settings4
						$Settings/ST4/Anim_ST4.play("open4" if GLobalVar.settings4 else &"open4_reverse")
						if not GLobalVar.settings4: $Settings/ST4/Anim_ST4.play_backwards("open4")
					"ST5":
						GLobalVar.settings5 = not GLobalVar.settings5
						$Settings/ST5/Anim_ST5.play("open5" if GLobalVar.settings5 else &"open5_reverse")
						if not GLobalVar.settings5: $Settings/ST5/Anim_ST5.play_backwards("open5")
					"ST6":
						GLobalVar.settings6 = not GLobalVar.settings6
						$Settings/ST6/Anim_ST6.play("open6" if GLobalVar.settings6 else &"open6_reverse")
						if not GLobalVar.settings6: $Settings/ST6/Anim_ST6.play_backwards("open6")


func _handle_gc_direkct_interaction():
	if $fps/head/standCam/hitRay.is_colliding():
		var hit = $fps/head/standCam/hitRay.get_collider()
		
		if Input.is_action_just_pressed("left_m"):
			if "GC" == hit.name:
				if TalkNow_bool:
					if GLobalVar.FusionReady:
						GLobalVar.PlayerSettings["CanWalk"] = false
						GLobalVar.PlayerSettings["OpenConsole"] = true
						GLobalVar.PlayerSettings["talkMode"] = true
						$fps/hud/consoleWin.show()
						Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
						$fps/hud/consoleWin/ScrollContainer/VBoxContainer/input.grab_focus()
					else:
						if talk_streamer.sound_resource and not talk_streamer.sound_resource.playing:
							talk_streamer.play_sound("openLight")

# Radio
var radioOpen = true
var music = true 
func _handle_radio_controls():
	if Input.is_action_just_pressed("left_m"):
		if $fps/head/standCam/hitRay.is_colliding():
			var hit = $fps/head/standCam/hitRay.get_collider()
			if "radiox" == hit.name:
				radioOpen = not radioOpen
				if radioOpen:
					$Cardis/RadioX/music.play()
				else:
					$Cardis/RadioX/music.stop()
	if music and radioOpen: 
		if not $Cardis/RadioX/music.playing:
			$Cardis/RadioX/music.play()

# PC
var PcArea = false
var animFinish = false
func _handle_pc_usage():
	if Input.is_action_just_pressed("left_m"):
		if PcArea and GLobalVar.FusionReady: 
			if not animFinish: 
				if not GLobalVar.PlayerSettings["UsingPC"]:
					GLobalVar.PlayerSettings["UsingPC"] = true
					$pcArea/pcCAM/camAnim.play("animFinish")
					$pcArea/pcCAM.current = true
					animFinish = true
				else:
					GLobalVar.PlayerSettings["UsingPC"] = false
					$pcArea/pcCAM/camAnim.play_backwards("animFinish")
					animFinish = true
					# UI'ı hemen gizle, animasyon bitince değil.
					# $pcArea/pcCAM/UI.visible = false # Bu _on_cam_anim_animation_finished içinde yönetiliyor.


func _on_cam_anim_animation_finished(anim_name: StringName) -> void:
	animFinish = false 
	if anim_name == "animFinish": 
		if GLobalVar.PlayerSettings["UsingPC"]: 
			$pcArea/pcCAM/UI.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if not GLobalVar.PlayerSettings["UsingPC"]:
		$fps/head/standCam.current = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
		$pcArea/pcCAM/UI.visible = false


# Sleep timer
var sleepOver = false
var sleepTime = 2

func _process(delta: float) -> void:
	_GiveLife()
	_EnergyStatusRotate(delta)
	_EnergyReadyArea()
	_handle_fusion_start_panel()
	_animate_space_map_rotors(delta)
	_handle_engine_start_panel_interaction()
	_handle_cardis_door_interaction()
	_process_gc_conversation_and_level_change()
	_handle_settings_panel_interaction()
	_handle_gc_direkct_interaction()
	_rotatePosition()
	_handle_radio_controls()
	_handle_pc_usage()
	
	if not sleepOver:
		if sleepTime > 0:
			sleepTime -= delta
		else:
			sleepOver = true
			$fps/sleep.visible = false

func _on_idl_0_finished() -> void:
	$idl0.play()

func _on_idl_1_finished() -> void:
	$idl1.play()

# Area Check
func _on_energy_ready_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		EnergyReadyArea = true

func _on_energy_ready_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		EnergyReadyArea = false

func _on_fusion_start_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		FusionStartArea = true

func _on_fusion_start_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		FusionStartArea = false

func _on_start_egine_fusion_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		StartEngineFusion = true

func _on_start_egine_fusion_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		StartEngineFusion = false

func _on_settings_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		SettingsArea = true

func _on_settings_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		SettingsArea = false

var PlayPortalAreaFirstTime = false
func _on_portal_enter_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		if GLobalVar.EngineReady:
			if not PlayPortalAreaFirstTime:
				$portal_enter/PortalEnergyLoading/PortalReady.play("Ready")
				$portal_enter/portal_door/AnimationPlayer.play_backwards("PortalDoorOpen")
				$portal_enter/PDoorOpenSound.play() 
				$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled", false)
				$portal_enter/PortalEnergyLoading/EnergyLoading.play()
				PlayPortalAreaFirstTime = true
				PortalEnter = true 

func _on_portal_enter_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		PortalEnter = false

func _on_door_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		DoorArea = true

func _on_door_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		DoorArea = false

func _on_talk_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		TalkNow_bool = true

func _on_talk_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		TalkNow_bool = false

func _on_pc_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		PcArea = true

func _on_pc_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		PcArea = false
