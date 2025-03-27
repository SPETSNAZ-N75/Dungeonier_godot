extends Node2D

@export var North : bool = true
@export var East : bool = false
@export var South : bool = false
@export var West : bool = false

func _ready() -> void:
	if North :
		East = false
		South = false
		West = false
	elif East :
		North = false
		South = false
		West = false
	elif South :
		North = false
		East = false
		West = false
	elif West :
		North = false
		East = false
		South = false
		
	SignalManager._Hit.connect(_on_area_2d_body_entered)
	
func SetTexture():
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		$StaticBody2D/CollisionShape2D.disabled = true
		$StaticBody2D/Sprite2D/Area2D/CollisionShape2D.disabled = true
