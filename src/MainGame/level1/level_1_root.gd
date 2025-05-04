extends Node3D

var sleepOver = false
var sleepTime = 2
var dialogFinish = false
var talkEnd = false
var doorOpen = false
@onready var talk_audio = $Talk

func _ready() -> void:
	GLobalVar.PlayerSettings["CanWalk"] = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.firstLoading = false

	GLobalVar.PlayerSettings["CanJump"] = false
	$fps/ui.visible = false
	$fps/sleep.visible = false
	

func _day1Works():
	if talkEnd:
		pass

func _worksday():
	if GLobalVar.day == 1:
		_day1Works()
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass
	elif GLobalVar.day == 1:
		pass

func _SoundLoop():
	if not $Street0.playing:
		$Street0.play()
	if not $Street1.playing:
		$Street1.play()
	if not $Street2.playing:
		$Street2.play()

func _Rotatetetetete(delta):
	$level1/Rotatetete.rotate_z(10*delta)

func _process(delta: float) -> void:
	_Rotatetetetete(delta)
	_SoundLoop()
	_day1Works()


	if not $Talk.playing:
		talkEnd = true
		if not doorOpen:
			$openDoor/AnimationPlayer.play("open_DOOR")
			doorOpen = true
