extends CanvasLayer

signal start_game
#show Start message
func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

#Show game over messsage
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Dodge the Bats for 60 Seconds!"
	$MessageLabel.show()
	
#Update score
func update_score(score):
	$ScoreLabel.text = str(score)
	
	
#Show you won
func show_you_win():
	show_message("You Win!!")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Play Again!"
	$MessageLabel.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
	
func _on_MessageTimer_timeout():
	$MessageLabel.hide()


