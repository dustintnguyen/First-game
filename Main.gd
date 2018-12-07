extends Node

export (PackedScene) var Monster 

var score


func _ready():
	randomize() 
	
func new_game():
	score = 0
	$HUD.update_score(score)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready!")
	
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Player.hide()
	

func win_game():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_you_win()
	$Player.hide()
	

func add_laser(pos, dir):
	var l = preload("res://Laser.tscn").instance()
	l.start_at(pos, dir)
	$Laser.add_child(l)


func _on_MobTimer_timeout():
	#Choose a random location
	$MobPath/MobSpawnLocation.set_offset(randi())
	#Crate  a Mob instance and add it to the scene.
	var Monster = preload("res://Monster.tscn").instance()
	add_child(Monster)
	# Set the mob's direction perpendicular to the path direction.
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	# Set the mob's position to a random location.
	Monster.position = $MobPath/MobSpawnLocation.position
	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	Monster.rotation = direction
	# Choose the velocity.
	Monster.set_linear_velocity(Vector2(rand_range(Monster.min_speed, Monster.max_speed), 0).rotated(direction))
	

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()




func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	if score >= 60:
		win_game()
