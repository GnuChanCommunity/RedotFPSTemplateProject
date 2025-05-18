extends Node3D
class_name TalkStreamer

var lang: String
var current_stream: Dictionary
var sound_resource: AudioStreamPlayer3D

func _ready() -> void:
	lang = GLobalVar.PlayerSettings["lang"]
	current_stream = _get_streamer_by_lang()
	# sound_resource = $GC/talk # Bu satır kaldırıldı. Ana betikten atanacak.
	# Eğer sound_resource'un burada atanması gerekiyorsa (TalkStreamer kendi AudioStreamPlayer'ını yönetiyorsa)
	# ve bu $GC/talk, TalkStreamer node'unun bir alt node'u ise, bu satır kalabilir.
	# Ancak, ana betikteki $GC/talk node'unu kullanmak daha yaygın bir yaklaşımdır.

func _get_streamer_by_lang() -> Dictionary:
	if lang == "turkish":
		return get_tr
	else:
		return get_eng

var get_eng := {
	"hi": preload("res://BaseGame/Sound/Voice/hi.ogg"),
	"welcome": preload("res://BaseGame/Sound/Voice/welcome.ogg"),
	"lastTalk": preload("res://BaseGame/Sound/Voice/lastTalk.ogg"),
	"noName": preload("res://BaseGame/Sound/Voice/noname.ogg"),
	"openLight": preload("res://BaseGame/Sound/Voice/light_en.ogg") # Eklendi
}

var get_tr := {
	"hi": preload("res://BaseGame/Sound/Voice/merhama.ogg"),
	"welcome": preload("res://BaseGame/Sound/Voice/hosgeldin.ogg"),
	"lastTalk": preload("res://BaseGame/Sound/Voice/sonkonusma.ogg"),
	"noName": preload("res://BaseGame/Sound/Voice/isimsiz.ogg"),
	"openLight": preload("res://BaseGame/Sound/Voice/light_tr.ogg") # Eklendi
}

