extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if(velocity.y <= 0):
			#animated_sprite.animation = "Jump"
			animated_sprite.play("Jump")
		else:
			#animated_sprite.animation = "Fall"
			animated_sprite.play("Fall")
	else:
		if(velocity.x == 0):
			#animated_sprite.animation = "Idle"
			animated_sprite.play("Idle")
		else:
			#animated_sprite.animation = "Run"
			animated_sprite.play("Run")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		#flip when user change direction
		if (velocity.x<0):
			animated_sprite.flip_h = true
		elif (velocity.x>0):
			animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
