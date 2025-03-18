extends Node3D

func _ready() -> void:
	if GLobalVar.PlayerSettings["Name"] == "Dumb":
		$fps/shaders/ui.hide()
		GLobalVar.walkNow = true
		GLobalVar.PlayerSettings["CanWalk"] = true
