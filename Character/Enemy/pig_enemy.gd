extends CharacterBody2D


const SPEED = 100
const AREA_WIDTH = 170

var direction = 1
var initial_position = Vector2()
@onready var animated_Sprite = $AnimatedSprite2D

func _ready():
	initial_position = position

func _physics_process(delta):
	# Move the enemy back and forth
	var velocity = Vector2(SPEED * direction, 0)
	var motion = velocity * delta
	move_and_collide(motion)

	# Change direction when the enemy reaches the edge of the area
	if abs(position.x - initial_position.x) > AREA_WIDTH / 2:
		direction *= -1
		animated_Sprite.flip_h = not animated_Sprite.flip_h

