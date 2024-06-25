extends Node2D

var tokens = 0

var token_label
var add_token_button
var shop_button

func _ready():
	token_label = get_node("TokenLabel")
	update_token_label()

func update_token_label():
	token_label.text = "%d" % tokens

func _on_add_token_button_pressed():
	tokens += 10
	update_token_label()

func _on_shop_button_pressed():
	tokens -= 10
	update_token_label()
