extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GLobalVar.PlayerSettings["Name"] == "Dumb":
		$fps/shaders/ui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
