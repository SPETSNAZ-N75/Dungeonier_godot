extends CharacterBody2D
@onready var health_bar: ProgressBar = $healthBar

@export var MaxHealth : int = 50
@export var Health : int = 50
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
