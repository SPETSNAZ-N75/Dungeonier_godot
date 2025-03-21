extends CanvasGroup
@onready var cam : Camera2D = $CanvasLayer/Camera2D
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer

func _ready() -> void:
	animation_player.play("anim_0")
	$Timer.start()
func _on_touch_screen_button_pressed() -> void:
	var game = preload("res://Scenes/Levels/world.tscn").instantiate()
	get_tree().get_root().add_child(game)
	get_tree().get_root().remove_child(self)

func random_anim():
	var rand = randi_range(0,3)
	$Timer.start()
	if rand == 0 :
		animation_player.stop()
		animation_player.play("anim_1")
	elif rand == 1 :
		animation_player.stop()
		animation_player.play("anim_2")
	elif rand == 2 :
		animation_player.stop()
		animation_player.play("anim_3")
	elif rand == 3 :
		animation_player.stop()
		animation_player.play("anim_4")
	


func _on_timer_timeout() -> void:
	random_anim()
	
