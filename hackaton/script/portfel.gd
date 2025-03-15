extends StaticBody2D

var player_in_range=false

func _ready() -> void:
	print(check.check_portfel)

func _process(delta: float) -> void:
	if player_in_range:
		if Input.is_action_just_pressed("interact"):
			check.check_portfel=true
			queue_free()
			print("masz portfel")
			print(check.check_portfel)

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range=true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range=false
