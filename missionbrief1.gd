extends Panel

var rng = RandomNumberGenerator.new()
var idk: float = 0
var totalHC: float = 0
var squadselected = 0

# Called when the node enters the scene tree for the first time.
#0. name 1. CA 2. HP 3. helmet 4. vest
#5. uniform 6. weapon 7.STR 8. ID 9. STL
#10. MED 11. ENG 12. hab 13. assigned squad
func _ready():
	$soldier1/name.text = Global.squad1[0][0]
	$soldier1/STR.text = Global.squad1[0][7]
	$soldier1/ID.text = Global.squad1[0][8]
	$soldier1/STL.text = Global.squad1[0][9]
	$soldier1/MED.text = Global.squad1[0][10]
	$soldier1/ENG.text = Global.squad1[0][11]
	$soldier1/hp.text = str(Global.squad1[0][2])
	$soldier1/hpbar.size.x = Global.squad1[0][2] * 1.5
	$soldier1/HClbl2.text = str(Global.squad1[0][1])
	$soldier2/name.text = Global.squad1[1][0]
	$soldier2/STR.text = Global.squad1[1][7]
	$soldier2/ID.text = Global.squad1[1][8]
	$soldier2/STL.text = Global.squad1[1][9]
	$soldier2/MED.text = Global.squad1[1][10]
	$soldier2/ENG.text = Global.squad1[1][11]
	$soldier2/hp.text = str(Global.squad1[1][2])
	$soldier2/hpbar.size.x = Global.squad1[1][2] * 1.5
	$soldier2/HClbl2.text = str(Global.squad1[1][1])
	$soldier3/name.text = Global.squad1[2][0]
	$soldier3/STR.text = Global.squad1[2][7]
	$soldier3/ID.text = Global.squad1[2][8]
	$soldier3/STL.text = Global.squad1[2][9]
	$soldier3/MED.text = Global.squad1[2][10]
	$soldier3/ENG.text = Global.squad1[2][11]
	$soldier3/hp.text = str(Global.squad1[2][2])
	$soldier3/hpbar.size.x = Global.squad1[2][2] * 1.5
	$soldier3/HClbl2.text = str(Global.squad1[2][1])
	$soldier4/name.text = Global.squad1[3][0]
	$soldier4/STR.text = Global.squad1[3][7]
	$soldier4/ID.text = Global.squad1[3][8]
	$soldier4/STL.text = Global.squad1[3][9]
	$soldier4/MED.text = Global.squad1[3][10]
	$soldier4/ENG.text = Global.squad1[3][11]
	$soldier4/hp.text = str(Global.squad1[3][2])
	$soldier4/hpbar.size.x = Global.squad1[3][2] * 1.5
	$soldier4/HClbl2.text = str(Global.squad1[3][1])
	$soldier5/name.text = Global.squad1[4][0]
	$soldier5/STR.text = Global.squad1[4][7]
	$soldier5/ID.text = Global.squad1[4][8]
	$soldier5/STL.text = Global.squad1[4][9]
	$soldier5/MED.text = Global.squad1[4][10]
	$soldier5/ENG.text = Global.squad1[4][11]
	$soldier5/hp.text = str(Global.squad1[4][2])
	$soldier5/hpbar.size.x = Global.squad1[4][2] * 1.5
	$soldier5/HClbl2.text = str(Global.squad1[4][1])
	totalHC = Global.squad1[0][1] + Global.squad1[1][1] + Global.squad1[2][1] + Global.squad1[3][1] + Global.squad1[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[0]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)
	$startmission.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	blockedsquad()


