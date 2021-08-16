extends KinematicBody2D

const speed = 180
const maxVelocity = 300
const gravity = 31
const jump = 600
export var coins = 0
export var maxCoins = 3

var velocity = Vector2(0,0)

signal update_coin_counter(coins)

func _physics_process(dt):
	if Input.is_action_pressed("right"):
		velocity.x = speed*100*dt
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x = -speed*100*dt
		$Sprite.flip_h = true
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump*100*dt
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.1)


func _on_FallZone_body_entered(body):
	if body.name == "Player":
		print("Game Over")
		get_tree().change_scene("res://Level1.tscn")

func add_coin(num):
	coins += num
	emit_signal("update_coin_counter", coins)
	if coins == maxCoins:
		get_tree().change_scene("res://Level1.tscn")
	return coins
		
