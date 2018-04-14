extends KinematicBody2D

func _ready():
	get_node("vision").add_to_group('enemy')
	connect('area_enter', self, '_on_area_enter')

func _on_area_enter(other):
	get_tree().change_scene("res://Cenas/gameover.tscn")
