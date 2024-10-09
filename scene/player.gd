extends RigidBody2D

var canmove: bool = false
var gamestarted: bool = false
@export var speed: float
var alive: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canmove == true and gamestarted == true : 
		var dir = get_viewport().get_mouse_position() - position
		apply_impulse(dir*speed*delta,self.position)
		pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			canmove = true
	if event is InputEventMouseButton and event.is_released():
		if event.button_index == MOUSE_BUTTON_LEFT :
			canmove = false


func _on_go_to_zone_body_entered(body: Node2D) -> void:
	alive = true
	pass # Replace with function body.

func _on_go_to_zone_body_exited(body: Node2D) -> void:
	alive = false
	pass # Replace with function body.
