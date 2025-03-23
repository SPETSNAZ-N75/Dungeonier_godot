extends Node

var Health : float = 100
var Mana : float = 100
var Damage : float = 1
var Score : int = 0
var HighScore : int = 0 

signal UpdatePSM

func _ready() -> void:
	SignalManager.GameOver.connect(_reset)
	
func AddHealth(val) :
	print("Health Added : ", val)
func AddMana(val) :
	print("Mana Added : ", val)
	
func _Print() :
	print("PSM : SUCCESS")

func _reset() :
	Health = 100
	Mana = 100
	HighScore = Score
