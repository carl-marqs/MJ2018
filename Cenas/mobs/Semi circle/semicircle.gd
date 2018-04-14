extends KinematicBody2D
export var MOTION_SPEED = 200


const DETECT_RADIUS = 100
const FOV = 50

var angle = 0
var direction = Vector2()
var rayNode


func _ready():
	set_fixed_process(true)
	set_process(true)
	rayNode = get_node('ray')

	

func _process(delta):
	var motion = Vector2()
	motion = motion.normalized() * MOTION_SPEED * delta
	move(motion)


func _fixed_process(delta):
	var pos = get_pos()
	direction = pos.normalized()
	angle = 90

	var detect_count= 0
	for node in get_tree().get_nodes_in_group('detectable'):
		if pos.distance_to(node.pos) < DETECT_RADIUS:
			var angle_to_node = rad2deg(direction.angle_to(node.direction_from_player))
			if abs(angle_to_node) < FOV/2:
				detect_count += 1


	# DRAWING
	if detect_count > 0:
		draw_color = RED
	else:
		draw_color = YELLOW
	update()


# Drawing the FOV
const YELLOW = Color(0.929, 0.913, 0.227, 1)
const RED = Color(1, 0, 0, 0.4)

var draw_color = YELLOW


func _draw():
	draw_circle_arc_poly(Vector2(), DETECT_RADIUS,  angle - FOV/2, angle + FOV/2, draw_color)


func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = Vector2Array()
    points_arc.push_back(center)
    var colors = ColorArray([color])

    for i in range(nb_points+1):
        var angle_point = angle_from + i*(angle_to-angle_from)/nb_points
        points_arc.push_back(center + Vector2( cos( deg2rad(angle_point) ), sin( deg2rad(angle_point) ) ) * radius)
    draw_polygon(points_arc, colors)