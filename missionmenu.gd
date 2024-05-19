extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ammocount.text = str(Global.ammo)
	$constmatscount.text = str(Global.constmats)
	$rationscount.text = str(Global.ration)
	$partscount.text = str(Global.parts)
	$moneycount.text = str(Global.money)
	$dianum.text = str(Global.day)
	missioninprogress()
	
	




func _on_hqbtn_pressed():
	get_tree().change_scene_to_file("res://headquarters.tscn")
	
func missioninprogress():
		if Global.mission1inprog == 1:
			$missionpanel1/inprogress.show()
		else:
			$missionpanel1/inprogress.hide()
		if Global.mission2inprog == 1:
			$missionpanel2/inprogress.show()
		else:
			$missionpanel2/inprogress.hide()
		if Global.mission3inprog == 1:
			$missionpanel3/inprogress.show()
		else:
			$missionpanel3/inprogress.hide()


func _on_masinfobtn_pressed():
	$fadescreenbg.show()
	$missioninfo1.show()


func _on_gobackbtn_pressed():
	$fadescreenbg.hide()
	$missioninfo1.hide()


func _on_masinfobtn2_pressed():
	$fadescreenbg.show()
	$missioninfo2.show()


func _on_gobackbtn2_pressed():
	$fadescreenbg.hide()
	$missioninfo2.hide()


func _on_masinfobtn3_pressed():
	$fadescreenbg.show()
	$missioninfo3.show()


func _on_gobackbtn3_pressed():
	$fadescreenbg.hide()
	$missioninfo3.hide()


func _on_gobacksquadbtn1_pressed():
	$fadescreenbg.hide()
	$missionbrief1.hide()


func _on_asignarescbtn_pressed():
	$fadescreenbg.show()
	$missionbrief1.show()


func _on_asignarescbtn2_pressed():
	$fadescreenbg.show()
	$missionbrief2.show()




func _on_gobacksquadbtn2_pressed():
	$fadescreenbg.hide()
	$missionbrief2.hide()


func _on_asignarescbtn3_pressed():
	$fadescreenbg.show()
	$missionbrief3.show()


func _on_gobacksquadbtn3_pressed():
	$fadescreenbg.hide()
	$missionbrief3.hide()


func _on_startmission_pressed():
	$fadescreenbg.hide()


func _on_enddaybtn_pressed():
	Global.day = Global.day + 1
	for n in Global.currentmissions.size():
		Global.currentmissions[n][5] = Global.currentmissions[n][5] - 1
		if Global.currentmissions[n][5] == 0:
			if Global.currentmissions[n][6] == 1:
				Global.mission1inprog = 0
			if Global.currentmissions[n][6] == 2:
				Global.mission2inprog = 0
			if Global.currentmissions[n][6] == 3:
				Global.mission3inprog = 0
			Global.ammo = Global.ammo + Global.currentmissions[n][0]
			Global.ration = Global.ration + Global.currentmissions[n][1]
			Global.constmats = Global.constmats + Global.currentmissions[n][2]
			Global.parts = Global.parts + Global.currentmissions[n][3]
			Global.money = Global.money + Global.currentmissions[n][4]
		
