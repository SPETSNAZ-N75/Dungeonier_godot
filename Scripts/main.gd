extends CanvasGroup

func _ready() -> void:
	pass
	
	


func _on_touch_screen_button_pressed() -> void:
	var game = preload("res://Scenes/Levels/world.tscn").instantiate()
	get_tree().get_root().add_child(game)
	get_tree().get_root().remove_child(self)
