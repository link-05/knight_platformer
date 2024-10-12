extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var left_ray_cast_2d = $Left_RayCast2D
@onready var right_ray_cast_2d = $Right_RayCast2D
var direction = 1
const SPEED = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(left_ray_cast_2d.is_colliding()):
		animated_sprite_2d.flip_h = false
		direction = 1
	elif(right_ray_cast_2d.is_colliding()):
		animated_sprite_2d.flip_h = true
		direction = -1
		
	position.x += delta * SPEED * direction
