extends Camera3D

@onready var drone = $".."
var distance = 4 
var lerp_speed= 5
var offset = Vector3.ZERO

func _process(delta: float) -> void:
	var drone_back = drone.global_transform.basis.z.normalized()
	var target_offset = (drone_back * distance) + Vector3(0, 3, 0)
	offset = offset.lerp(target_offset, lerp_speed * delta)
	global_position = drone.global_position + offset#
	
	look_at(drone.global_position, Vector3.UP)
