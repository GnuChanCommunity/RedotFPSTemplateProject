extends Node3D

var EnergyReadyArea = false
var FusionStartArea = false
var StartEngineFusion = false
var SettingsArea = false
var PortalEnter = false
var DoorArea = false
var DoorOpen = false

var EnergyReayMaterial_0 = preload("res://BaseGame/3D/HUB/fusion_ready_0.tres")
var EnergyReayMaterial_1 = preload("res://BaseGame/3D/HUB/fusion_ready_1.tres")
var EnergyReayMaterial_2 = preload("res://BaseGame/3D/HUB/fusion_ready_2.tres")

var SpaceScaneTime = randf()
var ScanPositionR0 = randf_range(-0.5, 0.5)
var ScanPositionR1 = randf_range(-0.5, 0.5)
var ScanPositionR2 = randf_range(-0.5, 0.5)
var ScanPositionR3 = randf_range(-0.5, 0.5)

var PortalEnergy = preload("res://BaseGame/3D/HUB/teleportEnergy.tres")

var TalkNow_bool = false

# talk
var TalkStart = false
@onready var Talk = $GC/talk
var hello = false
var name_ = false
var welcome = false
var TalkEnd = false


# Welcome
var merhaba = preload("res://BaseGame/Sound/Voice/merhama.ogg")
var hi = preload("res://BaseGame/Sound/Voice/hi.ogg")

var hosgeldin = preload("res://BaseGame/Sound/Voice/hosgeldin.ogg")
var welcome_sound   = preload("res://BaseGame/Sound/Voice/welcome.ogg")

var sonKonusma = preload("res://BaseGame/Sound/Voice/sonkonusma.ogg")
var lastTalk   = preload("res://BaseGame/Sound/Voice/lastTalk.ogg")

# Turkish names
var cevik    = preload("res://BaseGame/Sound/Voice/cevik.ogg")
var mustafa  = preload("res://BaseGame/Sound/Voice/Mustafa.ogg")
var refik    = preload("res://BaseGame/Sound/Voice/refik.ogg")
var Werquast = preload("res://BaseGame/Sound/Voice/Werquast​.ogg")
var Ahmet    = preload("res://BaseGame/Sound/Voice/Ahmet.ogg")
var Mehmet   = preload("res://BaseGame/Sound/Voice/Mehmet.ogg")
var Ali      = preload("res://BaseGame/Sound/Voice/Ali.ogg")
var Hasan    = preload("res://BaseGame/Sound/Voice/Hasan.ogg")

