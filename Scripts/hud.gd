extends CanvasGroup
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var healthBar : ProgressBar = $CanvasLayer/healthBar
@onready var manaBar : ProgressBar = $CanvasLayer/manaBar
@onready var score: Label = $CanvasLayer/Score
@onready var game_over_label: Label = $CanvasLayer/GameOverLabel
@onready var btn_main_menu: TouchScreenButton = $CanvasLayer/btn_MainMenu

func _ready() -> void:
	update()
	canvas_layer.visible = true
	PSM.UpdatePSM.connect(update)
	SignalManager.GameOver.connect(GameOver)
	game_over_label.hide()
	game_over_label.visible = false
	btn_main_menu.visible = false
	
func update():
	healthBar.value = PSM.Health
	manaBar.value = PSM.Mana
	score.text = str("SCORE: ", PSM.Score)
	
func GameOver():
	healthBar.hide()
	manaBar.hide()
	score.hide()
	game_over_label.show()
	game_over_label.visible = true
	btn_main_menu.visible = true

func _on_touch_screen_button_pressed() -> void:
	if game_over_label.visible == true :
		SignalManager.QueueFree.emit()
		var main_menu = load("res://Main.tscn")
		get_tree().change_scene_to_packed(main_menu)
