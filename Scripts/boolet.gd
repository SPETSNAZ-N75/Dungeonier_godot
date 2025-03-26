extends Sprite2D
var spawnpos
var spawnrot
var speed : float = 200
func _ready() -> void:
	global_position = spawnpos
	global_rotation = spawnrot
	
func _physics_process(delta: float) -> void:
	pass
