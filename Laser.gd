extends RigidBody2D
var motion = Vector2()
export var speed = 500
signal shoot(laser, dir, pos)

func _ready():
	
	pass
	
func start_at(pos, dir):
	position = pos
	rotation = dir
	motion = Vector2(speed, 0).rotated(dir)
	

func _fixed_process(delta):
	position += motion * delta


func _on_Laser_body_entered(body):
	if body.name == "Monster":
		queue_free()


func _on_Visibility_screen_exited():
	queue_free()
