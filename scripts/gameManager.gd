extends Node2D
@onready var invis_gate: TileMapLayer = $"../TileMap/InvisGate"
@onready var label_coin = $InstructionLabelCoin
var score = 0
@onready var instruction_label_game_over: Label = $"../Labels/InstructionLabelGameOver"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func add_point():
	score+=1
	if(score == 5):
		invis_gate.visible = false
		invis_gate.collision_enabled = false
	if(score == 7):
		instruction_label_game_over.visible = true
	
	label_coin.text = "Try to collect \nas many coins \nas possible.\nCurrently\n" + str(score) + " coins"
