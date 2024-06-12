extends Panel

var squadselect = 0
var selectedsquad = 0
var selectedsoldier = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	barrack()
	unlockreserves()
	disbtn()

func barrack():
	$soldierbtn1.text = Global.allsquads[squadselect][0][0]
	$soldierbtn2.text = Global.allsquads[squadselect][1][0]
	$soldierbtn3.text = Global.allsquads[squadselect][2][0]
	$soldierbtn4.text = Global.allsquads[squadselect][3][0]
	$soldierbtn5.text = Global.allsquads[squadselect][4][0]
	$soldierbtn6.text = Global.allsquads[squadselect + 1][0][0]
	$soldierbtn7.text = Global.allsquads[squadselect + 1][1][0]
	$soldierbtn8.text = Global.allsquads[squadselect + 1][2][0]
	$soldierbtn9.text = Global.allsquads[squadselect + 1][3][0]
	$soldierbtn10.text = Global.allsquads[squadselect + 1][4][0]
	$reserve1.text = Global.allsquads[5][0][0]
	$reserve2.text = Global.allsquads[5][1][0]
	$reserve3.text = Global.allsquads[5][2][0]
	$reserve4.text = Global.allsquads[5][3][0]
	$reserve5.text = Global.allsquads[5][4][0]
	$reserve6.text = Global.allsquads[5][5][0]
	$reserve7.text = Global.allsquads[5][6][0]
	$reserve8.text = Global.allsquads[5][7][0]
	$reserve9.text = Global.allsquads[5][8][0]
	$reserve10.text = Global.allsquads[5][9][0]
	$squadnm.text = str(squadselect + 1)
	$squadnm2.text = str(squadselect + 2)

#row: fila de botones 1, 2, 3 o 4 o reseva
#btnnum: num de boton (0 a 4)

#0. name 1. CA 2. HP 3. helmet 4. vest
#5. uniform 6. weapon 7.STR 8. ID 9. STL
#10. MED 11. ENG 12. hab 13. assigned squad

func soldierinfo(row, btnnum):
	print(selectedsquad)
	print(Global.busysquads)
	$hprq2.size.x = Global.allsquads[row][btnnum][2] * 1.1
	$name.text = Global.allsquads[row][btnnum][0]
	$hp2.text = str(Global.allsquads[row][btnnum][1])
	$hp.text = str(Global.allsquads[row][btnnum][2])
	$STR.text = Global.allsquads[row][btnnum][7]
	$ID.text = Global.allsquads[row][btnnum][8]
	$STL.text = Global.allsquads[row][btnnum][9]
	$MED.text = Global.allsquads[row][btnnum][10]
	$ENG.text = Global.allsquads[row][btnnum][11]
	$ablbl2.text = Global.allsquads[row][btnnum][12]
	$assquad.text = str(Global.allsquads[row][btnnum][13])
		

func _on_squaddown_pressed():
	squadselect = squadselect + 1


func _on_squadup_pressed():
	squadselect = squadselect - 1
	
func disbtn():
	if (squadselect >= Global.unlockedsquads):
		if (squadselect == Global.unlockedsquads):
			$soldierbtn1.disabled = false
			$soldierbtn2.disabled = false
			$soldierbtn3.disabled = false
			$soldierbtn4.disabled = false
			$soldierbtn5.disabled = false
			$soldierbtn6.disabled = true
			$soldierbtn7.disabled = true
			$soldierbtn8.disabled = true
			$soldierbtn9.disabled = true
			$soldierbtn10.disabled = true
		else:
			$soldierbtn1.disabled = true
			$soldierbtn2.disabled = true
			$soldierbtn3.disabled = true
			$soldierbtn4.disabled = true
			$soldierbtn5.disabled = true
			$soldierbtn6.disabled = true
			$soldierbtn7.disabled = true
			$soldierbtn8.disabled = true
			$soldierbtn9.disabled = true
			$soldierbtn10.disabled = true
	else:
			$soldierbtn1.disabled = false
			$soldierbtn2.disabled = false
			$soldierbtn3.disabled = false
			$soldierbtn4.disabled = false
			$soldierbtn5.disabled = false
			$soldierbtn6.disabled = false
			$soldierbtn7.disabled = false
			$soldierbtn8.disabled = false
			$soldierbtn9.disabled = false
			$soldierbtn10.disabled = false
		
	if (squadselect == 3):
		$squaddown.disabled = true
	else:
		$squaddown.disabled = false
	if (squadselect == 0):
		$squadup.disabled = true
	else:
		$squadup.disabled = false


func _on_soldierbtn_1_toggled(toggled_on):
	selectedsquad = squadselect
	selectedsoldier = 0
	soldierinfo(squadselect, 0)
	disableassign()

	
	

func _on_soldierbtn_2_toggled(toggled_on):
	selectedsquad = squadselect
	selectedsoldier = 1
	soldierinfo(squadselect, 1)
	disableassign()



