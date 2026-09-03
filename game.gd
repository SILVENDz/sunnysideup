extends Node2D


var score_p1: int=0
var score_p2: int= 0

const BALL_SCENE = preload("res://ball.tscn")

@onready var label_score: Label=$score
@onready var label_score2: Label=$score2
@onready var spawn_point = $SpawnPoint
@onready var ball = $ball




func _on_ground_body_entered(body: Node2D) -> void:
	print("Something entered")
	if body.is_in_group("ball"):
		print("ball detected")
		award_point(2)
		respawn_new_ball(body)


func _on_ground_2_body_entered(body: Node2D) -> void:
	print("Something entered")
	if body.is_in_group("ball"):
		print("ball detected")
		award_point(1)
		respawn_new_ball(body)
	
func award_point(team_number: int) -> void:
	if team_number == 1:
		score_p1 +=1
		label_score.text= str(score_p1)
	elif team_number == 2:
		score_p2 +=1
		label_score2.text = str(score_p2)
		
	if score_p1 >= 21 or score_p2 >=21:
		get_tree().reload_current_scene()

func respawn_new_ball(old_ball: Node2D) -> void:
	old_ball.queue_free()
	
	var fresh_ball = BALL_SCENE.instantiate()
	fresh_ball.global_position = spawn_point.global_position
	add_child(fresh_ball)
	fresh_ball.sleeping=false
