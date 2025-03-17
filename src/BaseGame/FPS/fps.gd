extends CharacterBody3D

@onready var head = $head
@onready var Ray = $head/standCam/hitRay
@onready var Camera = $head/standCam

@onready var HeadRay = [ 
	$headRay/r0, $headRay/r1, $headRay/r2, $headRay/r3, 
	$headRay/r4, $headRay/r5, $headRay/r6, $headRay/r7
]

@onready var hands = [
	$head/standCam/hitRay/hand0, $head/standCam/hitRay/hand1, 
	$head/standCam/hitRay/hand2, $head/standCam/hitRay/hand3, 
	$head/standCam/hitRay/hand4, $head/standCam/hitRay/hand5, 
	$head/standCam/hitRay/hand6, $head/standCam/hitRay/hand7, 
	$head/standCam/hitRay/hand8, $head/standCam/hitRay/hand9,
]

# head shake
const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func _CheckItem():
	for i in range(hands.size()):
		if GLobalVar.PlayerSettings["UsingPC"] or not GLobalVar.PlayerSettings["HandReady"]:
			hands[i].hide()
		else:
			if i == GLobalVar.PlayerSettings["HandCurrentIndex"]:
				hands[i].show()
			else:
				hands[i].hide()

func _ChangeHand():
	if not GLobalVar.PlayerSettings["HoldingQuestItem"]:
		if Input.is_action_just_pressed("1"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 1
			_CheckItem()
		elif Input.is_action_just_pressed("2"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 2
			_CheckItem()
		elif Input.is_action_just_pressed("3"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 3
			_CheckItem()
		elif Input.is_action_just_pressed("4"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 4
			_CheckItem()
		elif Input.is_action_just_pressed("5"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 5
			_CheckItem()
		elif Input.is_action_just_pressed("6"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 6
			_CheckItem()
		elif Input.is_action_just_pressed("7"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 7
			_CheckItem()
		elif Input.is_action_just_pressed("8"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 8
			_CheckItem()
		elif Input.is_action_just_pressed("9"):
			GLobalVar.PlayerSettings["BeforeHandIndex"] = GLobalVar.PlayerSettings["HandCurrentIndex"]
			GLobalVar.PlayerSettings["HandCurrentIndex"] = 9
			_CheckItem()
		elif Input.is_action_just_pressed("q"):
			GLobalVar.PlayerSettings["HandCurrentIndex"] = GLobalVar.PlayerSettings["BeforeHandIndex"]
			_CheckItem()

func _changeFOV():
	$head/standCam.fov = GLobalVar.PlayerSettings["FOV"]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$stand.disabled = false
	$duck.disabled = true
	$crawling.disabled = true
	$head/standCam.fov = GLobalVar.PlayerSettings["FOV"]
	_CheckItem()

func _input(event):
	if GLobalVar.PlayerSettings["CanWalk"] and not GLobalVar.PlayerSettings["GiveLife"] and not GLobalVar.PlayerSettings["UsingPC"]:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * GLobalVar.PlayerSettings["MouseSpeed"]))
			head.rotate_x(deg_to_rad(-event.relative.y * GLobalVar.PlayerSettings["MouseSpeed"]))
			head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func  _process(delta: float) -> void:
	if GLobalVar.PlayerSettings["CanWalk"] and not GLobalVar.PlayerSettings["GiveLife"] and not GLobalVar.PlayerSettings["UsingPC"]:
		_CheckItem()
		_ChangeHand()
		_changeFOV()


func _duckORcrawling():
	if Input.is_action_pressed("ctrl"):
		GLobalVar.PlayerSettings["Duck"] = true
		GLobalVar.PlayerSettings["Crawling"] = false
		$head.position.y = 1.308
		$duck.disabled = false
		$stand.disabled = true
		$crawling.disabled = true

	elif Input.is_action_pressed("c"):
		GLobalVar.PlayerSettings["Crawling"] = true
		GLobalVar.PlayerSettings["Duck"] = false
		$head.position.y = 0.894
		$duck.disabled = true
		$stand.disabled = true
		$crawling.disabled = false
	else:
		if GLobalVar.PlayerSettings["Duck"] or GLobalVar.PlayerSettings["Crawling"]:
			var can_stand = true
			for ray in HeadRay:
				if ray.is_colliding():
					can_stand = false
					break

			if can_stand:
				GLobalVar.PlayerSettings["Duck"] = false
				GLobalVar.PlayerSettings["Crawling"] = false
				$head.position.y = 1.966
				$duck.disabled = true
				$stand.disabled = false
				$crawling.disabled = true

func _SpeedChange():
	if not Input.is_action_pressed("w") and not Input.is_action_pressed("shift"):
		if not $stand.disabled:
			GLobalVar.PlayerSettings["Speed"] = 3
		elif not $duck.disabled:
			GLobalVar.PlayerSettings["Speed"] = 2
		elif not $crawling.disabled:
			GLobalVar.PlayerSettings["Speed"] = 1

func _Run(delta):
	# run
	if Input.is_action_pressed("w") and Input.is_action_pressed("shift"):
		if GLobalVar.PlayerSettings["CanRun"]:
			if GLobalVar.PlayerSettings["Speed"] < GLobalVar.PlayerSettings["MaxSpeed"]:
				GLobalVar.PlayerSettings["Speed"] += 5 * delta
			if GLobalVar.PlayerSettings["FOV"] < GLobalVar.PlayerSettings["FOVMAX"]+10:
				GLobalVar.PlayerSettings["FOV"] += 50 * delta

	elif Input.is_action_pressed("right_m"):
		if GLobalVar.PlayerSettings["FOV"] > GLobalVar.PlayerSettings["FOVMIN"]:
			GLobalVar.PlayerSettings["FOV"] -= 50 * delta

	else:
		if GLobalVar.PlayerSettings["CurrentSpeed"] < GLobalVar.PlayerSettings["Speed"]:
			GLobalVar.PlayerSettings["Speed"] -= 5 * delta
		if GLobalVar.PlayerSettings["FOV"] > GLobalVar.PlayerSettings["FOVMAX"]:
			GLobalVar.PlayerSettings["FOV"] -= 50 * delta
		elif GLobalVar.PlayerSettings["FOV"] < GLobalVar.PlayerSettings["FOVMAX"]:
			GLobalVar.PlayerSettings["FOV"] += 50 * delta

	$UI/test.text = "FOV: " + str(GLobalVar.PlayerSettings["FOV"]) + " Speed: " + str(GLobalVar.PlayerSettings["Speed"])

func _jump():
	if Input.is_action_just_pressed("space") and is_on_floor():
		if GLobalVar.PlayerSettings["CanJump"]:
			velocity.y = GLobalVar.PlayerSettings["JumpHeight"]


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if GLobalVar.PlayerSettings["CanWalk"] and not GLobalVar.PlayerSettings["GiveLife"] and not GLobalVar.PlayerSettings["UsingPC"]:
		_jump()
		_Run(delta)
		_duckORcrawling()
		_SpeedChange()

		var input_dir := Input.get_vector("a", "d", "w", "s")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * GLobalVar.PlayerSettings["Speed"]
			velocity.z = direction.z * GLobalVar.PlayerSettings["Speed"]
		else:
			velocity.x = move_toward(velocity.x, 0, GLobalVar.PlayerSettings["Speed"])
			velocity.z = move_toward(velocity.z, 0, GLobalVar.PlayerSettings["Speed"])

		# Head bob
		if GLobalVar.PlayerSettings["HeadBob"]:
			t_bob += delta * velocity.length() * float(is_on_floor())
			Camera.transform.origin = _headbob(t_bob)

		move_and_slide()
