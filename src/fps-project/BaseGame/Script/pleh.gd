extends Node3D


var fpsAreaEnter = false
var AreaEnterCount = 0
var explainTalkFinish = false
var talkEnd = false
@onready var FirtsAudio = $FirstAnimStartArea/first

"""
merhaba isim oyunuma hosgeldin
"""

func _ready() -> void:
	if Gl.StartStateFirstAnim:
		$LifeMe/hubAnim.play("FirstAnim")
		$LifeMe/walk.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Gl.StartStateFirstAnim:
		if not $LifeMe/walk.playing:
			$LifeMe/walk.play()
		$LifeMe/hubAnim.play("FirstAnim")

# extra funcs
func _on_hub_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FirstAnim":
		Gl.stateFirstAnim = 1
		Gl.StartStateFirstAnim = false
		$LifeMe/CubeChan/AnimationPlayer.stop()

func _on_first_anim_start_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		AreaEnterCount += 1
		fpsAreaEnter = true
		if AreaEnterCount == 10:
			#Yeter amk
			print("10 oldu")
		elif AreaEnterCount == 20:
			#good bye
			print("20 oldu")
		else:
			if AreaEnterCount < 10:
				if Gl.PlayerName == "anan":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/anan.ogg")
				elif Gl.PlayerName == "eben":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/eben.ogg")
				elif Gl.PlayerName == "31" or Gl.PlayerName == "otuzbir" or Gl.PlayerName == "otuz1" or Gl.PlayerName == "3bir":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/31.ogg")
				elif Gl.PlayerName == "ahmet":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/ahmet.ogg")
				elif Gl.PlayerName == "mehmet":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/mehmet.ogg")
				elif Gl.PlayerName == "ali":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/ali.ogg")
				elif Gl.PlayerName == "veli":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/veli.ogg")
				elif Gl.PlayerName == "mustafa":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/mustafa.ogg")
				elif Gl.PlayerName == "kerim":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/kerim.ogg")
				elif Gl.PlayerName == "kamil":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/kamil.ogg")
				elif Gl.PlayerName == "hüseyin":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/huseyin.ogg")
				elif Gl.PlayerName == "ibrahim":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/ibrahim.ogg")
				elif Gl.PlayerName == "osman":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/osman.ogg")
				elif Gl.PlayerName == "burak":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/burak.ogg")
				elif Gl.PlayerName == "emre":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/emre.ogg")
				elif Gl.PlayerName == "yusuf":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/yusuf.ogg")
				elif Gl.PlayerName == "ramazan":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/ramazan.ogg")
				elif Gl.PlayerName == "fatih":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/voice/fatih.ogg")
				elif Gl.PlayerName == "sametgüngör" or Gl.PlayerName == "sametgungor":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/sametgungor.ogg")
				elif Gl.PlayerName == "samet":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/samet.ogg")
				elif Gl.PlayerName == "kubilay":
					FirtsAudio.stream = preload("res://BaseGame/Sounds/kubilay.ogg")
				FirtsAudio.play()
				talkEnd = true

func _on_first_anim_start_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		fpsAreaEnter = false

func _on_first_finished() -> void:
	$FirstAnimStartArea/second.play()

func _on_second_finished() -> void:
	Gl.StartStateFirstAnim = true
	explainTalkFinish = true
