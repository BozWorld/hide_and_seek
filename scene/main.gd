extends Node2D

@export var startTimer: Timer
@export var goToPoint: Area2D
@export var player: RigidBody2D
@export var menu: Control
@export var game_ui: RichTextLabel
@export var play_button: Button
@export var win_text: RichTextLabel
@export var retry_text: Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var instance = goal.instantiate()
	#add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	player.gamestarted = true
	goToPoint.visible = true
	var pos = Vector2(randi_range(20,200),randi_range(20,180))#Vector2(randf_range(0,get_viewport().get_visible_rect().size.x-10),randf_range(0,get_viewport().get_visible_rect().size.y-10))
	print(pos)
	goToPoint.position = pos
	startTimer.start()
	game_ui.visible = false
	play_button.visible = false
	pass # Replace with function body.


func _on_starting_timer_timeout() -> void:
	if player.alive == true :
		player.sleeping = true
		player.lock_rotation = true
		win_text.visible = true
		retry_text.visible = true
		player.gamestarted = false
	else :
		win_text.text = "you lose"
		win_text.visible = true
		retry_text.visible = true
	pass # Replace with function body.


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
