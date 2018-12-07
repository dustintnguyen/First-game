extends KinematicBody2D

signal hit
# This spript contorls movement
var screensize
export (int) var speed = 200
var motion = Vector2()
var m = Transform2D()

func _ready():
    screensize = get_viewport_rect().size
	

func get_input():
	motion = Vector2()
	if Input.is_action_pressed('ui_right'):
		motion.x += 1
	if Input.is_action_pressed('ui_left'):
		motion.x -= 1
	if  Input.is_action_pressed('ui_down'):
		motion.y += 1
	if  Input.is_action_pressed('ui_up'):
		motion.y -= 1
	
	motion = motion.normalized() * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide(motion)
	position += motion * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if motion.y != 0:
    	$Sprite.flip_v = motion.y > 0