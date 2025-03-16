extends Node

var Health : float = 100
var Mana : float = 100
var Damage : float = 5
var Score : int = 0

signal UpdatePSM

func _ready() -> void:
	pass # UpdatePSM.connect(_Print)
	
func _Print() :
	print(Health)