func _on_squad_1_toggled(toggled_on):
	squadselected = 0
	$soldier1/name.text = Global.squad1[0][0]
	$soldier1/STR.text = Global.squad1[0][7]
	$soldier1/ID.text = Global.squad1[0][8]
	$soldier1/STL.text = Global.squad1[0][9]
	$soldier1/MED.text = Global.squad1[0][10]
	$soldier1/ENG.text = Global.squad1[0][11]
	$soldier1/hp.text = str(Global.squad1[0][2])
	$soldier1/hpbar.size.x = Global.squad1[0][2] * 1.5
	$soldier1/HClbl2.text = str(Global.squad1[0][1])
	$soldier2/name.text = Global.squad1[1][0]
	$soldier2/STR.text = Global.squad1[1][7]
	$soldier2/ID.text = Global.squad1[1][8]
	$soldier2/STL.text = Global.squad1[1][9]
	$soldier2/MED.text = Global.squad1[1][10]
	$soldier2/ENG.text = Global.squad1[1][11]
	$soldier2/hp.text = str(Global.squad1[1][2])
	$soldier2/hpbar.size.x = Global.squad1[1][2] * 1.5
	$soldier2/HClbl2.text = str(Global.squad1[1][1])
	$soldier3/name.text = Global.squad1[2][0]
	$soldier3/STR.text = Global.squad1[2][7]
	$soldier3/ID.text = Global.squad1[2][8]
	$soldier3/STL.text = Global.squad1[2][9]
	$soldier3/MED.text = Global.squad1[2][10]
	$soldier3/ENG.text = Global.squad1[2][11]
	$soldier3/hp.text = str(Global.squad1[2][2])
	$soldier3/hpbar.size.x = Global.squad1[2][2] * 1.5
	$soldier3/HClbl2.text = str(Global.squad1[2][1])
	$soldier4/name.text = Global.squad1[3][0]
	$soldier4/STR.text = Global.squad1[3][7]
	$soldier4/ID.text = Global.squad1[3][8]
	$soldier4/STL.text = Global.squad1[3][9]
	$soldier4/MED.text = Global.squad1[3][10]
	$soldier4/ENG.text = Global.squad1[3][11]
	$soldier4/hp.text = str(Global.squad1[3][2])
	$soldier4/hpbar.size.x = Global.squad1[3][2] * 1.5
	$soldier4/HClbl2.text = str(Global.squad1[3][1])
	$soldier5/name.text = Global.squad1[4][0]
	$soldier5/STR.text = Global.squad1[4][7]
	$soldier5/ID.text = Global.squad1[4][8]
	$soldier5/STL.text = Global.squad1[4][9]
	$soldier5/MED.text = Global.squad1[4][10]
	$soldier5/ENG.text = Global.squad1[4][11]
	$soldier5/hp.text = str(Global.squad1[4][2])
	$soldier5/hpbar.size.x = Global.squad1[4][2] * 1.5
	$soldier5/HClbl2.text = str(Global.squad1[4][1])
	totalHC = Global.squad1[0][1] + Global.squad1[1][1] + Global.squad1[2][1] + Global.squad1[3][1] + Global.squad1[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[0]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)
	emptysquad()


