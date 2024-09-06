extends CharacterBody2D

signal fish_eaten
signal winner

var num_of_meal = 0

func _physics_process(delta):
	const VERTICAL_SPEED = 50
	const CONSTANT_SPEED = 25
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
		
	velocity = direction * VERTICAL_SPEED
	velocity.x = CONSTANT_SPEED
	move_and_slide()
	
	
	
func eat_food():
	if scale < Vector2(2.6, 2.6):
		num_of_meal += 1
		%ProgressBar.value = num_of_meal
		if num_of_meal == 3:
			num_of_meal = 0
			%ProgressBar.value = num_of_meal
			scale *= 1.2
	else:
		winner.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.scale <= scale:
		body.queue_free()
		eat_food()
			
	else:
		fish_eaten.emit()
