extends KinematicBody2D

export var MOTION_SPEED = 140

var rayNode

func _ready():
	set_physics_process(true)
	rayNode = get_node('ray')

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed('ui_up'):
		motion += Vector2(0, -1)
		rayNode.set_rotd(180)
	if Input.is_action_pressed('ui_right'):
		motion += Vector2(1, 0)
		rayNode.set_rotd(90)
	if Input.is_action_pressed('ui_down'):
		motion += Vector2(0, 1)
		rayNode.set_rotd(0)
	if Input.is_action_pressed('ui_left'):
		motion += Vector2(-1, 0)
		rayNode.set_rotd(270)
		
	motion = motion.normalized() * MOTION_SPEED * delta
	move(motion)