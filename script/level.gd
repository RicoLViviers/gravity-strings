extends Node2D

# Current gravity direction (default down)
var gravity_direction: Vector2 = Vector2.DOWN

# Signal to notify rigid bodies
signal gravity_changed(new_gravity: Vector2)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	handle_input()

# Change gravity based on input
func handle_input() -> void:
	if Input.is_action_just_pressed("dir_up"):
		change_gravity(Vector2.UP)
	elif Input.is_action_just_pressed("dir_down"):
		change_gravity(Vector2.DOWN)
	elif Input.is_action_just_pressed("dir_left"):
		change_gravity(Vector2.LEFT)
	elif Input.is_action_just_pressed("dir_right"):
		change_gravity(Vector2.RIGHT)

# Manual setter function
func change_gravity(new_direction: Vector2) -> void:
	gravity_direction = new_direction
	emit_signal("gravity_changed", gravity_direction)
