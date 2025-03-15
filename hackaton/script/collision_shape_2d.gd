extends CollisionShape2D

@export var mapa_scene: PackedScene = preload("res://scene/mapa.tscn")

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_packed(mapa_scene)
