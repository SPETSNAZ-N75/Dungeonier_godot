extends CharacterBody2D
@onready var attack_timer: Timer = $AttackTimer
@onready var ray_cast: RayCast2D = $RayCast2D
@export var SPEED = 100
var Health = PSM.Health
var Mana = PSM.Mana
var DamageAmmount = PSM.Damage
var isDead : bool 
var hit_object:Object
var bIsAttacking:bool 
var canTakeDamage:bool = false

func player():
	pass	
func _ready() -> void:
	SignalManager.PlayerHit.connect(_take_Damage)
			
func Attack():
	$AnimatedSprite2D.play("new_animation")

func _physics_process(_delta: float) -> void:
	if !isDead :  
		# Get the input direction and handle the movement/deceleration.

		var direction := Input.get_vector("left", "right", "up", "down")
		var rot_vector := Input.get_vector("left", "right", "up", "down")
		
		if rot_vector == Vector2(1,0):
			ray_cast.rotation_degrees = 0
		elif rot_vector == Vector2(-1,0):
			ray_cast.rotation_degrees = 180
		elif rot_vector == Vector2(0,1):
			ray_cast.rotation_degrees = 90
		elif rot_vector == Vector2(0,-1):
			ray_cast.rotation_degrees = -90
	
		if direction == Vector2(0,0) && bIsAttacking== false:
			$AnimatedSprite2D.play("idle")
			
		if direction :
			direction = direction.normalized()
			velocity = direction * SPEED
			$AnimatedSprite2D.play("move")
			
			if direction.x > 0 :
				$AnimatedSprite2D.flip_h = false
			else: 
				$AnimatedSprite2D.flip_h = true
				
		else :
			velocity = Vector2.ZERO
			
		move_and_slide()
	
		if Input.is_action_just_pressed("use"):
			bIsAttacking = true
			attack_timer.start()
			$AnimatedSprite2D.play("attack")
			attack()
	
func _on_attack_timer_timeout() -> void:
	bIsAttacking = false
	
func attack():
	if ray_cast.is_colliding():
		hit_object = ray_cast.get_collider()
		SignalManager.HitObject = hit_object
		SignalManager._Hit.emit()
		
func _take_Damage() :
	var newhealth = PSM.Health - PSM.Damage
	PSM.Health = newhealth
	PSM.UpdatePSM.emit()
	if PSM.Health <= 0 :
		isDead = true
		SignalManager.GameOver.emit()
		hide()
	