var Huseyin  = preload("res://BaseGame/Sound/Voice/huseyin.ogg")
var ibrahim  = preload("res://BaseGame/Sound/Voice/İbrahim.ogg")
var Osman    = preload("res://BaseGame/Sound/Voice/Osman.ogg")
var Yusuf    = preload("res://BaseGame/Sound/Voice/Yusuf.ogg")
var Emre     = preload("res://BaseGame/Sound/Voice/Emre.ogg")
var Burak    = preload("res://BaseGame/Sound/Voice/Burak.ogg")
var Fatih    = preload("res://BaseGame/Sound/Voice/Fatih.ogg")
var Ramazan  = preload("res://BaseGame/Sound/Voice/Ramazan.ogg")
var Enes     = preload("res://BaseGame/Sound/Voice/Enes.ogg")
var Omer     = preload("res://BaseGame/Sound/Voice/omer.ogg")
var Murat    = preload("res://BaseGame/Sound/Voice/Murat.ogg")
var Selim    = preload("res://BaseGame/Sound/Voice/Selim.ogg")
var Furkan   = preload("res://BaseGame/Sound/Voice/Furkan.ogg")
var Kadir    = preload("res://BaseGame/Sound/Voice/Kadir.ogg")
var Abdullah = preload("res://BaseGame/Sound/Voice/Abdullah.ogg")
var Kubilay  = preload("res://BaseGame/Sound/Voice/kubilay.ogg")
var Eren     = preload("res://BaseGame/Sound/Voice/eren.ogg")
var Gokberk  = preload("res://BaseGame/Sound/Voice/gokberk.ogg")
var Ismail   = preload("res://BaseGame/Sound/Voice/ismail.ogg")
var Hakki    = preload("res://BaseGame/Sound/Voice/hakki.ogg")
var Samet    = preload("res://BaseGame/Sound/Voice/samet.ogg")
var Davut    = preload("res://BaseGame/Sound/Voice/davut.ogg")
var Suleyman = preload("res://BaseGame/Sound/Voice/suleyman.ogg")
var Onur     = preload("res://BaseGame/Sound/Voice/onur.ogg")
var Ugur     = preload("res://BaseGame/Sound/Voice/ugur.ogg")
var Batuhan  = preload("res://BaseGame/Sound/Voice/batuhan.ogg")
var Serkan   = preload("res://BaseGame/Sound/Voice/serkan.ogg")
var Serdar146 = preload("res://BaseGame/Sound/Voice/serdar.ogg")
var Baris    = preload("res://BaseGame/Sound/Voice/baris.ogg")
var Erkan    = preload("res://BaseGame/Sound/Voice/Erkan.ogg")
var Cem_lifeIsShit      = preload("res://BaseGame/Sound/Voice/cem.ogg")
var Cemal    = preload("res://BaseGame/Sound/Voice/Cemal.ogg")
var Tuncay   = preload("res://BaseGame/Sound/Voice/Tuncay.ogg")
var Sinan    = preload("res://BaseGame/Sound/Voice/Sinan.ogg")
var Eray     = preload("res://BaseGame/Sound/Voice/Eray.ogg")
var Cihan    = preload("res://BaseGame/Sound/Voice/Cihan.ogg")
var Can      = preload("res://BaseGame/Sound/Voice/Can.ogg")
var Berkay   = preload("res://BaseGame/Sound/Voice/Berkay.ogg")
var Alper    = preload("res://BaseGame/Sound/Voice/Alper.ogg")
var Alp      = preload("res://BaseGame/Sound/Voice/Alp.ogg")
var Deniz    = preload("res://BaseGame/Sound/Voice/deniz.ogg")
var Tolga    = preload("res://BaseGame/Sound/Voice/Tolga.ogg")
var Harun    = preload("res://BaseGame/Sound/Voice/Harun.ogg")
var Yasin    = preload("res://BaseGame/Sound/Voice/Yasin.ogg")
var Taylan   = preload("res://BaseGame/Sound/Voice/Taylan.ogg")
var Bora     = preload("res://BaseGame/Sound/Voice/Bora.ogg")
var Sarp     = preload("res://BaseGame/Sound/Voice/Sarp.ogg")
var Kenan    = preload("res://BaseGame/Sound/Voice/Kenan.ogg")
var Arda     = preload("res://BaseGame/Sound/Voice/Arda.ogg")
var Dogan    = preload("res://BaseGame/Sound/Voice/dogan.ogg")
var Gorkem   = preload("res://BaseGame/Sound/Voice/gorkem.ogg")
var Cagatay  = preload("res://BaseGame/Sound/Voice/cagatay.ogg")
var Metin    = preload("res://BaseGame/Sound/Voice/metin.ogg")
var Nihat    = preload("res://BaseGame/Sound/Voice/nihat.ogg")
var Sahin    = preload("res://BaseGame/Sound/Voice/sahin.ogg")
var Adem     = preload("res://BaseGame/Sound/Voice/adem.ogg")

# English Names
var alex = preload("res://BaseGame/Sound/Voice/alex.ogg")

var isimsiz = preload("res://BaseGame/Sound/Voice/isimsiz.ogg")
var noName  = preload("res://BaseGame/Sound/Voice/noname.ogg")

var openLight_tr = preload("res://BaseGame/Sound/Voice/light_tr.ogg")
var openLight_en = preload("res://BaseGame/Sound/Voice/light_en.ogg")

func _ready() -> void:
	$idl0.play()
	$idl1.play() 
	EnergyReayMaterial_0.emission_enabled = false
	EnergyReayMaterial_1.emission_enabled = false
	EnergyReayMaterial_2.emission_enabled = false

	PortalEnergy.emission_enabled = false
	$lights.hide()
	$portal_enter/portal_door/AnimationPlayer.play("PortalDoorOpen")
	$portal_enter/PDoorOpenSound.play()
	$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled",  true)
	$GC/gcAnim.play("FirtTalk")
	GLobalVar.walkNow = true
	GLobalVar.PlayerSettings["CanWalk"] = false
	GLobalVar.PlayerSettings["CanJump"] = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$fps/ui/name.grab_focus()
	$pcArea/pcCAM/UI.visible = false