func _on_squad_2_toggled(toggled_on):
	squadselected = 1
	$soldier1/name.text = Global.squad2[0][0]
	$soldier1/STR.text = Global.squad2[0][7]
	$soldier1/ID.text = Global.squad2[0][8]
	$soldier1/STL.text = Global.squad2[0][9]
	$soldier1/MED.text = Global.squad2[0][10]
	$soldier1/ENG.text = Global.squad2[0][11]
	$soldier1/hp.text = str(Global.squad2[0][2])
	$soldier1/hpbar.size.x = Global.squad2[0][2] * 1.5
	$soldier1/HClbl2.text = str(Global.squad2[0][1])
	$soldier2/name.text = Global.squad2[1][0]
	$soldier2/STR.text = Global.squad2[1][7]
	$soldier2/ID.text = Global.squad2[1][8]
	$soldier2/STL.text = Global.squad2[1][9]
	$soldier2/MED.text = Global.squad2[1][10]
	$soldier2/ENG.text = Global.squad2[1][11]
	$soldier2/hp.text = str(Global.squad2[1][2])
	$soldier2/hpbar.size.x = Global.squad2[1][2] * 1.5
	$soldier2/HClbl2.text = str(Global.squad2[1][1])
	$soldier3/name.text = Global.squad2[2][0]
	$soldier3/STR.text = Global.squad2[2][7]
	$soldier3/ID.text = Global.squad2[2][8]
	$soldier3/STL.text = Global.squad2[2][9]
	$soldier3/MED.text = Global.squad2[2][10]
	$soldier3/ENG.text = Global.squad2[2][11]
	$soldier3/hp.text = str(Global.squad2[2][2])
	$soldier3/hpbar.size.x = Global.squad2[2][2] * 1.5
	$soldier3/HClbl2.text = str(Global.squad2[2][1])
	$soldier4/name.text = Global.squad2[3][0]
	$soldier4/STR.text = Global.squad2[3][7]
	$soldier4/ID.text = Global.squad2[3][8]
	$soldier4/STL.text = Global.squad2[3][9]
	$soldier4/MED.text = Global.squad2[3][10]
	$soldier4/ENG.text = Global.squad2[3][11]
	$soldier4/hp.text = str(Global.squad2[3][2])
	$soldier4/hpbar.size.x = Global.squad2[3][2] * 1.5
	$soldier4/HClbl2.text = str(Global.squad2[3][1])
	$soldier5/name.text = Global.squad2[4][0]
	$soldier5/STR.text = Global.squad2[4][7]
	$soldier5/ID.text = Global.squad2[4][8]
	$soldier5/STL.text = Global.squad2[4][9]
	$soldier5/MED.text = Global.squad2[4][10]
	$soldier5/ENG.text = Global.squad2[4][11]
	$soldier5/hp.text = str(Global.squad2[4][2])
	$soldier5/hpbar.size.x = Global.squad2[4][2] * 1.5
	$soldier5/HClbl2.text = str(Global.squad2[4][1])
	totalHC = Global.squad2[0][1] + Global.squad2[1][1] + Global.squad2[2][1] + Global.squad2[3][1] + Global.squad2[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[0]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)
	emptysquad()


func _on_squad_3_toggled(toggled_on):
	squadselected = 2
	$soldier1/name.text = Global.squad3[0][0]
	$soldier1/STR.text = Global.squad3[0][7]
	$soldier1/ID.text = Global.squad3[0][8]
	$soldier1/STL.text = Global.squad3[0][9]
	$soldier1/MED.text = Global.squad3[0][10]
	$soldier1/ENG.text = Global.squad3[0][11]
	$soldier1/hp.text = str(Global.squad3[0][2])
	$soldier1/hpbar.size.x = Global.squad3[0][2] * 1.5
	$soldier1/HClbl2.text = str(Global.squad3[0][1])
	$soldier2/name.text = Global.squad3[1][0]
	$soldier2/STR.text = Global.squad3[1][7]
	$soldier2/ID.text = Global.squad3[1][8]
	$soldier2/STL.text = Global.squad3[1][9]
	$soldier2/MED.text = Global.squad3[1][10]
	$soldier2/ENG.text = Global.squad3[1][11]
	$soldier2/hp.text = str(Global.squad3[1][2])
	$soldier2/hpbar.size.x = Global.squad3[1][2] * 1.5
	$soldier2/HClbl2.text = str(Global.squad3[1][1])
	$soldier3/name.text = Global.squad3[2][0]
	$soldier3/STR.text = Global.squad3[2][7]
	$soldier3/ID.text = Global.squad3[2][8]
	$soldier3/STL.text = Global.squad3[2][9]
	$soldier3/MED.text = Global.squad3[2][10]
	$soldier3/ENG.text = Global.squad3[2][11]
	$soldier3/hp.text = str(Global.squad3[2][2])
	$soldier3/hpbar.size.x = Global.squad3[2][2] * 1.5
	$soldier3/HClbl2.text = str(Global.squad3[2][1])
	$soldier4/name.text = Global.squad3[3][0]
	$soldier4/STR.text = Global.squad3[3][7]
	$soldier4/ID.text = Global.squad3[3][8]
	$soldier4/STL.text = Global.squad3[3][9]
	$soldier4/MED.text = Global.squad3[3][10]
	$soldier4/ENG.text = Global.squad3[3][11]
	$soldier4/hp.text = str(Global.squad3[3][2])
	$soldier4/hpbar.size.x = Global.squad3[3][2] * 1.5
	$soldier4/HClbl2.text = str(Global.squad3[3][1])
	$soldier5/name.text = Global.squad3[4][0]
	$soldier5/STR.text = Global.squad3[4][7]
	$soldier5/ID.text = Global.squad3[4][8]
	$soldier5/STL.text = Global.squad3[4][9]
	$soldier5/MED.text = Global.squad3[4][10]
	$soldier5/ENG.text = Global.squad3[4][11]
	$soldier5/hp.text = str(Global.squad3[4][2])
	$soldier5/hpbar.size.x = Global.squad3[4][2] * 1.5
	$soldier5/HClbl2.text = str(Global.squad3[4][1])
	totalHC = Global.squad3[0][1] + Global.squad3[1][1] + Global.squad3[2][1] + Global.squad3[3][1] + Global.squad3[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[0]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)
	emptysquad()

