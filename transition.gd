extends CanvasLayer

const title_screen = preload("res://title_screen.tscn")
const tutorial_scene = preload("res://tutorial_scene.tscn")
@onready var animation_player: AnimationPlayer=$AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("start_game"):
		start_transition()
	
func start_transition() -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(tutorial_scene)
	animation_player.play("fade_2")
	await animation_player.animation_finished
	
	
	
