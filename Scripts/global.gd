extends Node

var score : int = 0
var credits : int = 1

# Variable for store a direction from inputs. It is more efficent, because, it will not create a 
# new variable with every function call.
var axis : Vector2

# Get direction from inputs
func get_axis() -> Vector2 :
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