#0. ammo cost 1. ration cost 2. constmats cost 3. parts cost 4. money cost
#5. ammo reward 6. ration reward 7.constmats reward 8. parts reward 9. money reward
#10. mission title 11. mission duration 12. CA 13. other requirements
#14. missiondesc 15. array of rewards 16. NUO relations 17. NUO conflict prog
#18. EPE relations 19. EPE conflict prog 20. FLR relations 21. FLR conflict prog

func _on_startmission_pressed():
	Global.ammo = Global.ammo - Global.missionlist[Global.arr[0]][0]
	Global.ration = Global.ration - Global.missionlist[Global.arr[0]][1]
	Global.constmats = Global.constmats - Global.missionlist[Global.arr[0]][2]
	Global.parts = Global.parts - Global.missionlist[Global.arr[0]][3]
	Global.money = Global.money - Global.missionlist[Global.arr[0]][4]
	hide()
	repcalculator(16)
	repcalculator(18)
	repcalculator(20)
	missioninprogress()


#0. ammo cost 1. ration cost 2. constmats cost 3. parts cost 4. money cost
#5. ammo reward 6. ration reward 7.constmats reward 8. parts reward 9. money reward
#10. mission title 11. mission duration 12. CA 13. other requirements
#14. missiondesc 15. array of rewards 16. NUO relations 17. NUO conflict prog
#18. EPE relations 19. EPE conflict prog 20. FLR relations 21. FLR conflict prog

#0. Nombre misión 1. ammo reward 2. ration reward 3. constmats reward
#4. parts reward 5. money reward 6. victory chance 7. days left 8. win or lose 
#9. NUO conflict prog 10. EPE conflict prog 11. FLR conflict prog

func missioninprogress():
	var winchance = rng.randi_range(0, 100)
	Global.busysquads[squadselected] = true
	Global.mission1selected = 1
	if (winchance <= idk):
		Global.currentmissions[squadselected] = [Global.missionlist[Global.arr[0]][10], Global.missionlist[Global.arr[0]][5],
		Global.missionlist[Global.arr[0]][6], Global.missionlist[Global.arr[0]][7], Global.missionlist[Global.arr[0]][8],
		Global.missionlist[Global.arr[0]][9], idk, Global.missionlist[Global.arr[0]][11], true, Global.missionlist[Global.arr[0]][17],
		Global.missionlist[Global.arr[0]][19], Global.missionlist[Global.arr[0]][21]]
	else:
		Global.currentmissions[squadselected] = [Global.missionlist[Global.arr[0]][10], Global.missionlist[Global.arr[0]][5],
		Global.missionlist[Global.arr[0]][6], Global.missionlist[Global.arr[0]][7], Global.missionlist[Global.arr[0]][8],
		Global.missionlist[Global.arr[0]][9], idk, Global.missionlist[Global.arr[0]][11], false]

