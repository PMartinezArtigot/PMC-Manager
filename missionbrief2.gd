extends Panel

var rng = RandomNumberGenerator.new()
var idk: float = 0
var totalHC: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$soldier1/name.text = Global.squad1[0][0]
	$soldier1/HClbl2.text = str(Global.squad1[0][1])
	$soldier2/name.text = Global.squad1[1][0]
	$soldier2/HClbl2.text = str(Global.squad1[1][1])
	$soldier3/name.text = Global.squad1[2][0]
	$soldier3/HClbl2.text = str(Global.squad1[2][1])
	$soldier4/name.text = Global.squad1[3][0]
	$soldier4/HClbl2.text = str(Global.squad1[3][1])
	$soldier5/name.text = Global.squad1[4][0]
	$soldier5/HClbl2.text = str(Global.squad1[4][1])
	totalHC = Global.squad1[0][1] + Global.squad1[1][1] + Global.squad1[2][1] + Global.squad1[3][1] + Global.squad1[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[1]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_squad_1_toggled(toggled_on):
	$soldier1/name.text = Global.squad1[0][0]
	$soldier1/HClbl2.text = str(Global.squad1[0][1])
	$soldier2/name.text = Global.squad1[1][0]
	$soldier2/HClbl2.text = str(Global.squad1[1][1])
	$soldier3/name.text = Global.squad1[2][0]
	$soldier3/HClbl2.text = str(Global.squad1[2][1])
	$soldier4/name.text = Global.squad1[3][0]
	$soldier4/HClbl2.text = str(Global.squad1[3][1])
	$soldier5/name.text = Global.squad1[4][0]
	$soldier5/HClbl2.text = str(Global.squad1[4][1])
	totalHC = Global.squad1[0][1] + Global.squad1[1][1] + Global.squad1[2][1] + Global.squad1[3][1] + Global.squad1[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[1]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)


func _on_squad_2_toggled(toggled_on):
	$soldier1/name.text = Global.squad2[0][0]
	$soldier1/HClbl2.text = str(Global.squad2[0][1])
	$soldier2/name.text = Global.squad2[1][0]
	$soldier2/HClbl2.text = str(Global.squad2[1][1])
	$soldier3/name.text = Global.squad2[2][0]
	$soldier3/HClbl2.text = str(Global.squad2[2][1])
	$soldier4/name.text = Global.squad2[3][0]
	$soldier4/HClbl2.text = str(Global.squad2[3][1])
	$soldier5/name.text = Global.squad2[4][0]
	$soldier5/HClbl2.text = str(Global.squad2[4][1])
	totalHC = Global.squad2[0][1] + Global.squad2[1][1] + Global.squad2[2][1] + Global.squad2[3][1] + Global.squad2[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[1]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)


func _on_squad_3_toggled(toggled_on):
	$soldier1/name.text = Global.squad3[0][0]
	$soldier1/HClbl2.text = str(Global.squad3[0][1])
	$soldier2/name.text = Global.squad3[1][0]
	$soldier2/HClbl2.text = str(Global.squad3[1][1])
	$soldier3/name.text = Global.squad3[2][0]
	$soldier3/HClbl2.text = str(Global.squad3[2][1])
	$soldier4/name.text = Global.squad3[3][0]
	$soldier4/HClbl2.text = str(Global.squad3[3][1])
	$soldier5/name.text = Global.squad3[4][0]
	$soldier5/HClbl2.text = str(Global.squad3[4][1])
	totalHC = Global.squad3[0][1] + Global.squad3[1][1] + Global.squad3[2][1] + Global.squad3[3][1] + Global.squad3[4][1]
	idk = (snapped((totalHC / Global.missionlist[Global.arr[1]][12]), 0.1)) * 0.8 * 100
	if (idk > 100):
		idk = 100
	$probviclbl2.text = str(idk)

func _on_startmission_pressed():
	Global.ammo = Global.ammo - Global.missionlist[Global.arr[1]][0]
	Global.ration = Global.ration - Global.missionlist[Global.arr[1]][1]
	Global.constmats = Global.constmats - Global.missionlist[Global.arr[1]][2]
	Global.parts = Global.parts - Global.missionlist[Global.arr[1]][3]
	Global.money = Global.money - Global.missionlist[Global.arr[1]][4]
	hide()
	missioninprogress()
		
func missioninprogress():
	var winchance = rng.randi_range(0, 100)
	if (Global.missionlist[Global.arr[1]][11] == 0):
		if (winchance <= idk):
			Global.ammo = Global.ammo + Global.missionlist[Global.arr[1]][5]
			Global.ration = Global.ration + Global.missionlist[Global.arr[1]][6]
			Global.constmats = Global.constmats + Global.missionlist[Global.arr[1]][7]
			Global.parts = Global.parts + Global.missionlist[Global.arr[1]][8]
			Global.money = Global.money + Global.missionlist[Global.arr[1]][9]
	else:
		Global.mission2inprog = 1
		if (winchance <= idk):
			Global.currentmissions.append([Global.missionlist[Global.arr[1]][5], Global.missionlist[Global.arr[1]][6],
			Global.missionlist[Global.arr[1]][7], Global.missionlist[Global.arr[1]][8], Global.missionlist[Global.arr[1]][9],
			Global.missionlist[Global.arr[1]][11], 2])
		else:
			Global.currentmissions.append([0, 0, 0, 0, 0, Global.missionlist[Global.arr[1]][11], 2])
