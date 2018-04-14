extends Area2D

func _ready():
	connect('area_enter', self, '_on_area_enter')

func _on_area_enter(other):
	if other.is_in_group('enemy'):
		get_tree().change_scene("res://Cenas/gameover.tscn")