func _rotatePosition():
	if not GLobalVar.PlayerSettings["GiveLife"]:
		$GC.look_at($fps.global_transform.origin)

func _GiveLife():
	if Input.is_action_just_pressed("l"):
		if not GLobalVar.PlayerSettings["GiveLife"] and not GLobalVar.firstLoading:
			GLobalVar.PlayerSettings["GiveLife"] = true
		else: GLobalVar.PlayerSettings["GiveLife"] = false

func _EnergyStatusRotate(delta):
	$Cardis/energyDC/rotate.rotate_y(5 * delta)


# Energy Ready X3
func _EnergyReadyArea():
	if Input.is_action_just_pressed("left_m"):
		if EnergyReadyArea and not GLobalVar.FusionReady:
			if $fps/head/standCam/hitRay.is_colliding():
				var hit = $fps/head/standCam/hitRay.get_collider()
				if hit.name == "EnergyReady0":
					if not GLobalVar.EnergyReady0:
						$EnergyReadyArea/EnergyReady0/ready0Anim.play("ready0")
					else:
						$EnergyReadyArea/EnergyReady0/ready0Anim.play_backwards("ready0")
				elif hit.name == "EnergyReady1":
					if not GLobalVar.EnergyReady1:
						$EnergyReadyArea/EnergyReady1/ready1Anim.play("ready1")
					else:
						$EnergyReadyArea/EnergyReady1/ready1Anim.play_backwards("ready1")
				elif hit.name == "EnergyReady2":
					if not GLobalVar.EnergyReady2:
						$EnergyReadyArea/EnergyReady2/ready2Anim.play("ready2")
					else:
						$EnergyReadyArea/EnergyReady2/ready2Anim.play_backwards("ready2")

func _on_ready_0_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready0":
		if not GLobalVar.EnergyReady0:
			GLobalVar.EnergyReady0 = true
			EnergyReayMaterial_0.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady0 = false
			EnergyReayMaterial_0.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()

func _on_ready_1_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready1":
		if not GLobalVar.EnergyReady1:
			GLobalVar.EnergyReady1 = true
			EnergyReayMaterial_1.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady1 = false
			EnergyReayMaterial_1.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()

func _on_ready_2_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ready2":
		if not GLobalVar.EnergyReady2:
			GLobalVar.EnergyReady2 = true
			EnergyReayMaterial_2.emission_enabled = true
			$EnergyReadyArea/OpenEnergy.play()
		else:
			GLobalVar.EnergyReady2 = false
			EnergyReayMaterial_2.emission_enabled = false
			$EnergyReadyArea/CloseEnergy.play()
# Energy Ready X3

# Fusion Start
func _FusionStart():
	if Input.is_action_just_pressed("left_m"):
		if FusionStartArea and not GLobalVar.EngineReady:
			if GLobalVar.EnergyReady0 and GLobalVar.EnergyReady1 and GLobalVar.EnergyReady0:
				if not GLobalVar.FusionReady:
					$FusionStartArea/fsAnim.play("fsStart")
					$FusionStartArea/FsStart.play()
				else:
					$FusionStartArea/fsAnim.play_backwards("fsStart")
					$FusionStartArea/FsClose.play()

func _SpaceMapScan(delta):
	if GLobalVar.FusionReady:
		if SpaceScaneTime > 0:
			SpaceScaneTime -= delta
		else:
			SpaceScaneTime = randf()
			ScanPositionR0 = randf_range(-0.5, 0.5)
			ScanPositionR1 = randf_range(-0.5, 0.5)
			ScanPositionR2 = randf_range(-0.5, 0.5)
			ScanPositionR3 = randf_range(-0.5, 0.5)

		$Cardis/r0.rotate_y(ScanPositionR0 * delta)
		$Cardis/r1.rotate_y(ScanPositionR1 * delta)
		$Cardis/r2.rotate_y(ScanPositionR2 * delta)
		$Cardis/r3.rotate_y(ScanPositionR3 * delta)

func _on_fs_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fsStart":
		if not GLobalVar.FusionReady:
			GLobalVar.FusionReady = true
			$lights.show()
		else:
			GLobalVar.FusionReady = false
			$lights.hide()
