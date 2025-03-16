extends CanvasGroup
	
func _ready() -> void:
	SignalManager.GameOver.connect(GameOver)
	
func GameOver():
	queue_free()
