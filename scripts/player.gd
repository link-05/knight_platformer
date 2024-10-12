extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const ROLL_MULT = 7;
var isAlive = true
var isPlayingDeath = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if(isAlive): 
	# the while loop will cause an error in loading due to excessive loop
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			animated_sprite_2d.play("jump")
			animation_player.play("jump")
			
		if Input.is_action_just_pressed("roll"):
			animated_sprite_2d.stop()
			if animated_sprite_2d.flip_h == true:
				animated_sprite_2d.play("roll")
				velocity.x = SPEED * ROLL_MULT * -1
			else:
				animated_sprite_2d.play("roll")
				velocity.x = SPEED * ROLL_MULT *  1
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("run_left", "run_right")
		if direction > 0: 
			animated_sprite_2d.play("run")
			animated_sprite_2d.flip_h = false;

		elif direction < 0:
			animated_sprite_2d.play("run")
			animated_sprite_2d.flip_h = true;
		
		#If there is a direction key pressed then it will move otherwise.
		if direction:
			velocity.x = direction * SPEED
		#Velocity is moved towards to 0 so the character movement stops.
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		#if velocity.x == 0 and velocity.y ==0:
			#animated_sprite_2d.play("idle")
		#This is the original problematic lines.

		move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")

func playDeath():
	if(isPlayingDeath == false):
		animated_sprite_2d.stop()
		isPlayingDeath = true
		isAlive = false
		animation_player.play("death")
		animated_sprite_2d.play("death")
