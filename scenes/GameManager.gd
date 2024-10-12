extends Node2D

@onready var label_coin = $InstructionLabelCoin
var score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func add_point():
	score+=1
	label_coin.text = "Try to collect \nas many coins \nas possible." + "\nCurrently\n" + score + " coins"
