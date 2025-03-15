extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $".".get_rect().has_point(to_local(event.position)):
			get_tree().change_scene_to_file("res://scene/muzeumlezaj.tscn")
