extends AnimatedSprite2D
@export var Player : Object
@export var HP : bool = false
@export var MP : bool = false
@export var Big : bool = false
@export var Small : bool = false
@onready var Trigger : Area2D = $Area2D

func _ready() -> void:
	if HP :
		if Big :
			if Trigger.overlaps_body(PLAYER):
				PSM.AddHealth()