# Fusion Start

# Start Engine
func _StartEngine():
	if Input.is_action_just_pressed("left_m"):
		if GLobalVar.FusionReady:
			if StartEngineFusion:
				if not GLobalVar.EngineReady:
					$StartEgineFusion/SEFAnim.play("EngineStart")
					$StartEgineFusion/SEFSound_open.play()
				else:
					$StartEgineFusion/SEFAnim.play_backwards("EngineStart")
					$StartEgineFusion/SEFSound_close.play()

	if GLobalVar.EngineReady:
		$Cardis/AnimationPlayer.play("1_energy_ready")
		$Cardis/centerObject/COAnim.play("dik")

func _on_sef_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "EngineStart":
		if not GLobalVar.EngineReady:
			GLobalVar.EngineReady = true
		else:
			GLobalVar.EngineReady = false
# Start Engine

# Door
func _Door():
	if Input.is_action_just_pressed("left_m"):
		if not DoorOpen and DoorArea:
			$Cardis/Cardis_portable/AnimationPlayer.play("doorAction")
			$DoorArea/Open.play()
			DoorOpen = true
		elif DoorOpen and DoorArea:
			$Cardis/Cardis_portable/AnimationPlayer.play_backwards("doorAction")
			$DoorArea/Close.play()
			DoorOpen = false
# Door

func _PortalEnter_LevelChange():
	if GLobalVar.EngineReady:
		if TalkStart:
			if not hello:
				if "turkish" == GLobalVar.PlayerSettings["lang"]:
					Talk.stream = merhaba
					hello = true
				elif "english" == GLobalVar.PlayerSettings["lang"]:
					Talk.stream = hi
				Talk.play()
				hello = true

			if not Talk.playing and hello:
				if not name_:
					if "turkish" == GLobalVar.PlayerSettings["lang"]:
						if "cevik" or "çevik" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = cevik
						if "mustafa" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = mustafa
						elif "refik" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = refik

						elif "werquast​" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Werquast
						elif "ahmet" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Ahmet
						elif "mehmet" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Mehmet
						elif "ali" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Ali
						elif "hasan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Hasan
						elif "huseyin" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Huseyin
						elif "hasan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Hasan
						elif "ibrahim" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = ibrahim
						elif "osman" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Osman
						elif "yusuf" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Yusuf
						elif "emre" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Emre
						elif "burak" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Burak
						elif "fatih" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Fatih
						elif "ramazan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Ramazan
						elif "enes" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Enes
						elif "ömer" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Omer
						elif "murat" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Murat
						elif "selim" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Selim
						elif "furkan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Furkan
						elif "kadir" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Kadir
						elif "abdullah" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Abdullah
						elif "kubilay" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Kubilay
						elif "eren" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Eren
						elif "gökberk" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Gokberk
						elif "ismail" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Ismail
						elif "hakkı" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Hakki
						elif "samet" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Samet
						elif "davut" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Davut
						elif "süleyman" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Suleyman
						elif "onur" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Onur
						elif "uğur" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Ugur
						elif "batuhan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Batuhan
						elif "serkan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Serkan
						elif "serdar" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Serdar146
						elif "barış" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Baris
						elif "erkan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Erkan
						elif "cem" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Cem_lifeIsShit
						elif "cemal" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Cemal
						elif "tuncay" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Tuncay
						elif "sinan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Sinan
						elif "eray" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Eray
						elif "cihan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Cihan
						elif "can" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Can
						elif "berkay" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Berkay
						elif "alper" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Alper
						elif "alp" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Alp
						elif "deniz" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Deniz
						elif "tolga" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Tolga
						elif "harun" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Harun
						elif "yasin" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Yasin
						elif "taylan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Taylan
						elif "bora" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Bora
						elif "sarp" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Sarp
						elif "kenan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Kenan
						elif "arda" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Arda
						elif "doğan" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Dogan
						elif "görkem" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Gorkem
						elif "çağatay" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Cagatay
						elif "metin" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Metin
						elif "nihat" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Nihat
						elif "şahin" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Sahin
						elif "adem" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = Adem
						else:
							Talk.stream = isimsiz

					elif "english" == GLobalVar.PlayerSettings["lang"]:
						if "alex" == GLobalVar.PlayerSettings["Name"]:
							Talk.stream = alex
						else:
							Talk.stream = noName

					Talk.play()
					name_ = true


			if not Talk.playing and hello and name_:
				if not welcome:
					if "turkish" == GLobalVar.PlayerSettings["lang"]:
						Talk.stream = hosgeldin
					elif "english" == GLobalVar.PlayerSettings["lang"]:
						Talk.stream = welcome_sound
					Talk.play()
					welcome = true

			if not Talk.playing and hello and name_ and welcome:
				if not TalkEnd:
					if "turkish" == GLobalVar.PlayerSettings["lang"]:
						Talk.stream = sonKonusma
					elif "english" == GLobalVar.PlayerSettings["lang"]:
						Talk.stream = lastTalk
					Talk.play()
					TalkEnd = true

	if TalkEnd and not Talk.playing:
		get_tree().change_scene_to_file("res://MainGame/Scenes/main_scene.tscn")

