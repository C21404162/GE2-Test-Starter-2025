extends RigidBody3D

@export var lift_force: float = 20.0
@export var move_force: float = 10.0
@export var rotation_torque: float = 5.0
@export var max_prop_speed: float = 100.0
@export var prop_acceleration: float = 50.0

var current_prop_speed: float = 0.0
var target_prop_speed: float = 0.0

@onready var props: Array = $Props.get_children()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Update prop speed
	current_prop_speed = move_toward(current_prop_speed, target_prop_speed, prop_acceleration * delta)
	
	# Rotate props
	for prop in props:
		prop.rotate_y(current_prop_speed * delta)

func _physics_process(delta: float) -> void:
	handle_input(delta)

func handle_input(delta: float) -> void:
	# Lift control (P key)
	if Input.is_key_pressed(KEY_P):
		apply_central_force(Vector3.UP * lift_force)
		target_prop_speed = max_prop_speed
	else:
		target_prop_speed = 0.0
	
	# Movement control (W/S keys)
	if Input.is_key_pressed(KEY_W):
		apply_central_force(-global_transform.basis.z * move_force)
	if Input.is_key_pressed(KEY_S):
		apply_central_force(global_transform.basis.z * move_force)
	
	# Rotation control (A/D keys)
	if Input.is_key_pressed(KEY_A):
		apply_torque_impulse(Vector3.UP * rotation_torque)
	if Input.is_key_pressed(KEY_D):
		apply_torque_impulse(Vector3.DOWN * rotation_torque)
