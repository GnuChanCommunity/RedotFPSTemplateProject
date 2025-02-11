extends Window


@onready var input = $ScrollContainer/VBoxContainer/console
@onready var output = $ScrollContainer/VBoxContainer/output


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("console"):
		print("works console")
		if Gl.PlayerCanMove:
			self.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Gl.PlayerCanMove = false
			input.grab_focus()
		else:
			self.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			Gl.PlayerCanMove = true

	if Input.is_action_just_pressed("enter"):
		if self.visible:
			if input.text == "start":
				get_tree().change_scene_to_file("res://BaseGame/Scene/testScene.tscn")
			else:
				if Gl.Lang == "English":
					output.text += "What Is This??? -> " + str(input.text)
				elif Gl.Lang == "Turkih":
					output.text += "Yok Oyle Komut! -> " + str(input.text)
