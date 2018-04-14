extends KinematicBody2D

export var MOTION_SPEED = 120

var rayNode

func _ready():
	set_process(true)
	add_to_group('player')
	rayNode = get_node('ray')

func _process(delta):
	var motion = Vector2()
	
	if Input.is_key_pressed(KEY_W) or Input.is_action_pressed('ui_up'):
		motion += Vector2(0, -1)
		get_node('sprite').set_rotd(180)
		get_node('sprite').play('moving')
		get_node('collision').set_rotd(180-90)
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed('ui_right'):
		motion += Vector2(1, 0)
		get_node('sprite').set_rotd(90)
		get_node('sprite').play('moving')
		get_node('collision').set_rotd(90-90)
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed('ui_down'):
		motion += Vector2(0, 1)
		get_node('sprite').set_rotd(0)
		get_node('sprite').play('moving')
		get_node('collision').set_rotd(0-90)
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed('ui_left'):
		motion += Vector2(-1, 0)
		get_node('sprite').set_rotd(270)
		get_node('sprite').play('moving')
		get_node('collision').set_rotd(270-90)
		
	if !Input.is_key_pressed(KEY_W) and !Input.is_key_pressed(KEY_D) and !Input.is_key_pressed(KEY_S) and !Input.is_key_pressed(KEY_A) and !Input.is_action_pressed('ui_up') and !Input.is_action_pressed('ui_right') and !Input.is_action_pressed('ui_down') and !Input.is_action_pressed('ui_left'):
		get_node('sprite').play('idle')
		
	motion = motion.normalized() * MOTION_SPEED * delta
	move(motion)
