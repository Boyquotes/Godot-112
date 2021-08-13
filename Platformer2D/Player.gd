extends KinematicBody2D

var velocity = Vector2(0,0)

func _physics_process(dt):
	if Input.is_action_pressed("right"):
		velocity.x = 100
	elif Input.is_action_pressed("left"):
		velocity.x = -100
	elif Input.is_action_pressed("up"):
		velocity.y = -100
	elif Input.is_action_pressed("down"):
		velocity.y = 100
	#print(dt)
	move_and_slide(velocity)
	velocity.x = lerp(velocity.x, 0, 0.1)
	velocity.y = lerp(velocity.y, 0, 0.1)
