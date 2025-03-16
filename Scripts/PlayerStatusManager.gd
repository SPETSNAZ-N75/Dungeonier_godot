extends Node

var Health : float = 100
var Mana : float = 100
var Damage : float = 10

signal UpdatePSM

func _process(delta: float) -> void:
	UpdatePSM.connect(_Print)
	
func _Print() :
	print(Health)
