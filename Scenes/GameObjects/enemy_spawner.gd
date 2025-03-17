extends Node2D

@export var SpawnInterval : float = 3
@export var SpawnRange : float = 10
@export var Enemy : PackedScene
@export var pool : int = 10

func _ready() -> void:
	$Timer.wait_time = SpawnInterval
	# $Timer.start()
	SignalManager.EnemyDead.connect(Spawn)

func _on_timer_timeout() -> void:
	Spawn()
	
func Spawn():
	if Enemy && pool != 0 :
		var enemy_instance = Enemy.instantiate()
		var spawn_pos = global_position + Vector2(
			randf_range(-SpawnRange, SpawnRange),
			randf_range(-SpawnRange, SpawnRange)
		)
		enemy_instance.global_position = spawn_pos
		get_parent().add_child(enemy_instance)
		pool = pool - 1
		#print(pool)
