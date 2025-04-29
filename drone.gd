extends RigidBody3D

@export var lift_force: float = 20
@export var move_force: float = 5
@export var rotation_force: float = .01

func _physics_process(delta: float) -> void:
	var lift = Input.is_action_pressed("up") 
	var forward = Input.get_axis("backward", "forward") 
	var turn = Input.get_axis("left", "right")  
	if lift:
		print("LIFTING")
		apply_central_force(Vector3.UP * lift_force)
	
	if forward != 0:
		print("MOVING FORWARD")
		apply_central_force(-global_transform.basis.z * forward * move_force)
	
	#too fast
	
	if turn != 0:
		print("TURNING")
		apply_torque_impulse(Vector3.UP * turn * rotation_force)
