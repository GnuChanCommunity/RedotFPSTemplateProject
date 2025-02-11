extends Window


func _on_close_requested() -> void:
	self.hide()
	Gl.PlayerCanMove = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
func _on_effect_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effect"), linear_to_db(value))
func _on_voice_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"), linear_to_db(value))

func _on_mouse_speed_slider_value_changed(value: float) -> void:
	Gl.PlayerMouseSpeed = value

func _on_head_shake_check_box_toggled(toggled_on: bool) -> void:
	Gl.PlayerHeadShake = toggled_on
	print(Gl.PlayerHeadShake)
