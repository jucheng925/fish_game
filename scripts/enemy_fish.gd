extends CharacterBody2D

var scale_percentage = randi() % 6

func _ready() -> void:
	scale *= (0.5 * scale_percentage)

func _physics_process(delta):
	var direction = Vector2.LEFT
	velocity = direction * 25
	move_and_slide()
