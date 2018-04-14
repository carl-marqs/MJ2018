extends Area2D

func _ready():
	connect('body_enter', self, '_on_body_enter')
	connect('body_exit', self, '_on_body_exit')

func _on_body_enter(other):
	if other.is_in_group('player'):
		other.get_node('noise').get_node('collision_noise').set_scale(Vector2(8,8))
		print('YESS')
		
func _on_body_exit(other):
	if other.is_in_group('player'):
		other.get_node('noise').get_node('collision_noise').set_scale(Vector2(1,1))
		
func transition(a, b, p):
	if p > 0:
		while a < b:
			a += b
			
			var t = Timer.new()
			t.set_wait_time(0.1)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			
			yield(t, "timeout")
		