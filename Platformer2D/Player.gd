extends KinematicBody2D

const speed = 200
const maxVelocity = 300
const gravity = 25
const jump = 900
var velocity = Vector2(0,0)
	
func _physics_process(dt):

	if Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.flip_h = true
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.1)
