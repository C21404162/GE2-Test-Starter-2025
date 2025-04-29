extends Camera3D

@onready var drone = $".."

#ADD LERP HERE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var drone_forward = -drone.global_transform.basis.z
	var target_pos = drone.global_position + (drone_forward * 4.0) + Vector3(0, 3, 0)    
	global_position = global_position.lerp(target_pos, 5.0 * delta)
		
	look_at(drone.global_position)
	#pass
