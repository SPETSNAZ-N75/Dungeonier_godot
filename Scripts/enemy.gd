extends CharacterBody2D
@onready var player : CharacterBody2D = $"../../Player"
@onready var Trigger = $Area2D
@onready var attack_timer: Timer = $AttackTimer
@onready var nav : NavigationAgent2D = $NavigationAgent2D
@onready var health_bar: ProgressBar = $healthBar
@export var Health : int = 50 
@export var DamageAmmount : int = 10
@export var Speed : float = 50
var Aggro : bool = false
var canAttack : bool = false


func _ready() -> void:
	health_bar.hide()
	health_bar.value = Health
	SignalManager._Hit.connect(onTakeDamage)
	Aggro = true
	
func onTakeDamage():
	if SignalManager.HitObject == self :
		Health -= DamageAmmount
		health_bar.value = Health
		
		health_bar.show()
		if Health <= 0:
			Health = 0
			$CollisionShape2D.disabled = true
			Aggro = false
			$healthBar.hide()
			$AnimatedSprite2D.play("death")
			$KillTimer.start()
			PSM.Score = PSM.Score + 1
			SignalManager.EnemyDead.emit()
		else:
			$AnimatedSprite2D.play("hit")
		# print(Health)
		
func _on_kill_timer_timeout() -> void:
	queue_free()
	
func _physics_process(_delta) : 
	
	if Trigger.overlaps_body(player):
		$Area2D/CollisionShape2D.disabled = true
		
		
		
	if Aggro == true :
		var direction = Vector2()
		nav.target_position = player.global_position
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = direction * Speed
		
		if direction.x > 0 :
			$AnimatedSprite2D.play("move")
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("move")
			$AnimatedSprite2D.flip_h = true
	else:
		velocity = Vector2.ZERO
		#print(direction.x)
	move_and_slide()



func _on_attack_timer_timeout() -> void:
	if canAttack:
		SignalManager.PlayerHit.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		canAttack = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		canAttack = false
