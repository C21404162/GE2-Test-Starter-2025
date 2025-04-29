extends Node3D

@export var drone_scene: PackedScene
@onready var camera = $Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add drone
	var drone = drone_scene.instantiate()
	add_child(drone)
	drone.position = Vector3(0, 1, 0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
