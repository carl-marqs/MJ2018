extends Area2D

func _ready():
	connect('body_enter', self, '_on_body_enter')

func _on_body_enter(other):
	if other.is_in_group('player'):
		Singleton.dinheiro += 1
		
		var root = get_tree().get_root()
		var root2 = root.get_child( root.get_child_count()-1 )
		root2.find_node('dinheiro').dinheiro = Singleton.dinheiro
		
		queue_free()
