extends Area2D

func _ready():
	connect('body_enter', self, '_on_body_enter')

func _on_body_enter(other):
	if other.is_in_group('player'):
		queue_free()