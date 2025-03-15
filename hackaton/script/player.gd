extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D  # Pobranie kamery
@onready var tile_map: TileMap = $"../TileMap"  # Pobranie TileMap (upewnij się, że ścieżka jest poprawna!)
@onready var static_body_2d_2: StaticBody2D = $"../StaticBody2D2"
@onready var npc_4_interact: StaticBody2D = $"../npc4interact"

var speed = 100
var player_state = "idle"
var state = "front"
var in_area = 0
var in_area_npc4 = 0



func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")

	# Ustalanie stanu gracza
	if direction == Vector2.ZERO:
		player_state = "idle"
	else:
		player_state = "walking"

	velocity = direction * speed
	move_and_slide()
	play_anim(direction)
	
	if (Input.is_action_just_pressed("interact")) and (in_area == 1):
		get_tree().change_scene_to_file("res://scene/mapa.tscn")
		in_area = 0
		
		
	#dialog z npc4 (staruszek przy pomniku)
	if (Input.is_action_just_pressed("interact")) and (in_area_npc4 == 1):
		print("asdfsad")
		in_area_npc4 = 0
		
	if in_area == 0:
		static_body_2d_2.hide()
	
	if in_area == 1:
		static_body_2d_2.show()
		
	if in_area_npc4 == 0:
		npc_4_interact.hide()
	
	if in_area_npc4 == 1:
		npc_4_interact.show()
		
func player():
	pass

func play_anim(dir):
	if player_state == "idle":
		match state:
			"front":
				animated_sprite_2d.play("idle-front")
			"back":
				animated_sprite_2d.play("idle-back")
			"side":
				animated_sprite_2d.play("idle-side")
	else: 
		if dir.y == -1:
			animated_sprite_2d.play("walk-back")
			state = "back"
		elif dir.y == 1:
			animated_sprite_2d.play("walk-front")
			state = "front"
		elif dir.x == 1:
			animated_sprite_2d.play("walk-side")
			animated_sprite_2d.flip_h = false
			state = "side"
		elif dir.x == -1:
			animated_sprite_2d.play("walk-side")
			animated_sprite_2d.flip_h = true
			state = "side"

# 🔹 Dynamicznie ustawia limity kamery na podstawie TileMap


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		in_area = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		in_area = 1
	


func _in_area_npc_entered(body: Node2D) -> void:
	if body.has_method("player"):
		in_area_npc4 = 1


func _in_area_npc_exited(body: Node2D) -> void:
	if body.has_method("player"):
		in_area_npc4 = 0
