extends Node2D


func spawn_enemy_fish():
	var new_enemy_fish = preload("res://scenes/enemy_fish.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy_fish.global_position = %PathFollow2D.global_position
	add_child(new_enemy_fish)


func _on_timer_timeout() -> void:
	spawn_enemy_fish()


func _on_fish_fish_eaten() -> void:
	$Gameover.visible = true
	get_tree().paused = true


func _on_fish_winner() -> void:
	$Winner.visible = true
	get_tree().paused = true
