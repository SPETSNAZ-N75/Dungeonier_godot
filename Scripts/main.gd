extends CanvasGroup
@onready var cam : Camera2D = $CanvasLayer/Camera2D
@onready var timer: Timer = $CanvasLayer/Camera2D/Timer

func _ready() -> void:
	timer.start()

func _on_touch_screen_button_pressed() -> void:
	var game = preload("res://Scenes/Levels/world.tscn").instantiate()
	get_tree().get_root().add_child(game)
	get_tree().get_root().remove_child(self)


func _process(_delta: float) -> void:
	if cam.zoom != Vector2(1,1):
		cam.zoom = cam.zoom.lerp(Vector2(1,1), 0.001)
	
