extends CanvasGroup
@onready var health: ProgressBar = $CanvasLayer/healthBar
@onready var mana: ProgressBar = $CanvasLayer/ProgressBar
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	canvas_layer.visible = true
func update():
	pass
