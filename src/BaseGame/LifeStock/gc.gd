extends CharacterBody3D

var SPEED = 1
const JUMP_VELOCITY = 4.5

func _input(event):
	if GLobalVar.PlayerSettings["GiveLife"]:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * GLobalVar.PlayerSettings["MouseSpeed"]))

func  _walSound():
	if Input.is_action_pressed("w") or Input.is_action_pressed("s"):
		if GLobalVar.PlayerSettings["GiveLife"]:
			if not Input.is_action_pressed("shift"):
				if not $walk.playing:
					$walk.play()
			else:
				if not $run.playing:
					$run.play()

	if GLobalVar.walkNow:
		if not $walk.playing:
			$walk.play()


func _process(delta: float) -> void:
	_walSound()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if GLobalVar.PlayerSettings["GiveLife"]:
		var input_dir := Input.get_vector("ui_left", "ui_right", "w", "s")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		if Input.is_action_pressed("shift"):
			SPEED = 3
		elif Input.is_action_just_released("shift"):
			SPEED = 1

		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
