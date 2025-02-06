extends AnimationTree

var state_machine: AnimationNodeStateMachinePlayback

func _ready():
	# Retrieve the state machine from the AnimationTree
	state_machine = get("parameters/playback")

func _process(_delta: float) -> void:
	if Input.is_action_pressed("w"):
		if Gl.GiveLife:
			state_machine.travel("CubeChanAnims_walk_forward")
	elif Input.is_action_pressed("s"):
		if Gl.GiveLife:
			state_machine.travel("CubeChanAnims_walk_backward")
	elif Input.is_action_pressed("right_m"):
		if Gl.GiveLife:
			state_machine.travel("CubeChanAnims_screet")
	elif Input.is_action_pressed("f"):
		if Gl.GiveLife:
			state_machine.travel("CubeChanAnims_hi")
	else:
		state_machine.travel("CubeChanAnims_idl")
