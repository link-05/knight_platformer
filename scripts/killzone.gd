extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("You have died")
	Engine.time_scale = 0.6
	#body.get_node("CollisionShape2D").queue_free()
	body.playDeath()
	# The timer will start to return time scale to normal
	# and reset the player
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
