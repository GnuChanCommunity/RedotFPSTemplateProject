extends Area3D


var computerArea = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_m"):
		if computerArea:
			if not Gl.PlayerUsingPC:
				Gl.PlayerUsingPC = true
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			else:
				Gl.PlayerUsingPC = false
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		computerArea = true

func _on_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		computerArea = false
