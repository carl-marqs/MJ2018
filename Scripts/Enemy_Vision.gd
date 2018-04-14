extends Area2D

func _ready():
	connect('area_enter', self, '_on_area_enter')

func _on_area_enter(other):
	get_tree().change_scene("res://Cenas/gameover.tscn")