var PlayFirstTalkWalk = false
func _on_portal_ready_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Ready":
		if not PlayFirstTalkWalk:
			PortalEnergy.emission_enabled = true
			$GC/gcAnim.play("TalkStart")
			PlayFirstTalkWalk = true
			GLobalVar.walkNow = true

func _on_gc_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "TalkStart":
		TalkStart = true
		GLobalVar.walkNow = false
	if anim_name == "FirtTalk":
		GLobalVar.walkNow = false

func _Settings():
	if Input.is_action_just_pressed("left_m"):
		if SettingsArea:
			if $fps/head/standCam/hitRay.is_colliding():
				var hit = $fps/head/standCam/hitRay.get_collider()
				if "ST0" == hit.name:
					if not GLobalVar.settings0:
						GLobalVar.settings0 = true
						$Settings/ST0/Anim_ST0.play("open0")
					else:
						GLobalVar.settings0 = false
						$Settings/ST0/Anim_ST0.play_backwards("open0")
				elif "ST1" == hit.name:
					if not GLobalVar.settings1:
						GLobalVar.settings1 = true
						$Settings/ST1/Anim_ST1.play("open1")
					else:
						GLobalVar.settings1 = false
						$Settings/ST1/Anim_ST1.play_backwards("open1")
				elif "ST2" == hit.name:
					if not GLobalVar.settings2:
						GLobalVar.settings2 = true
						$Settings/ST2/Anim_ST2.play("open2")
					else:
						GLobalVar.settings2 = false
						$Settings/ST2/Anim_ST2.play_backwards("open2")
				elif "ST3" == hit.name:
					if not GLobalVar.settings3:
						GLobalVar.settings3 = true
						$Settings/ST3/Anim_ST3.play("open3")
					else:
						GLobalVar.settings3 = false
						$Settings/ST3/Anim_ST3.play_backwards("open3")
				elif "ST4" == hit.name:
					if not GLobalVar.settings4:
						GLobalVar.settings4 = true
						$Settings/ST4/Anim_ST4.play("open4")
					else:
						GLobalVar.settings4 = false
						$Settings/ST4/Anim_ST4.play_backwards("open4")
				elif "ST5" == hit.name:
					if not GLobalVar.settings5:
						GLobalVar.settings5 = true
						$Settings/ST5/Anim_ST5.play("open5")
					else:
						GLobalVar.settings5 = false
						$Settings/ST5/Anim_ST5.play_backwards("open5")
				elif "ST6" == hit.name:
					if not GLobalVar.settings6:
						GLobalVar.settings6 = true
						$Settings/ST6/Anim_ST6.play("open6")
					else:
						GLobalVar.settings6 = false
						$Settings/ST6/Anim_ST6.play_backwards("open6")

func _TalkEvent():
	if $fps/head/standCam/hitRay.is_colliding():
		var hit = $fps/head/standCam/hitRay.get_collider()

		if Input.is_action_just_pressed("left_m"):
			if "GC" == hit.name:
				if TalkNow_bool:
					if GLobalVar.FusionReady:
						GLobalVar.PlayerSettings["CanWalk"] = false
						GLobalVar.PlayerSettings["OpenConsole"] = true
						GLobalVar.PlayerSettings["talkMode"] = true
						$fps/UI/consoleWin.show()
						Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
						$fps/UI/consoleWin/ScrollContainer/VBoxContainer/input.grab_focus()
					else:
						if not Talk.playing:
							if "turkish" == GLobalVar.PlayerSettings["lang"]:
								Talk.stream = openLight_tr
							elif "english" == GLobalVar.PlayerSettings["lang"]:
								Talk.stream = openLight_en
							Talk.play()


