extends CharacterBody2D

func _ready() -> void:
	get_node("AnimatedSprite2D").flip_h = true

func _physics_process(delta):
	var direction = Vector2.LEFT
	velocity = direction * 25
	move_and_slide()
