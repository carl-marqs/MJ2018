extends KinematicBody2D

func _ready():
	connect('body_entered', self, '_on_area_enter')

func _on_area_enter(other):
	print('Hello!')