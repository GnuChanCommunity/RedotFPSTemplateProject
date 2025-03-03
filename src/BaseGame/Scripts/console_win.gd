extends Window

func _Console():
	if Input.is_action_just_pressed("console"):
		if not GLobalVar.PlayerSettings["OpenSettings"] and not GLobalVar.PlayerSettings["OpenConsole"]:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			GLobalVar.PlayerSettings["OpenConsole"] = true
			self.show()
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			GLobalVar.PlayerSettings["OpenConsole"] = false
			self.hide()


func _process(delta: float) -> void:
	_Console()

func _on_close_requested() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.PlayerSettings["OpenConsole"] = false
	self.hide()
