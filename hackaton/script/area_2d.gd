extends Area2D

@onready var transition_effect: Sprite2D = $TransitionEffect if has_node("TransitionEffect") else null

func _ready():
	connect("body_entered", _on_body_entered)  # Podłączamy sygnał
	print("Skrypt załadowany, wejście do mapy gotowe!")

func _on_body_entered(body):
	print("Wykryto wejście: ", body.name)  # Debugowanie

	if body.name == "player":  # Sprawdza, czy to gracz wszedł
		print("Gracz wszedł do wejścia!")  
		if transition_effect:
			transition_effect.visible = true  # Pokazuje efekt przejścia

		await get_tree().create_timer(0.1).timeout  # Krótkie opóźnienie
		var result = get_tree().change_scene_to_file("res://scene/mapa.tscn")  # Przeniesienie do mapy

		if result != OK:
			print("Błąd zmiany sceny! Kod błędu: ", result)
