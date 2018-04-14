extends KinematicBody2D

func _ready():
	connect('body_entered', self, '_on_area_enter')

func _on_area_enter(other):
	get_tree().change_scene("res://Cenas/gameover.tscn")