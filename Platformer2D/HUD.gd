extends CanvasLayer

export var coins = 0

func _ready():
	$Label.text = "x 0"

func _on_Player_update_coin_counter(coins):
	$Label.text = "x " + str(coins)
