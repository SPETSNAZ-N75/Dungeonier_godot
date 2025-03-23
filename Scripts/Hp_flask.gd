extends AnimatedSprite2D
@export var Big : bool = false
@export var val_big : int = 50
@export var val_small : int = 25
@onready var Trigger : Area2D = $Area2D

func _ready() -> void:
	if Big:
		play("hp_flask_big")
	else :
		play("hp_flask_small")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		if Big:
			PSM.AddHealth(val_big)
		else :
			PSM.AddHealth(val_small)

		
