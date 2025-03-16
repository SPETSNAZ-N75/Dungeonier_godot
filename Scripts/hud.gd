extends CanvasGroup
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var healthBar : ProgressBar = $CanvasLayer/healthBar
@onready var manaBar : ProgressBar = $CanvasLayer/manaBar

func _ready() -> void:
	canvas_layer.visible = true
	update()
	PSM.UpdatePSM.connect(update)
	
func update():
	healthBar.value = PSM.Health
	manaBar.value = PSM.Mana
