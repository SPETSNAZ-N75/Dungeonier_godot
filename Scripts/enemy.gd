extends CharacterBody2D
@onready var health_bar: ProgressBar = $healthBar
@export var DamageAmmount : int = 10

func _ready() -> void:
	health_bar.value = EnemyHealthManager.currentHealth
	EnemyHealthManager.onHealthChange.connect(onTakeDamage)

func take_damage():
	pass

func onTakeDamage():
		if EnemyHealthManager.hit_object == self:
			EnemyHealthManager.decreaseHealth(DamageAmmount)
			health_bar.value = EnemyHealthManager.currentHealth
		if EnemyHealthManager.currentHealth <= 0:
			$AnimatedSprite2D.play("death")
			collision_layer = 0
			$deathAnim.start()
		else:
			$AnimatedSprite2D.play("hit")


func _on_death_anim_timeout() -> void:
	queue_free()
