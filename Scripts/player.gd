extends CharacterBody2D
@onready var attack_timer: Timer = $AttackTimer
@onready var ray_cast: RayCast2D = $RayCast2D

@export var SPEED = 100
var health = 100.0
var mana = 100.0
var damage = 5.0

signal hit(collider)
var hit_object:Object

var bIsAttacking:bool 

func Attack():
	$AnimatedSprite2D.play("new_animation")

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	
	var rot_vector := Input.get_vector("left", "right", "up", "down")
	
	if rot_vector == Vector2(1,0):
		ray_cast.rotation_degrees = 0
	elif rot_vector == Vector2(-1,0):
		ray_cast.rotation_degrees = 180
	elif rot_vector == Vector2(0,1):
		ray_cast.rotation_degrees = 90
	elif rot_vector == Vector2(0,-1):
		ray_cast.rotation_degrees = -90
	
	if direction_x == 0 && direction_y == 0 && bIsAttacking== false:
		$AnimatedSprite2D.play("idle")
	if direction_x :
		velocity.x = direction_x * SPEED #+ delta
		$AnimatedSprite2D.play("move")
		if direction_x > 0 :
			$AnimatedSprite2D.flip_h = false
		else: 
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction_y :
		velocity.y = direction_y * SPEED #+ delta 
		$AnimatedSprite2D.play("move")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
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
