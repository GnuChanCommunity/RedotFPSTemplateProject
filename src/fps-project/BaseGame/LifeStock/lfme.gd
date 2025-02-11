extends CharacterBody3D


var SPEED = 1
const JUMP_VELOCITY = 5

@onready var AllLifeStock = [
	$CubeChan
]

@onready var CubeChabLights =  [$CubeChan/SpotLight3D, $CubeChan/SpotLight3D2, $CubeChan/SpotLight3D3, $CubeChan/SpotLight3D4] 
@onready var CubeChanMaterial = preload("res://BaseGame/LifeStock/gclight.tres")

var WalkTrue = false
var run = false

func  _chooseLife(LifeIndex: int):
	for i in range(AllLifeStock.size()):
		if i == Gl.LifeIndex:
			AllLifeStock[i].show()
		else:
			AllLifeStock[i].hide()

func CubechanLights(visible: bool):
	for i in range(CubeChabLights.size()):
		if visible:
			CubeChanMaterial.emission_enabled = true
			CubeChabLights[i].visible = true
		else:
			CubeChanMaterial.emission_enabled = false
			CubeChabLights[i].visible = false

func _input(event):
	if Gl.GiveLife:
		if event is InputEventMouseMotion:
			self.rotate_y(deg_to_rad(-event.relative.x * Gl.PlayerMouseSpeed))

func _ready() -> void:
	_chooseLife(Gl.LifeCount)
	CubeChanMaterial.emission_enabled = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		if Gl.GiveLife:
			Gl.LifeIndex = 0
			_chooseLife(0)

	if Input.is_action_just_pressed("left_m"):
		if Gl.GiveLife:
			if Gl.LifeCount == 1:
				if Gl.Index0LightOff:
					CubechanLights(true)
					Gl.Index0LightOff = false
				else:
					CubechanLights(false)
					Gl.Index0LightOff = true
	
	if Input.is_action_pressed("w") or Input.is_action_pressed("s"):
		if Gl.GiveLife:
			if Input.is_action_pressed("shift"):
				if not $run.playing:
					$run.play()
			else:
				WalkTrue = true
				if not $walk.playing:
					$walk.play()
				else:
					run = true
	else:
		WalkTrue = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Gl.GiveLife:
		if Input.is_action_pressed("shift"):
			SPEED = 2
		elif  Input.is_action_just_released("shift"):
			SPEED = 0.8

		# Handle jump.
		if Input.is_action_just_pressed("space") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var input_dir := Input.get_vector("ui_left", "ui_right", "s", "w")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
