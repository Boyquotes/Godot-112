extends Area2D


func _on_coin_body_entered(body):
	if body.name == "Player":
		$CollisionShape2D.queue_free()
		body.add_coin(1)
		$AnimationPlayer.play("BounceUp")


func _on_AnimationPlayer_animation_finished(anim_name):
	
	queue_free()
