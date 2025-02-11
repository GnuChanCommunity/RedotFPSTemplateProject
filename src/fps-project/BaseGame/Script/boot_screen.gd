extends Control

@onready var UserName = $name
@onready var TextBox = $textbox


"""
destekciler
0: Alper

bagis yapanlar
0: Mustafa
1: pebdifjfjforjei2928e6u3hrbdbavqj


"""

var FirstDialog_tr = [
	"YouTube kanalımı temel alan oyuna hoş geldiniz! 'Y' harfine basarak\nYouTube kanalıma bakabilirsiniz.",
	"Oyunların temeli YouTube kanalına dayanmaktadır.",
	"Bu arada, Oyunfor linkinden bağış yapmak istersen, 'O' tuşuna basabilirsin.",
	"Oyuna başlamadan önce bana ismini söyler misin?"
]

var FirstDialog_en = [
	"Welcome to the game based on my YouTube channel! Press 'Y'\nto check out my YouTube channel.",
	"The games are based on the YouTube channel.",
	"By the way, if you want to donate via Oyunfor, press 'O'.",
	"Before starting the game, can you tell me your name?"
]

var nextText = [
	"Geçmek için 'E' tuşuna bas",
	"Press 'E' key to continue"
]

var CurrentDialog = []
var CurrentDialogIndex = 0
var GiveNameFinish = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		if UserName.visible and len(str(UserName.text)):
			Gl.PlayerName = UserName.text
			get_tree().change_scene_to_file("res://BaseGame/Scene/main.tscn")

	if Input.is_action_just_pressed("e"):
		if $textbox.visible:
			if CurrentDialog.size()-1 > CurrentDialogIndex:
				CurrentDialogIndex += 1
				$textbox/text.text = CurrentDialog[CurrentDialogIndex]
			else:
				Gl.firstTalkFinish = true
				if Gl.firstTalkFinish:
					UserName.visible = true
					$textbox.visible = false

	if Input.is_action_just_pressed("skip"):
		Gl.StartStateFirstAnim = true
		get_tree().change_scene_to_file("res://BaseGame/Scene/main.tscn")
	elif Input.is_action_just_pressed("y"):
		OS.shell_open("https://www.youtube.com/@GnuChanOS")
	elif Input.is_action_just_pressed("o"):
		OS.shell_open("https://www.oyunfor.com/donate/gnuchanos")

	if Gl.StartFirstDialog:
		$textbox.visible = true
		if Gl.Lang == "Turkish":
			$textbox/next.text = nextText[0]
		elif Gl.Lang == "English":
			$textbox/next.text = nextText[1]
		$textbox/text.text = CurrentDialog[CurrentDialogIndex]
		Gl.StartFirstDialog = false

func _on_turkce_lang_pressed() -> void:
	Gl.StartFirstDialog = true
	Gl.Lang = "Turkish"
	CurrentDialog = FirstDialog_tr
	$SelectLang.visible = false

func _on_eng_lang_2_pressed() -> void:
	Gl.StartFirstDialog = true
	Gl.Lang = "English"
	CurrentDialog = FirstDialog_en
	$SelectLang.visible = false
