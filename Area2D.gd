extends Area2D
signal hit
# This spript contorls movement
var screensize
export (int) var speed = 400
var motion = Vector2()
var m = Transform2D()

func _ready():
	hide()
	screensize = get_viewport_rect().size
	
	

func _process(delta):
	var motion = Vector2()
	if Input.is_action_pressed('ui_right'):
		motion.x += 1
	if Input.is_action_pressed('ui_left'):
		motion.x -= 1
	if  Input.is_action_pressed('ui_down'):
		motion.y += 1
	if  Input.is_action_pressed('ui_up'):
		motion.y -= 1
	if motion.length() > 0 :
		motion = motion.normalized() * speed
		$Sprite.play()
	else:
		$Sprite.stop()
	# Position of ship, ship can't leave screen
	position += motion * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	# flips ship to face down
	if motion.y != 0:
    	$Sprite.flip_v = motion.y > 0

func _on_Player_body_entered(body):
	$CollisionShape2D.disabled = true
	hide() # Player disappears after being hit.
	emit_signal('hit')
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
