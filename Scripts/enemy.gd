extends CharacterBody2D
@onready var health_bar: ProgressBar = $healthBar
@export var Health : int = 50 
@export var DamageAmmount : int = 10

func _ready() -> void:
	health_bar.value = Health
	SignalManager._Hit.connect(onTakeDamage)

func take_damage():
	pass

func onTakeDamage():
	if SignalManager.HitObject == self :
		Health -= DamageAmmount
		health_bar.value = Health
		if Health <= 0:
			Health = 0
			$healthBar.hide()
			$AnimatedSprite2D.play("death")
			$KillTimer.start()
		else:
			$AnimatedSprite2D.play("hit")
		print(Health)
		


func _on_kill_timer_timeout() -> void:
	queue_free()
