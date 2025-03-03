extends Window

func _Settings():
	if Input.is_action_just_pressed("escape"):
		if not GLobalVar.PlayerSettings["OpenConsole"] and not GLobalVar.PlayerSettings["OpenSettings"]:
			GLobalVar.PlayerSettings["CanWalk"] = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			GLobalVar.PlayerSettings["OpenSettings"] = true
			self.show()
		else:
			GLobalVar.PlayerSettings["CanWalk"] = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			GLobalVar.PlayerSettings["OpenSettings"] = false
			self.hide()

func _process(delta: float) -> void:
	_Settings()

func _on_close_requested() -> void:
	GLobalVar.PlayerSettings["CanWalk"] = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.PlayerSettings["OpenSettings"] = false
	self.hide()

func _on_head_shake_check_box_toggled(toggled_on: bool) -> void:
	GLobalVar.PlayerSettings["HeadBob"] = toggled_on

func _on_mouse_speed_slider_value_changed(value: float) -> void:
	GLobalVar.PlayerSettings["MouseSpeed"] = value

func _on_voice_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.

func _on_effect_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.

func _on_music_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
