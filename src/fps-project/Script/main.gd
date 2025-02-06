extends Node3D

var r0 = randf_range(-1.0, 0.5)
var r1 = randf_range(-1.0, 0.5)
var r2 = randf_range(-1.0, 0.5)
var r3 = randf_range(-1.0, 0.5)
var time = randf_range(1, 5)

var sleep = 1
var stopplay = false

var engineStartArea = false
var fusionReadyArea = false
var fusionStartArea = false
var settingsx7Area = false

@onready var light = preload("res://3D/light.tres") 
@onready var fusionx0 = preload("res://3D/fusionX0.tres")
@onready var fusionx1 = preload("res://3D/fusionX1.tres")
@onready var fusionx2 = preload("res://3D/fusionX2.tres")

@onready var hitRay = $fps/head/standCam/hitRay

func _ready() -> void:
	$extra/OmniLight3D.hide()
	$extra/OmniLight3D2.hide()
	$extra/OmniLight3D3.hide()
	light.emission_enabled = false
	fusionx0.emission_enabled = false
	fusionx1.emission_enabled = false
	fusionx2.emission_enabled = false

func _process(delta: float) -> void:
	if Gl.EngineReady:
		if time > 0:
			time -= delta
		else:
			r0 = randf_range(-1.0, 1.0)
			r1 = randf_range(-1.0, 1.0)
			r2 = randf_range(-1.0, 1.0)
			r3 = randf_range(-1.0, 1.0)
			time = randf_range(1, 5)

		$gameRoom/r0.rotate_y(r0 * delta)
		$gameRoom/r1.rotate_y(r1 * delta)
		$gameRoom/r2.rotate_y(r2 * delta)
		$gameRoom/r3.rotate_y(r3 * delta)

	if Gl.fusionReady:
		$gameRoom/screen1.rotate_y(-0.1 * delta)


	if Gl.PlayerUsingPC:
		$camArea/setting_cam.current = true

		if not stopplay:
			$camArea/setting_cam/AnimationPlayer.play("zoomSettingsCam")
			if sleep > 0:
				sleep -= delta
			else:
				sleep = 1
				stopplay = true
	else:
		if $camArea/setting_cam.current:
			$camArea/setting_cam/AnimationPlayer.play_backwards("zoomSettingsCam")
			if sleep > 0:
				sleep -= delta
			else:
				sleep = 1
				$camArea/setting_cam.current = false
				$fps/head/standCam.current = true
				stopplay = false

	# work with player raycast
	if fusionReadyArea:
		if hitRay.is_colliding():
			var hit = hitRay.get_collider()
			if Input.is_action_just_pressed("e"):
				if hit.name == "FusionReadyx0":
					if not Gl.fusion0:
						$fusionReadyx3/FusionReadyx3/FusionReadyx0/fusionReadyX3Object/fr0Anim.play("open")
						Gl.fusion0 = true
						$fusionReadyx3/activeFusion/fusionRotate0/fusion_rotate/fr0.play("fr0")
						$fusionReadyx3/activeFusion/frs.play()
				elif hit.name == "FusionReadyx1":
					if not Gl.fusion1:
						$fusionReadyx3/FusionReadyx3/FusionReadyx1/fusionReadyX3Object/fr1Anim.play("open")
						Gl.fusion1 = true
						$fusionReadyx3/activeFusion/fusionRotate1/fusion_rotate/fr1.play("fr1")
						$fusionReadyx3/activeFusion/frs.play()
				elif hit.name == "FusionReadyx2":
					if not Gl.fusion2:
						$fusionReadyx3/FusionReadyx3/FusionReadyx2/fusionReadyX3Object/fr2Anim.play("open")
						Gl.fusion2
						$fusionReadyx3/activeFusion/fusionRotate2/fusion_rotate/fr2.play("fr2")
						$fusionReadyx3/activeFusion/frs.play()


	elif fusionStartArea:
		if Input.is_action_just_pressed("e"):
			if Gl.fusion0 and Gl.fusion1 and Gl.fusion2:
				if not Gl.fusionReady:
					# extra control later
					$fusionStart/fusionReady/fusionReady_AnimationPlayer.play("fusionReady")
					$fusionStart/fusionReadySound.play()
					$extra/insideSound.play()
					$gameRoom/centerObject/centerObjectAnim.play("up")
					$extra/OmniLight3D.show()
					$extra/OmniLight3D2.show()
					$extra/OmniLight3D3.show()
					light.emission_enabled = true
					Gl.fusionReady = true

	elif engineStartArea:
		if Input.is_action_just_pressed("e"):
			if not Gl.EngineReady and Gl.fusionReady:
				$StartEngine/startEngineObject/EngineShow_AnimationPlayer.play("startEngine")
				$gameRoom/AnimationPlayer.play("1_energy_ready_hellooooo")
				$gameRoom/centerObject/centerObjectAnim.play("up_speed")
				$extra/startEngine.play()
				$StartEngine/StartEngineSound.play()
				Gl.EngineReady = true

func _on_inside_sound_finished() -> void:
	if Gl.fusionReady:
		$extra/insideSound.play()

func _on_fusion_readyx_3_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		fusionReadyArea = true
func _on_fusion_readyx_3_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		fusionReadyArea = false

func _on_fusion_start_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		fusionStartArea = true
func _on_fusion_start_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		fusionStartArea = false

func _on_start_engine_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		engineStartArea = true
func _on_start_engine_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		engineStartArea = false

func _on_settingsx_7_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		settingsx7Area = true
func _on_settingsx_7_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		settingsx7Area = false


func _on_center_object_anim_animation_finished(anim_name: StringName) -> void:
	if Gl.fusionReady:
		if anim_name == "up":
			$gameRoom/centerObject/centerObjectAnim.play("down")
			print("down")
		elif anim_name == "down":
			$gameRoom/centerObject/centerObjectAnim.play("up")
			print("up")

		elif anim_name == "up_speed":
			if Gl.EngineReady:
				$gameRoom/centerObject/centerObjectAnim.play("down_speed")
		elif anim_name == "down_speed":
			if Gl.EngineReady:
				$gameRoom/centerObject/centerObjectAnim.play("up_speed")


func _on_start_engine_finished() -> void:
	get_tree().change_scene_to_file("res://Scene/testScene.tscn")


func _on_fr_0_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "open":
		fusionx0.emission_enabled = true
		Gl.fusion0 = true
func _on_fr_1_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "open":
		fusionx1.emission_enabled = true
		Gl.fusion1 = true
func _on_fr_2_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "open":
		fusionx2.emission_enabled = true
		Gl.fusion2 = true
