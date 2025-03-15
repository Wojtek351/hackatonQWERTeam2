extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func graj_on_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/rynek.tscn")


func opcje_on_opcje_pressed() -> void:
	print(1,2)


func _on_wyjdź_pressed() -> void:
	get_tree().quit()
	