var names := {
	"cevik": preload("res://BaseGame/Sound/Voice/cevik.ogg"),
	"mustafa": preload("res://BaseGame/Sound/Voice/Mustafa.ogg"),
	"refik": preload("res://BaseGame/Sound/Voice/refik.ogg"),
	"Werquast": preload("res://BaseGame/Sound/Voice/Werquast​.ogg"), # Orijinalde sonunda görünmez bir karakter olabilir, kontrol edin.
	"ahmet": preload("res://BaseGame/Sound/Voice/Ahmet.ogg"),
	"mehmet": preload("res://BaseGame/Sound/Voice/Mehmet.ogg"),
	"ali": preload("res://BaseGame/Sound/Voice/Ali.ogg"),
	"hasan": preload("res://BaseGame/Sound/Voice/Hasan.ogg"),
	"huseyin": preload("res://BaseGame/Sound/Voice/huseyin.ogg"),
	"ibrahim": preload("res://BaseGame/Sound/Voice/İbrahim.ogg"),
	"osman": preload("res://BaseGame/Sound/Voice/Osman.ogg"),
	"yusuf": preload("res://BaseGame/Sound/Voice/Yusuf.ogg"),
	"emre": preload("res://BaseGame/Sound/Voice/Emre.ogg"),
	"burak": preload("res://BaseGame/Sound/Voice/Burak.ogg"),
	"fatih": preload("res://BaseGame/Sound/Voice/Fatih.ogg"),
	"ramazan": preload("res://BaseGame/Sound/Voice/Ramazan.ogg"),
	"enes": preload("res://BaseGame/Sound/Voice/Enes.ogg"),
	"omer": preload("res://BaseGame/Sound/Voice/omer.ogg"),
	"murat": preload("res://BaseGame/Sound/Voice/Murat.ogg"),
	"selim": preload("res://BaseGame/Sound/Voice/Selim.ogg"),
	"furkan": preload("res://BaseGame/Sound/Voice/Furkan.ogg"),
	"kadir": preload("res://BaseGame/Sound/Voice/Kadir.ogg"),
	"abdullah": preload("res://BaseGame/Sound/Voice/Abdullah.ogg"),
	"kubilay": preload("res://BaseGame/Sound/Voice/kubilay.ogg"),
	"eren": preload("res://BaseGame/Sound/Voice/eren.ogg"),
	"gokberk": preload("res://BaseGame/Sound/Voice/gokberk.ogg"),
	"ismail": preload("res://BaseGame/Sound/Voice/ismail.ogg"),
	"hakki": preload("res://BaseGame/Sound/Voice/hakki.ogg"),
	"samet": preload("res://BaseGame/Sound/Voice/samet.ogg"),
	"davut": preload("res://BaseGame/Sound/Voice/davut.ogg"),
	"suleyman": preload("res://BaseGame/Sound/Voice/suleyman.ogg"),
	"onur": preload("res://BaseGame/Sound/Voice/onur.ogg"),
	"ugur": preload("res://BaseGame/Sound/Voice/ugur.ogg"),
	"batuhan": preload("res://BaseGame/Sound/Voice/batuhan.ogg"),
	"serkan": preload("res://BaseGame/Sound/Voice/serkan.ogg"),
	"serdar146": preload("res://BaseGame/Sound/Voice/serdar.ogg"),
	"baris": preload("res://BaseGame/Sound/Voice/baris.ogg"),
	"erkan": preload("res://BaseGame/Sound/Voice/Erkan.ogg"),
	"cem_lifeIsShit": preload("res://BaseGame/Sound/Voice/cem.ogg"),
	"cemal": preload("res://BaseGame/Sound/Voice/Cemal.ogg"),
	"tuncay": preload("res://BaseGame/Sound/Voice/Tuncay.ogg"),
	"sinan": preload("res://BaseGame/Sound/Voice/Sinan.ogg"),
	"eray": preload("res://BaseGame/Sound/Voice/Eray.ogg"),
	"cihan": preload("res://BaseGame/Sound/Voice/Cihan.ogg"),
	"can": preload("res://BaseGame/Sound/Voice/Can.ogg"),
	"berkay": preload("res://BaseGame/Sound/Voice/Berkay.ogg"),
	"alper": preload("res://BaseGame/Sound/Voice/Alper.ogg"),
	"alp": preload("res://BaseGame/Sound/Voice/Alp.ogg"),
	"deniz": preload("res://BaseGame/Sound/Voice/deniz.ogg"),
	"tolga": preload("res://BaseGame/Sound/Voice/Tolga.ogg"),
	"harun": preload("res://BaseGame/Sound/Voice/Harun.ogg"),
	"yasin": preload("res://BaseGame/Sound/Voice/Yasin.ogg"),
	"taylan": preload("res://BaseGame/Sound/Voice/Taylan.ogg"),
	"bora": preload("res://BaseGame/Sound/Voice/Bora.ogg"),
	"sarp": preload("res://BaseGame/Sound/Voice/Sarp.ogg"),
	"kenan": preload("res://BaseGame/Sound/Voice/Kenan.ogg"),
	"arda": preload("res://BaseGame/Sound/Voice/Arda.ogg"),
	"dogan": preload("res://BaseGame/Sound/Voice/dogan.ogg"),
	"gorkem": preload("res://BaseGame/Sound/Voice/gorkem.ogg"),
	"cagatay": preload("res://BaseGame/Sound/Voice/cagatay.ogg"),
	"metin": preload("res://BaseGame/Sound/Voice/metin.ogg"),
	"nihat": preload("res://BaseGame/Sound/Voice/nihat.ogg"),
	"sahin": preload("res://BaseGame/Sound/Voice/sahin.ogg"),
	"adem": preload("res://BaseGame/Sound/Voice/adem.ogg"),
	"alex": preload("res://BaseGame/Sound/Voice/alex.ogg")
}

func play_sound(sound_name: String) -> void:
	current_stream = _get_streamer_by_lang()
	if not sound_resource:
		printerr("TalkStreamer: sound_resource is not set!")
		return
	if current_stream.has(sound_name):
		sound_resource.stream = current_stream[sound_name]
		sound_resource.play()
	else:
		printerr("TalkStreamer: Sound '", sound_name, "' not found in current language stream.")

func play_name(player_name: String) -> void:
	current_stream = _get_streamer_by_lang()
	if not sound_resource:
		printerr("TalkStreamer: sound_resource is not set!")
		return
	if names.has(player_name):
		sound_resource.stream = names[player_name]
	else:
		if current_stream.has("noName"):
			sound_resource.stream = current_stream["noName"]
		else:
			printerr("TalkStreamer: 'noName' sound not found in current language stream for play_name.")
			return 
	sound_resource.play()
