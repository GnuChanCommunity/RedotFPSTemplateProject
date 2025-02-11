extends CharacterBody3D


const JUMP_VELOCITY = 5.8
@onready var HeadRay = [
	$headRay/r0, 
	$headRay/r1, 
	$headRay/r2, 
	$headRay/r3, 
	$headRay/r4, 
	$headRay/r5, 
	$headRay/r6, 
	$headRay/r7
]

@onready var head = $head
@onready var Ray = $head/standCam/hitRay
@onready var Camera = $head/standCam
var CurrentFov = 90

# head shake
const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

@onready var hands = [
	$head/standCam/hitRay/hand0,
	$head/standCam/hitRay/hand1,
	$head/standCam/hitRay/hand2,
	$head/standCam/hitRay/hand3,
	$head/standCam/hitRay/hand4,
	$head/standCam/hitRay/hand5,
	$head/standCam/hitRay/hand6,
	$head/standCam/hitRay/hand7,
	$head/standCam/hitRay/hand8,
	$head/standCam/hitRay/hand9,
]

func _CheckItem():
	for i in range(hands.size()):
		if Gl.PlayerUsingPC or not Gl.PlayerHandReady:
			hands[i].hide()
		else:
			if i == Gl.PlayerHandIndex:
				hands[i].show()
			else:
				hands[i].hide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$stand.disabled = false
	$duck.disabled = true
	$crawling.disabled = true
	$head/standCam.fov = CurrentFov
	_CheckItem()
	$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
	$UI/name.text = "Name: " + str(Gl.PlayerName)

func _input(event):
	if Gl.PlayerCanMove and not Gl.GiveLife and not Gl.PlayerUsingPC:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * Gl.PlayerMouseSpeed))
			head.rotate_x(deg_to_rad(-event.relative.y * Gl.PlayerMouseSpeed))
			head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func  _process(delta: float) -> void:
	if Input.is_action_just_pressed("l"):
		if not Gl.GiveLife:
			Gl.GiveLife = true
		else:
			Gl.GiveLife = false

	if not Gl.PlayerCanMove or Gl.PlayerUsingPC or Gl.GiveLife:
		$UI/cursor_raycast.hide()
		$UI/cursor.hide()
	else:
		$UI/cursor.show()

	if Gl.PlayerCanMove and not Gl.GiveLife and not Gl.PlayerUsingPC:
		if Ray.is_colliding():
			var hit = Ray.get_collider()
			if hit.is_in_group("check"): # autocompletion can't complete this is_in_group nice
				$UI/cursor_raycast.show()
			if Input.is_action_just_pressed("e"):
				$UI/hit.text = "Raycast Group: Check = " + str(hit.name)
		else:
			$UI/cursor_raycast.hide()
		$UI/fps.text = "FPS: " + str(Engine.get_frames_per_second())

		# run
		if Input.is_action_pressed("w") and Input.is_action_pressed("shift"):
			if Gl.PlayerCanRun:
				Gl.PlayerSpeed += 5 * delta
				Camera.fov += 1
		elif Input.is_action_pressed("right_m"):
			Camera.fov -= 1
			Camera.fov = clamp(Camera.fov, 50, 90)
		else:
			if Gl.PlayerSpeed != Gl.PlayerCurrentSpeed:
				Gl.PlayerSpeed -= 10 * delta
				Camera.fov -= 1

		if not Input.is_action_pressed("right_m"):
			Camera.fov = clamp(Camera.fov, 90, 95)

		Gl.PlayerSpeed = clamp(Gl.PlayerSpeed, Gl.PlayerCurrentSpeed, Gl.PlayerMaxSpeed)
		$UI/speed.text = "Player Speed: " + str(Gl.PlayerSpeed)
		$UI/fov.text = "Player FOV: " + str(Camera.fov)

	if Input.is_action_just_pressed("escape"):
		if Gl.PlayerCanMove:
			Gl.PlayerCanMove = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$UI/settings.visible = true
		else:
			Gl.PlayerCanMove = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$UI/settings.visible = false

	if not Gl.playerQuestItem:
		if Input.is_action_just_pressed("1"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 1
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("2"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 2
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("3"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 3
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("4"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 4
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("5"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 5
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("6"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 6
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("7"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 7
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("8"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 8
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("9"):
			Gl.PlayerHandBeforeIndex = Gl.PlayerHandIndex
			Gl.PlayerHandIndex = 9
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()
		elif Input.is_action_just_pressed("q"):
			Gl.PlayerHandIndex = Gl.PlayerHandBeforeIndex
			$UI/handCheck.text = "Current Index " + str(Gl.PlayerHandIndex) + " Before Index " + str(Gl.PlayerHandBeforeIndex)
			_CheckItem()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Gl.PlayerCanMove and not Gl.GiveLife and not Gl.PlayerUsingPC:
		if Input.is_action_pressed("ctrl"):
			Gl.PlayerDuck = true
			Gl.PlayerCrawling = false
			$head.position.y = 1.308

			$duck.disabled = false
			$stand.disabled = true
			$crawling.disabled = true

		elif Input.is_action_pressed("c"):
			Gl.PlayerCrawling = true
			Gl.PlayerDuck = false
			$head.position.y = 0.894

			$duck.disabled = true
			$stand.disabled = true
			$crawling.disabled = false
		else:
			if Gl.PlayerDuck or Gl.PlayerCrawling:
				var can_stand = true
				for ray in HeadRay:
					if ray.is_colliding():
						can_stand = false
						break

				if can_stand:
					Gl.PlayerDuck = false
					Gl.PlayerCrawling = false
					$head.position.y = 1.966

					$duck.disabled = true
					$stand.disabled = false
					$crawling.disabled = true

		# Handle jump.
		# maybe i can try to make high jump maybe.
		if Input.is_action_just_pressed("space") and is_on_floor():
			if Gl.PlayerCanJump:
				velocity.y = JUMP_VELOCITY

		var input_dir := Input.get_vector("a", "d", "w", "s")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * Gl.PlayerSpeed
			velocity.z = direction.z * Gl.PlayerSpeed
		else:
			velocity.x = move_toward(velocity.x, 0, Gl.PlayerSpeed)
			velocity.z = move_toward(velocity.z, 0, Gl.PlayerSpeed)

		# Head bob
		if Gl.PlayerHeadShake:
			t_bob += delta * velocity.length() * float(is_on_floor())
			Camera.transform.origin = _headbob(t_bob)

		move_and_slide()
