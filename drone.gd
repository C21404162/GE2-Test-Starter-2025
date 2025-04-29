extends RigidBody3D

@export var lift_power: float = 20
@export var move: float = 5
@export var rot: float = .01

func _physics_process(delta: float) -> void:
	var lift = Input.is_action_pressed("up") 
	var forward = Input.get_axis("reverse", "forward") 
	var turn = Input.get_axis("right", "left")  
	if lift:
		print("LIFTING")
		apply_central_force(Vector3.UP * lift_power)
	
	if forward != 0:
		print("MOVING FORWARD")
		apply_central_force(-global_transform.basis.z * forward * move)
	
	#too fast
	if turn != 0:
		#spin props
		print("TURNING")
		apply_torque_impulse(Vector3.UP * turn * rot)