func blockedsquad():
	if (Global.busysquads[0] == true):
		$squad1.disabled = true
	else:
		$squad1.disabled = false
	if (Global.busysquads[1] == true):
		$squad2.disabled = true
	else:
		$squad2.disabled = false
	if (Global.unlockedsquads == 2):
		if (Global.busysquads[2] == true):
			$squad3.disabled = true
		else:
			$squad3.disabled = false
	if (Global.unlockedsquads == 3):
		if (Global.busysquads[2] == true):
			$squad3.disabled = true
		else:
			$squad3.disabled = false
		if (Global.busysquads[3] == true):
			$squad4.disabled = true
		else:
			$squad4.disabled = false
	if (Global.unlockedsquads == 4):
		if (Global.busysquads[2] == true):
			$squad3.disabled = true
		else:
			$squad3.disabled = false
		if (Global.busysquads[3] == true):
			$squad4.disabled = true
		else:
			$squad4.disabled = false
		if (Global.busysquads[4] == true):
			$squad5.disabled = true
		else:
			$squad5.disabled = false

#0. ammo cost 1. ration cost 2. constmats cost 3. parts cost 4. money cost
#5. ammo reward 6. ration reward 7.constmats reward 8. parts reward 9. money reward
#10. mission title 11. mission duration 12. CA 13. other requirements
#14. missiondesc 15. array of rewards 16. NUO relations 17. NUO conflict prog
#18. EPE relations 19. EPE conflict prog 20. FLR relations 21. FLR conflict prog

func repcalculator(faction):
	if (Global.missionlist[Global.arr[0]][faction] == "+"):
		if ((faction == 16) && (Global.NUOrep >= -150) && (Global.NUOrep < 150)):
			Global.NUOrep = Global.NUOrep + 15
		if ((faction == 18) && (Global.EPErep >= -150) && (Global.EPErep < 150)):
			Global.EPErep = Global.EPErep + 15
		if ((faction == 20) && (Global.FLRrep >= -150) && (Global.FLRrep < 150)):
			Global.FLRrep = Global.FLRrep + 15
	if (Global.missionlist[Global.arr[0]][faction] == "++"):
		if ((faction == 16) && (Global.NUOrep >= -150) && (Global.NUOrep < 150)):
			Global.NUOrep = Global.NUOrep + 40
		if ((faction == 18) && (Global.EPErep >= -150) && (Global.EPErep < 150)):
			Global.EPErep = Global.EPErep + 40
		if ((faction == 20) && (Global.FLRrep >= -150) && (Global.FLRrep < 150)):
			Global.FLRrep = Global.FLRrep + 40
	if (Global.missionlist[Global.arr[0]][faction] == "-"):
		if ((faction == 16) && (Global.NUOrep > -150) && (Global.NUOrep <= 150)):
			Global.NUOrep = Global.NUOrep - 15
		if ((faction == 18) && (Global.EPErep > -150) && (Global.EPErep <= 150)):
			Global.EPErep = Global.EPErep - 15
		if ((faction == 20) && (Global.FLRrep > -150) && (Global.FLRrep <= 150)):
			Global.FLRrep = Global.FLRrep - 15
	if (Global.missionlist[Global.arr[0]][faction] == "--"):
		if ((faction == 16) && (Global.NUOrep > -150) && (Global.NUOrep <= 150)):
			Global.NUOrep = Global.NUOrep - 40
		if ((faction == 18) && (Global.EPErep > -150) && (Global.EPErep <= 150)):
			Global.EPErep = Global.EPErep - 40
		if ((faction == 20) && (Global.FLRrep > -150) && (Global.FLRrep < 150)):
			Global.FLRrep = Global.FLRrep - 40
	Global.repcheck()
	
func emptysquad():
	if (($soldier1/name.text == "Vacío") && ($soldier2/name.text == "Vacío") && ($soldier3/name.text == "Vacío") && 
	($soldier4/name.text == "Vacío") &&  ($soldier5/name.text == "Vacío")):
		$startmission.disabled = true
	else:
		$startmission.disabled = false
