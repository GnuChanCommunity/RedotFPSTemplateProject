extends Control


var Nodes = []

func _ready() -> void:
	Nodes = [
		$name,
		$bg,
		$turkish,
		$english,
		$lang,
		$warning
]

var firstTime = false

func  _name():
	if Input.is_action_just_pressed("Enter"):
		if not firstTime:
			if len($name.text) > 0:
				GLobalVar.PlayerSettings["Name"] = $name.text

				for i in Nodes:
					i.visible = false

				GLobalVar.PlayerSettings["CanWalk"] = true
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				GLobalVar.firstLoading = false
				firstTime = true


func _process(delta: float) -> void:
	_name()
	if $name.visible:
		$lang.text = GLobalVar.PlayerSettings["lang"]
		if "turkish" == GLobalVar.PlayerSettings["lang"]:
			$warning.text = "Sesler biraz rahatsız edici olabilir, mekanik havası vermek için yaptım, lütfen ESC tuşuna basıp sesleri azaltın!\nGeçmek için Enter tuşuna bas."
			$name.placeholder_text = "Senin ismin ne?"
		elif "english" == GLobalVar.PlayerSettings["lang"]:
			$warning.text = "The sounds might be a bit annoying, but I made them to give a mechanical feel, please press ESC to reduce the sounds!\nPress Enter to proceed."
			$name.placeholder_text = "What's youre name?"
