extends Area2D

func _ready():
	connect('area_enter', self, '_on_area_enter')

func _on_area_enter(other):
	print('You died!')