extends Area2D

export(String, FILE, '*.tscn') var nextScene

func _ready():
	connect('body_enter', self, '_on_body_enter')

func _on_body_enter(other):
	if other.is_in_group('player'):
		get_tree().change_scene(nextScene)