extends Node

var maxHealth : int = 50
var currentHealth : int
signal onHealthChange

func _ready() -> void:
	currentHealth = maxHealth
	
func decreaseHealth(healthAmmount : int):
	currentHealth -= healthAmmount
	
	if currentHealth < 0 :
		currentHealth = 0
	
	print("Health Decreased")
	onHealthChange.emit(currentHealth)
	
func increaseHealth(healthAmmount : int):
	if currentHealth > maxHealth :
		currentHealth = maxHealth
	
	print("Health Increased")
	onHealthChange.emit(currentHealth)
