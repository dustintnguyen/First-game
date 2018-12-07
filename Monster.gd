extends RigidBody2D


export (int) var min_speed #minimum speed range
export (int) var max_speed #max speed range
var mod_type = ["1", "2", "3", "4", "5", "6", "7", "8"]

func _ready():
	var mod_type = ["1", "2", "3", "4", "5", "6", "7", "8"]
	$AnimatedSprite.animation = mod_type[randi() % mod_type.size()]


func _on_VisibilityEnabler2D_screen_exited():
	queue_free()

