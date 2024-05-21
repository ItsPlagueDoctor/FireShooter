extends Control

@onready var MC = $"../"


func _on_resume_pressed():
	MC.pauseMenu()



func _on_quit_pressed():
	get_tree().quit()


