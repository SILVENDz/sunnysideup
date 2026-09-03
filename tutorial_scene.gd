extends Node2D


const title_screen = preload("res://title_screen.tscn")
const tutorial_scene = preload("res://tutorial_scene.tscn")
const game = preload("res://game.tscn")
@onready var animation_player: AnimationPlayer=$AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end_tut"):
		get_tree().change_scene_to_file("res://game.tscn")
