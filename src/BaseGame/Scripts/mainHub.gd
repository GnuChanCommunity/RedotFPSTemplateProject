extends Node3D

var EnergyReadyArea = false
var FusionStartArea = false
var StartEngineFusion = false
var SettingsArea = false
var PortalEnter = false
var DoorArea = false
var DoorOpen = false

var EnergyReayMaterial_0 = preload("res://BaseGame/3D/HUB/fusion_ready_0.tres")
var EnergyReayMaterial_1 = preload("res://BaseGame/3D/HUB/fusion_ready_1.tres")
var EnergyReayMaterial_2 = preload("res://BaseGame/3D/HUB/fusion_ready_2.tres")

var SpaceScaneTime = randf()
var ScanPositionR0 = randf_range(-0.5, 0.5)
var ScanPositionR1 = randf_range(-0.5, 0.5)
var ScanPositionR2 = randf_range(-0.5, 0.5)
var ScanPositionR3 = randf_range(-0.5, 0.5)

var PortalEnergy = preload("res://BaseGame/3D/HUB/teleportEnergy.tres")


# talk
var TalkStart = false
var TalkEnd = false
@onready var Talk = $GC/talk
var hello = false
var name_ = false
var welcome = false

# Welcome
var merhaba = preload("res://BaseGame/Sound/Voice/merhama.ogg")
var hosgeldin = preload("res://BaseGame/Sound/Voice/hosgeldin.ogg")

#Names
var cevik =  preload("res://BaseGame/Sound/Voice/cevik.ogg")

func _ready() -> void:
	$idl0.play()
	$idl1.play() 
	EnergyReayMaterial_0.emission_enabled = false
	EnergyReayMaterial_1.emission_enabled = false
	EnergyReayMaterial_2.emission_enabled = false

	PortalEnergy.emission_enabled = false
	$lights.hide()
	$portal_enter/portal_door/AnimationPlayer.play("PortalDoorOpen")
	$portal_enter/PDoorOpenSound.play()
	$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled",  true)
	$GC/gcAnim.play("FirtTalk")
	GLobalVar.walkNow = true
	GLobalVar.PlayerSettings["CanWalk"] = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _GiveLife():
	if Input.is_action_just_pressed("l"):
		if not GLobalVar.PlayerSettings["GiveLife"]:
			GLobalVar.PlayerSettings["GiveLife"] = true
		else: GLobalVar.PlayerSettings["GiveLife"] = false

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
# Energy Ready X3

# Fusion Start
func _FusionStart():
	if Input.is_action_just_pressed("left_m"):
		if FusionStartArea and not GLobalVar.EngineReady:
			if GLobalVar.EnergyReady0 and GLobalVar.EnergyReady1 and GLobalVar.EnergyReady0:
				if not GLobalVar.FusionReady:
					$FusionStartArea/fsAnim.play("fsStart")
					$FusionStartArea/FsStart.play()
				else:
					$FusionStartArea/fsAnim.play_backwards("fsStart")
					$FusionStartArea/FsClose.play()

func _SpaceMapScan(delta):
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
# Fusion Start

# Start Engine
func _StartEngine():
	if Input.is_action_just_pressed("left_m"):
		if GLobalVar.FusionReady:
			if StartEngineFusion:
				if not GLobalVar.EngineReady:
					$StartEgineFusion/SEFAnim.play("EngineStart")
					$StartEgineFusion/SEFSound_open.play()
				else:
					$StartEgineFusion/SEFAnim.play_backwards("EngineStart")
					$StartEgineFusion/SEFSound_close.play()

	if GLobalVar.EngineReady:
		$Cardis/AnimationPlayer.play("1_energy_ready")
		$Cardis/centerObject/COAnim.play("dik")

func _on_sef_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "EngineStart":
		if not GLobalVar.EngineReady:
			GLobalVar.EngineReady = true
		else:
			GLobalVar.EngineReady = false
# Start Engine

# Door
func _Door():
	if Input.is_action_just_pressed("left_m"):
		if GLobalVar.FusionReady and DoorArea:
			if not DoorOpen:
				$Cardis/Cardis_portable/AnimationPlayer.play("doorAction")
				$DoorArea/Open.play()
				DoorOpen = true
			else:
				$Cardis/Cardis_portable/AnimationPlayer.play_backwards("doorAction")
				$DoorArea/Close.play()
				DoorOpen = false
# Door

# level change 
func  _name():
	if Input.is_action_just_pressed("Enter"):
		if len($ui/name.text) > 0:
			GLobalVar.PlayerSettings["Name"] = $ui/name.text
			$ui/name.visible = false
			GLobalVar.PlayerSettings["CanWalk"] = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			print($ui/name.text)

func _PortalEnter_LevelChange():
	if GLobalVar.EngineReady:
		if TalkStart:
			if not hello:
				print("works! 0")
				Talk.stream = merhaba
				Talk.play()
				hello = true

			if not Talk.playing and hello:
				if not name_:
					print("works! 1")
					Talk.stream = cevik
					Talk.play()
					name_ = true

			if not Talk.playing and hello and name_:
				if not welcome:
					print("works! 2")
					Talk.stream = hosgeldin
					Talk.play()
					welcome = true

var PlayFirstTalkWalk = false
func _on_portal_ready_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Ready":
		if not PlayFirstTalkWalk:
			PortalEnergy.emission_enabled = true
			$GC/gcAnim.play("TalkStart")
			PlayFirstTalkWalk = true
			GLobalVar.walkNow = true

func _on_gc_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "TalkStart":
		TalkStart = true
		GLobalVar.walkNow = false
	if anim_name == "FirtTalk":
		GLobalVar.walkNow = false

func _process(delta: float) -> void:
	_GiveLife()
	_EnergyStatusRotate(delta)
	_EnergyReadyArea()
	_FusionStart()
	_SpaceMapScan(delta)
	_StartEngine()
	_Door()
	_PortalEnter_LevelChange()
	_name()

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
		EnergyReadyArea  = false

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
				$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled",  false)
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
