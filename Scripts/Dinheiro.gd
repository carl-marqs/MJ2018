extends Label

export var dinheiro = 0 setget get_score

func _ready():
	pass

func get_score(new_value):
	dinheiro = Singleton.dinheiro
	self.set_text(str(dinheiro))
