extends Node2D

var tokens = 0

var token_label
var timer_label
var add_token_button
var shop_button
var pomodoro_timer
var kosten_label
var kosten_label_tekst
var informatie_label

var total_time = 25 * 60  # 25 minuten in seconden
var remaining_time = total_time
var timer_active = false

func _ready():
	token_label = get_node("TokenLabel")
	timer_label = get_node("TimerLabel")
	pomodoro_timer = timer_label.get_node("PomodoroTimer")
	update_token_label()
	update_timer_label()
	
	kosten_label = get_node("kosten_label")
	informatie_label = get_node("informatie_label")
	kosten_label.visible = false
	informatie_label.visible = false

func update_token_label():
	token_label.text = "%d" % tokens

func _on_add_token_button_pressed():
	tokens += 10
	update_token_label()

func _on_snack_button_pressed():
	if tokens >= 50:
		tokens -= 50
		update_token_label()
	else:
		return

func _on_gamen_button_pressed():
	if tokens >= 30:
		tokens -= 30
		update_token_label()
	else:
		return

func _on_start_button_pressed():
	if not timer_active:
		pomodoro_timer.start()
		timer_active = true

func _on_pomodoro_timer_timeout():
	if remaining_time > 1498:
		remaining_time -= 1499
		update_timer_label()
	else:
		timer_active = false
		OS.alert("Focus tijd is klaar!", "Melding")
		tokens += 10
		update_token_label()
		pomodoro_timer.stop()
	
		
func _on_resetbutton_pressed():
	pomodoro_timer.stop()
	remaining_time = total_time
	timer_active = false
	update_timer_label()
		
func update_timer_label():
	var minutes = remaining_time / 60
	var seconds = remaining_time % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]

func _on_gamen_button_mouse_entered():
	kosten_label.text = "30"
	informatie_label.text = "Eén uur gamen"
	kosten_label.visible = true
	informatie_label.visible = true

func _on_gamen_button_mouse_exited():
	kosten_label.visible = false
	informatie_label.visible = false

func _on_snack_button_mouse_entered():
	kosten_label.text = "50"
	informatie_label.text = "Eén snack bijv. koekje of snoepje"
	kosten_label.visible = true
	informatie_label.visible = true

func _on_snack_button_mouse_exited():
	kosten_label.visible = false
	informatie_label.visible = false
