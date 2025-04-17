extends Node3D


func _ready() -> void:
	GLobalVar.PlayerSettings["CanWalk"] = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.firstLoading = false

	GLobalVar.PlayerSettings["CanJump"] = true
	GLobalVar.PlayerSettings["HandReady"] = false
	$fps/ui.visible = false

func _AudioLoop():
	if not $audio/IdlRoom0.playing:
		$audio/IdlRoom0.play()
	elif not $audio/IdlRoom1.playing:
		$audio/IdlRoom1.play()
	elif not $audio/RadioX/RadioMusic0.playing:
		$audio/RadioX/RadioMusic0.playing

func _process(_delta: float) -> void:
	_AudioLoop()

	GLobalVar.FirstDoor_ray = false
	if $fps/head/standCam/hitRay.is_colliding():
		var hit = $fps/head/standCam/hitRay.get_collider()
		if hit.name == "firstDoor_obj":
			GLobalVar.FirstDoor_ray = true


func _on_water_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		GLobalVar.PlayerSettings["Swim"] = true
		GLobalVar.PlayerSettings["Speed"] = 1.5

func _on_water_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		GLobalVar.PlayerSettings["Swim"] = false
		GLobalVar.PlayerSettings["Speed"] = 3
