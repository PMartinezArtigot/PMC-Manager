extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_btn_pressed():
	$changedayanim.modulate.a8 = 0
	$changedayanim.show()
	for i in range (0, 255, 15):
		await get_tree().create_timer(0.05).timeout
		$changedayanim.modulate.a8 = i
	$changedayanim.modulate.a8 = 255
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://missionmenu.tscn")


func _on_backbtn_pressed():
	$fadescreenbg.hide()
	$contextinfo.hide()


func _on_infocontextbtn_pressed():
	$fadescreenbg.show()
	$contextinfo.show()
