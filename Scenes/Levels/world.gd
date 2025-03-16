extends Node2D

func _ready() -> void:
	SignalManager.QueueFree.connect(queue_free)