# radio
var radioOpen = true
var music = true
func _RadioX():
	if Input.is_action_just_pressed("left_m"):
		if $fps/head/standCam/hitRay.is_colliding():
			var hit = $fps/head/standCam/hitRay.get_collider()
			if "radiox" == hit.name:
				if radioOpen:
					radioOpen = false
					$Cardis/RadioX/music.stop()
				else:
					radioOpen = true
					$Cardis/RadioX/music.play()

	elif music and radioOpen:
		if not $Cardis/RadioX/music.playing:
			$Cardis/RadioX/music.play()
# radio

# pc 
var PcArea = false
var animFinish = false
func _PcUsing():
	if Input.is_action_just_pressed("left_m"):
		if PcArea and GLobalVar.FusionReady:
			if not GLobalVar.PlayerSettings["UsingPC"] and not animFinish:
				GLobalVar.PlayerSettings["UsingPC"] = true
				$pcArea/pcCAM/camAnim.play("animFinish")
				$pcArea/pcCAM.current = true
				animFinish = true
			else:
				if not animFinish:
					GLobalVar.PlayerSettings["UsingPC"] = false
					$pcArea/pcCAM/camAnim.play_backwards("animFinish")
					animFinish = true
					$pcArea/pcCAM/UI.visible = false

func _on_cam_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "animFinish":
		animFinish = false
		if GLobalVar.PlayerSettings["UsingPC"]:
			animFinish = false
			$pcArea/pcCAM/UI.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			GLobalVar.PlayerSettings["UsingPC"] = false
			animFinish = false
			$fps/head/standCam.current = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
# pc 

var sleepOver = false
var sleepTime = 2

func _process(delta: float) -> void:
	_GiveLife()
	_EnergyStatusRotate(delta)
	_EnergyReadyArea()
	_FusionStart()
	_SpaceMapScan(delta)
	_StartEngine()
	_Door()
	_PortalEnter_LevelChange()
	_Settings()
	_TalkEvent()
	_rotatePosition()
	_RadioX()
	_PcUsing()

	if not sleepOver:
		if sleepTime > 0:
			sleepTime -= delta
		else:
			sleepOver = true
			$fps/sleep.visible = false



func _on_idl_0_finished() -> void:
	$idl0.play()
func _on_idl_1_finished() -> void:
	$idl1.play() 

# Area Check
func _on_energy_ready_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		EnergyReadyArea = true
func _on_energy_ready_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		EnergyReadyArea  = false

func _on_fusion_start_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		FusionStartArea = true
func _on_fusion_start_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		FusionStartArea = false

func _on_start_egine_fusion_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		StartEngineFusion = true
func _on_start_egine_fusion_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		StartEngineFusion = false

func _on_settings_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		SettingsArea = true
func _on_settings_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		SettingsArea = false

var PlayPortalAreaFirstTime = false
func _on_portal_enter_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		if GLobalVar.EngineReady:
			if not PlayPortalAreaFirstTime:
				$portal_enter/PortalEnergyLoading/PortalReady.play("Ready")
				$portal_enter/portal_door/AnimationPlayer.play_backwards("PortalDoorOpen")
				$portal_enter/PDoorOpenSound.play()
				$portal_enter/portal_door/StaticBody3D/PortalDoorCoLL.set_deferred("disabled",  false)
				$portal_enter/PortalEnergyLoading/EnergyLoading.play()
				PlayPortalAreaFirstTime = true
		PortalEnter = true

func _on_portal_enter_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		PortalEnter = false

func _on_door_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		DoorArea = true
func _on_door_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		DoorArea = false

func _on_talk_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		TalkNow_bool = true
func _on_talk_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		TalkNow_bool = false

func _on_pc_area_body_entered(body: Node3D) -> void:
	if body.name == "fps":
		PcArea = true
func _on_pc_area_body_exited(body: Node3D) -> void:
	if body.name == "fps":
		PcArea = false
