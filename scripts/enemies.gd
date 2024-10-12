extends Node2D
const SPEED = 60
var direction = 1
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var right_ray_cast_2d = $RightRayCast2D
@onready var left_ray_cast_2d = $LeftRayCast2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(right_ray_cast_2d.is_colliding()):
		direction = -1
		animated_sprite_2d.flip_h = true
	elif(left_ray_cast_2d.is_colliding()):
		direction = 1
		animated_sprite_2d.flip_h = false
		
	position.x += direction * delta * SPEED
