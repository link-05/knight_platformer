extends Area2D
@onready var game_manager = %gameManager
@onready var coin = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
	game_manager.add_point()
	animation_player.play("pick_up")
	
