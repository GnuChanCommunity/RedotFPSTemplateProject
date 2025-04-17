extends Node3D

var doorOpen   = false
var EnterArea  = false
var ExitArea   = false
var unlockDoor = false
var EnterOpen  = false
var ExitOpen   = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed('e'):
		if GLobalVar.FirstDoor_ray:
			if EnterArea:
				if not unlockDoor: # don't forget this
					if not doorOpen:
						if not ExitOpen:
							doorOpen  = true 
							EnterOpen = true
							$doorAnimation.play("Open")
					else:
						if not ExitOpen:
							doorOpen  = false
							EnterOpen = false
							$doorAnimation.play_backwards("Open")
						else:
							doorOpen = false
							ExitOpen = false
							$doorAnimation.play_backwards("exit_open")
				else:
					if GLobalVar.FirstDoorKey:
						unlockDoor = true

			if ExitArea:
				if not unlockDoor: # same don't forget
					if not doorOpen:
						if not EnterOpen:
							doorOpen = true
							ExitOpen = true
							$doorAnimation.play("exit_open")
					else:
						if not EnterOpen:
							doorOpen = false
							ExitOpen = false
							$doorAnimation.play_backwards("exit_open")
						else:
							doorOpen = false
							$doorAnimation.play_backwards("Open")
							EnterOpen = false


func _on_enter_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		EnterArea = true
func _on_enter_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		EnterArea = false

func _on_exit_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		ExitArea = true
func _on_exit_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		ExitArea = false
