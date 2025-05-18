extends Node

@onready var fps = $fps

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fps/effect.visible = false
	$fps/sleep.visible = false
	GLobalVar.PlayerSettings["CanJump"] = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
