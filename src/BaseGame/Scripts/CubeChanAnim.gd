extends AnimationTree


var st: AnimationNodeStateMachinePlayback


func _ready() -> void:
	st = get("parameters/playback")

func _process(delta: float) -> void:
	if GLobalVar.PlayerSettings["GiveLife"]:
		if Input.is_action_pressed("w"):
			st.travel("cubeChanAnim_walk_forward")
		elif Input.is_action_pressed("s"):
			st.travel("cubeChanAnim_walk_backward")
		else:
			if not GLobalVar.walkNow:
				st.travel("cubeChanAnim_idl")
	else:
		if  GLobalVar.walkNow:
			st.travel("cubeChanAnim_walk_forward")
		else:
			st.travel("cubeChanAnim_idl")
