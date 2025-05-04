extends Node3D

var sleepTime = 2
var sleepOver = false
var talkOver  = false

@onready var talkAudio = $talk

func _dayNow():
	if GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass

func _on_talk_finished() -> void:
	talkOver = true

func _ready() -> void:
	GLobalVar.PlayerSettings["CanWalk"] = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.firstLoading = false

	GLobalVar.PlayerSettings["CanJump"] = false
	$fps/ui.visible = false
	_dayNow()

func _AudioLoop():
	if not $audio/IdlRoom0.playing:
		$audio/IdlRoom0.play()
	elif not $audio/IdlRoom1.playing:
		$audio/IdlRoom1.play()
	elif not $audio/RadioX/RadioMusic0.playing:
		$audio/RadioX/RadioMusic0.playing

func _process(delta: float) -> void:
	_AudioLoop()

	GLobalVar.FirstDoor_ray = false
	if Input.is_action_just_pressed('e'):
		if $fps/head/standCam/hitRay.is_colliding():
			var hit = $fps/head/standCam/hitRay.get_collider()
			if hit.name == "firstDoor_obj":
				GLobalVar.FirstDoor_ray = true
			elif hit.name == "badSleep":
				if GLobalVar.daysEnd:
					if GLobalVar.day1_finish:
						GLobalVar.day = 2
						$fps/sleep.visible = true
						sleepOver = false
					elif GLobalVar.day2_finish:
						GLobalVar.day = 3
						$fps/sleep.visible = true
						sleepOver = false
					elif GLobalVar.day3_finish:
						GLobalVar.day = 4
						$fps/sleep.visible = true
						sleepOver = false
					elif GLobalVar.day4_finish:
						GLobalVar.day = 5
						$fps/sleep.visible = true
						sleepOver = false

			elif hit.name == "pc":
				if talkOver:
					if GLobalVar.day == 1:
						get_tree().change_scene_to_file("res://MainGame/level1/level_1_root.tscn")
						talkOver = false
					elif GLobalVar.day == 2:
						talkOver = false
					elif GLobalVar.day == 3:
						talkOver = false
					elif GLobalVar.day == 4:
						talkOver = false
					elif GLobalVar.day == 5:
						talkOver = false

	if not sleepOver:
		if sleepTime > 0:
			sleepTime -= delta
		else:
			sleepOver = true
			$fps/sleep.visible = false

func _on_water_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		GLobalVar.PlayerSettings["Swim"] = true
		GLobalVar.PlayerSettings["Speed"] = 1.5
func _on_water_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		GLobalVar.PlayerSettings["Swim"] = false
		GLobalVar.PlayerSettings["Speed"] = 3
