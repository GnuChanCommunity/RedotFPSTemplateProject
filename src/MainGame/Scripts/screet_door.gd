extends Node3D


var ScreetDoorOpen = false


func _process(delta: float) -> void:
	if not ScreetDoorOpen:
		if GLobalVar.ScreetDoor:
			$AnimationPlayer.play("ED_Open")
			ScreetDoorOpen = true
