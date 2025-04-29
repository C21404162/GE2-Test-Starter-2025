extends RigidBody3D

@export var lift_power: float = 1.0
@export var move: float = 1.0
@export var rot: float = 1.0

func _physics_process(delta: float) -> void:
	var lift = Input.get_action_strength("up")
	var forward = Input.get_action_strength("forward") - Input.get_action_strength("reverse")
	var turn = Input.get_action_strength("right") - Input.get_action_strength("left")
	if lift > 0:
		apply_central_force(Vector3.UP * lift * lift_power)
	
	if forward != 0:
		apply_central_force(-global_transform.basis.z * forward * move)
	
	if turn != 0:
		apply_torque_impulse(Vector3.UP * turn * rot)