func _on_soldierbtn_3_toggled(toggled_on):
	selectedsquad = squadselect
	selectedsoldier = 2
	soldierinfo(squadselect, 2)
	disableassign()
	

func _on_soldierbtn_4_toggled(toggled_on):
	selectedsquad = squadselect
	selectedsoldier = 3
	soldierinfo(squadselect, 3)
	disableassign()
	

func _on_soldierbtn_5_toggled(toggled_on):
	selectedsquad = squadselect
	selectedsoldier = 4
	soldierinfo(squadselect, 4)
	disableassign()
	

func _on_soldierbtn_6_toggled(toggled_on):
	selectedsquad = squadselect + 1
	selectedsoldier = 0
	soldierinfo(squadselect + 1, 0)
	disableassign()
	

func _on_soldierbtn_7_toggled(toggled_on):
	selectedsquad = squadselect + 1
	selectedsoldier = 1
	soldierinfo(squadselect + 1, 1)
	disableassign()
	


func _on_soldierbtn_8_toggled(toggled_on):
	selectedsquad = squadselect + 1
	selectedsoldier = 2
	soldierinfo(squadselect + 1, 2)
	disableassign()
	

func _on_soldierbtn_9_toggled(toggled_on):
	selectedsquad = squadselect + 1
	selectedsoldier = 3
	soldierinfo(squadselect + 1, 3)
	disableassign()
	

func _on_soldierbtn_10_toggled(toggled_on):
	selectedsquad = squadselect + 1
	selectedsoldier = 4
	soldierinfo(squadselect + 1, 4)
	disableassign()

func _on_reserve_1_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 0
	soldierinfo(5, 0)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true

func _on_reserve_2_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 1
	soldierinfo(5, 1)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_3_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 2
	soldierinfo(5, 2)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_4_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 3
	soldierinfo(5, 3)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_5_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 4
	soldierinfo(5, 4)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_6_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 5
	soldierinfo(5, 5)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_7_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 6
	soldierinfo(5, 6)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_8_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 7
	soldierinfo(5, 7)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_9_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 8
	soldierinfo(5, 8)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true


func _on_reserve_10_toggled(toggled_on):
	selectedsquad = 5
	selectedsoldier = 9
	soldierinfo(5, 9)
	if (Global.allsquads[selectedsquad][selectedsoldier][0] != "Vacío"):
		$assignsquad.disabled = false
	else: 
		$assignsquad.disabled = true




func disableassign():
	if ((Global.busysquads[selectedsquad] == true) || (Global.allsquads[selectedsquad][selectedsoldier][0] == "Vacío")
	 || (Global.allsquads[selectedsquad][selectedsoldier][2] == 100)):
		$assignsquad.disabled = true
	else:
		$assignsquad.disabled = false


func _on_assignsquad_pressed():
	var rationcost = (100 - Global.allsquads[selectedsquad][selectedsoldier][2]) / 2
	$assignsquadscreen/rationcount.text = str(rationcost)
	$assignsquadscreen.show()



func _on_closescreen_pressed():
	$assignsquadscreen.hide()


func fullsquad():
	for i in Global.unlockedsquads:
		if ((Global.allsquads[i][0][0] != "Vacío" && Global.allsquads[i][1][0] != "Vacío" && Global.allsquads[i][2][0] != "Vacío" &&
		Global.allsquads[i][3][0] != "Vacío" && Global.allsquads[i][4][0] != "Vacío") || (Global.busysquads[i] == true)):
			disablesquad(i, 1)
		else:
			disablesquad(i, 0)
func disablesquad(squadnum, disena):
	if (squadnum == 0 && disena == 1):
		$assignsquadscreen/squad1.disabled = true
	if (squadnum == 1 && disena == 1):
		$assignsquadscreen/squad2.disabled = true
	if (squadnum == 2 && disena == 1):
		$assignsquadscreen/squad2.disabled = true
	if (squadnum == 0 && disena == 0):
		$assignsquadscreen/squad1.disabled = false
	if (squadnum == 1 && disena == 0):
		$assignsquadscreen/squad2.disabled = false
	if (squadnum == 2 && disena == 0):
		$assignsquadscreen/squad2.disabled = false



func _on_yesheal_pressed():
	Global.ration = Global.ration - ((100 - Global.allsquads[selectedsquad][selectedsoldier][2]) / 2)
	Global.allsquads[selectedsquad][selectedsoldier][2] = 100
	soldierinfo(selectedsquad, selectedsoldier)
	$assignsquadscreen.hide()
	$assignsquad.disabled = true


func _on_visibility_changed():
	soldierinfo(selectedsquad, selectedsoldier)

func unlockreserves():
	if (Global.unlockedreserve == 2):
		$reserve6.disabled = false
		$reserve7.disabled = false
		$reserve8.disabled = false
		$reserve9.disabled = false
		$reserve10.disabled = false
