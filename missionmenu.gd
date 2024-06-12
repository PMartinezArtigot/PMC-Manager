extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	firstbootinfo()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	repapplier()
	warapplier()
	blockedmissionperday()
	$ammocount.text = str(Global.ammo)
	$constmatscount.text = str(Global.constmats)
	$rationscount.text = str(Global.ration)
	$partscount.text = str(Global.parts)
	$moneycount.text = str(Global.money)
	$dianum.text = str(Global.day)
	
	




func _on_hqbtn_pressed():
	get_tree().change_scene_to_file("res://headquarters.tscn")
	


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


#0. Nombre misión 1. ammo reward 2. ration reward 3. constmats reward
#4. parts reward 5. money reward 6. victory chance 7. days left

func _on_enddaybtn_pressed():
	Global.calcsoldierpay()
	$fadescreenbg.show()
	$passday.show()
	$passday/moneycount.text = str(Global.soldierpay)

func blockedmissionperday():
	if (Global.mission1selected == 1):
		$missionpanel1/inprogress.show()
	else:
		$missionpanel1/inprogress.hide()
	if (Global.mission2selected == 1):
		$missionpanel2/inprogress.show()
	else:
		$missionpanel2/inprogress.hide()
	if (Global.mission3selected == 1):
		$missionpanel3/inprogress.show()
	else:
		$missionpanel3/inprogress.hide()
func _on_blackmarketbtn_pressed():
	get_tree().change_scene_to_file("res://blackmarket.tscn")


func _on_backbtn_pressed():
	$fadescreenbg.hide()
	$contextinfo.hide()
	Global.firstbootinfo = false


func _on_infocontextbtn_pressed():
	$fadescreenbg.show()
	$contextinfo.show()


func _on_missioninprogbtn_pressed():
	assigndata()
	$fadescreenbg.show()
	$missionsinprogress.show()


func _on_backmisprogbtn_pressed():
	$fadescreenbg.hide()
	$missionsinprogress.hide()
	
func assigndata():
	$missionsinprogress/squad1/ammocount.text = str(Global.currentmissions[0][1])
	$missionsinprogress/squad1/rationcount.text = str(Global.currentmissions[0][2])
	$missionsinprogress/squad1/constpartscount.text = str(Global.currentmissions[0][3])
	$missionsinprogress/squad1/partscount.text = str(Global.currentmissions[0][4])
	$missionsinprogress/squad1/moneycount.text = str(Global.currentmissions[0][5])
	$missionsinprogress/squad1/missionname.text = Global.currentmissions[0][0]
	$missionsinprogress/squad1/daysleftnum.text = str(Global.currentmissions[0][7])
	$missionsinprogress/squad1/prbwinchancenum.text = str(Global.currentmissions[0][6])
	$missionsinprogress/squad2/ammocount.text = str(Global.currentmissions[1][1])
	$missionsinprogress/squad2/rationcount.text = str(Global.currentmissions[1][2])
	$missionsinprogress/squad2/constpartscount.text = str(Global.currentmissions[1][3])
	$missionsinprogress/squad2/partscount.text = str(Global.currentmissions[1][4])
	$missionsinprogress/squad2/moneycount.text = str(Global.currentmissions[1][5])
	$missionsinprogress/squad2/missionname.text = Global.currentmissions[1][0]
	$missionsinprogress/squad2/daysleftnum.text = str(Global.currentmissions[1][7])
	$missionsinprogress/squad2/prbwinchancenum.text = str(Global.currentmissions[1][6])
	$missionsinprogress/squad3/ammocount.text = str(Global.currentmissions[2][1])
	$missionsinprogress/squad3/rationcount.text = str(Global.currentmissions[2][2])
	$missionsinprogress/squad3/constpartscount.text = str(Global.currentmissions[2][3])
	$missionsinprogress/squad3/partscount.text = str(Global.currentmissions[2][4])
	$missionsinprogress/squad3/moneycount.text = str(Global.currentmissions[2][5])
	$missionsinprogress/squad3/missionname.text = Global.currentmissions[2][0]
	$missionsinprogress/squad3/daysleftnum.text = str(Global.currentmissions[2][7])
	$missionsinprogress/squad3/prbwinchancenum.text = str(Global.currentmissions[2][6])

func assigndatareport():
	$dailyreport/squad1/ammocount.text = str(Global.dailyreport[0][1])
	$dailyreport/squad1/rationcount.text = str(Global.dailyreport[0][2])
	$dailyreport/squad1/constpartscount.text = str(Global.dailyreport[0][3])
	$dailyreport/squad1/partscount.text = str(Global.dailyreport[0][4])
	$dailyreport/squad1/moneycount.text = str(Global.dailyreport[0][5])
	$dailyreport/squad1/missionname.text = Global.dailyreport[0][0]
	$dailyreport/squad1/prbwinchancenum.text = str(Global.dailyreport[0][6])
	$dailyreport/squad2/prbwinchancenum.text = str(Global.dailyreport[1][6])
	$dailyreport/squad2/ammocount.text = str(Global.dailyreport[1][1])
	$dailyreport/squad2/rationcount.text = str(Global.dailyreport[1][2])
	$dailyreport/squad2/constpartscount.text = str(Global.dailyreport[1][3])
	$dailyreport/squad2/partscount.text = str(Global.dailyreport[1][4])
	$dailyreport/squad2/moneycount.text = str(Global.dailyreport[1][5])
	$dailyreport/squad2/missionname.text = Global.dailyreport[1][0]
	$dailyreport/squad2/prbwinchancenum.text = str(Global.dailyreport[1][6])
	$dailyreport/squad3/ammocount.text = str(Global.dailyreport[2][1])
	$dailyreport/squad3/rationcount.text = str(Global.dailyreport[2][2])
	$dailyreport/squad3/constpartscount.text = str(Global.dailyreport[2][3])
	$dailyreport/squad3/partscount.text = str(Global.dailyreport[2][4])
	$dailyreport/squad3/moneycount.text = str(Global.dailyreport[2][5])
	$dailyreport/squad3/missionname.text = Global.dailyreport[2][0]
	$dailyreport/squad3/prbwinchancenum.text = str(Global.dailyreport[2][6])


func _on_closescreen_pressed():
	$fadescreenbg.hide()
	$passday.hide()


func _on_nobuy_pressed():
	$fadescreenbg.hide()
	$passday.hide()
	
	


func _on_yesbuy_pressed():
	print(Global.arr)
	Global.dailyreport = [["En base", "???", "???", "???", "???", "???", "???", false],
	["En base", "???", "???", "???", "???", "???", "???", false],
	["En base", "???", "???", "???", "???", "???", "???", false],
	["En base", "???", "???", "???", "???", "???", "???", false],
	["En base", "???", "???", "???", "???", "???", "???", false]]
	$changedayanim.modulate.a8 = 0
	$changedayanim.show()
	for i in range (0, 255, 15):
		await get_tree().create_timer(0.05).timeout
		$changedayanim.modulate.a8 = i
	$changedayanim.modulate.a8 = 255
	$fadescreenbg.hide()
	$passday.hide()
	Global.deadfaction()
	Global.arr = []
	Global.get_random_numbers(0, Global.missionlist.size())
	Global.mission1selected = 0
	Global.mission2selected = 0
	Global.mission3selected = 0
	Global.money = Global.money - Global.soldierpay
	Global.day = Global.day + 1
	for i in Global.currentmissions.size():
		if (Global.currentmissions[i][0] != "En base"):
			if (Global.currentmissions[i][7] == 1):
				losehealth(i)
				Global.deadsoldier()
				if (Global.currentmissions[i][8] == true):
					Global.ammo = Global.ammo + Global.currentmissions[i][1]
					Global.ration = Global.ration + Global.currentmissions[i][2]
					Global.constmats = Global.constmats + Global.currentmissions[i][3]
					Global.parts = Global.parts + Global.currentmissions[i][4]
					Global.money = Global.money + Global.currentmissions[i][5]
					warcalculator(17, Global.currentmissions[i][9])
					warcalculator(19, Global.currentmissions[i][10])
					warcalculator(21, Global.currentmissions[i][11])
				if (Global.currentmissions[i][8] == true):
					Global.dailyreport[i] = [Global.currentmissions[i][0], Global.currentmissions[i][1],
					Global.currentmissions[i][2], Global.currentmissions[i][3], Global.currentmissions[i][4],
					Global.currentmissions[i][5], winlose(Global.currentmissions[i][8])]
				if (Global.currentmissions[i][8] == false):
					Global.dailyreport[i] = [Global.currentmissions[i][0], "0",
					"0", "0", "0", "0", winlose(Global.currentmissions[i][8])]
				Global.currentmissions[i] = ["En base", "???", "???", "???", "???", "???", "???", "???", false]
				Global.busysquads[i] = false
			else:
				Global.currentmissions[i][7] = Global.currentmissions[i][7] - 1
				Global.dailyreport[i] = [Global.currentmissions[i][0], Global.currentmissions[i][1],
				Global.currentmissions[i][2], Global.currentmissions[i][3], Global.currentmissions[i][4],
				Global.currentmissions[i][5], "En combate"]
	assigndatareport()
	Global.soldierdailyheal()
	await get_tree().create_timer(1.05).timeout
	for i in range (255, 0, -15):
		await get_tree().create_timer(0.05).timeout
		$changedayanim.modulate.a8 = i
	$changedayanim.modulate.a8 = 0
	await get_tree().create_timer(1.05).timeout
	$changedayanim.hide()
	squad3unlocked()
	$fadescreenbg.show()
	$dailyreport.show()
	print(Global.arr)

func _on_backbtnreport_pressed():
	showfallen()
	$dailyreport.hide()
	$fallensoldiers.show()
	
func winlose(boul):
	if (boul == true):
		return "¡Victoria!"
	if (boul == false):
		return "Derrota"

func losehealth(missionchosen):
	var losthealth = 100 - Global.currentmissions[missionchosen][6]
	for i in Global.allsquads[missionchosen].size():
		if (Global.allsquads[missionchosen][i][0] != "Vacío"):
			Global.allsquads[missionchosen][i][2] = Global.allsquads[missionchosen][i][2] - losthealth - randi_range(1, 10) 


func _on_closescreenfallen_pressed():
	$fadescreenbg.hide()
	$fallensoldiers.hide()
	Global.wipedeadsoldier()
	Global.losestate()
	lostgame()
	Global.winstate()
	wongame()

func showfallen():
	$fallensoldiers/squad1/soldier1.text = Global.fallensoldiers[0][0]
	$fallensoldiers/squad1/soldier2.text = Global.fallensoldiers[0][1]
	$fallensoldiers/squad1/soldier3.text = Global.fallensoldiers[0][2]
	$fallensoldiers/squad1/soldier4.text = Global.fallensoldiers[0][3]
	$fallensoldiers/squad1/soldier5.text = Global.fallensoldiers[0][4]
	$fallensoldiers/squad2/soldier1.text = Global.fallensoldiers[1][0]
	$fallensoldiers/squad2/soldier2.text = Global.fallensoldiers[1][1]
	$fallensoldiers/squad2/soldier3.text = Global.fallensoldiers[1][2]
	$fallensoldiers/squad2/soldier4.text = Global.fallensoldiers[1][3]
	$fallensoldiers/squad2/soldier5.text = Global.fallensoldiers[1][4]
	$fallensoldiers/squad3/soldier1.text = Global.fallensoldiers[2][0]
	$fallensoldiers/squad3/soldier2.text = Global.fallensoldiers[2][1]
	$fallensoldiers/squad3/soldier3.text = Global.fallensoldiers[2][2]
	$fallensoldiers/squad3/soldier4.text = Global.fallensoldiers[2][3]
	$fallensoldiers/squad3/soldier5.text = Global.fallensoldiers[2][4]

func repapplier():
	$NUOrepval.position.x = 1580 + Global.NUOrep
	$EPErepval.position.x = 1580 + Global.EPErep
	$FLRrepval.position.x = 1580 + Global.FLRrep
	
func warapplier():
	$NUObar.size.x = Global.NUOprogress
	$EPEbar.size.x = Global.EPEprogress
	$EPEbar.position.x = $NUObar.position.x + Global.NUOprogress
	$FLRbar.size.x = Global.FLRprogress
	$FLRbar.position.x = $EPEbar.position.x + Global.EPEprogress

func warcalculator(faction, value):
	if (value == "+"):
		if ((faction == 17) && (Global.NUOprogress >= 0) && (Global.NUOprogress < 600)):
			Global.NUOprogress = Global.NUOprogress + 15
		if ((faction == 19) && (Global.EPEprogress >= 0) && (Global.EPEprogress < 600)):
			Global.EPEprogress = Global.EPEprogress + 15
		if ((faction == 21) && (Global.FLRprogress >= 0) && (Global.FLRprogress < 600)):
			Global.FLRprogress = Global.FLRprogress + 15
	if (value == "++"):
		if ((faction == 17) && (Global.NUOprogress >= 0) && (Global.NUOprogress < 600)):
			Global.NUOprogress = Global.NUOprogress + 30
		if ((faction == 19) && (Global.EPEprogress >= 0) && (Global.EPEprogress < 600)):
			Global.EPEprogress = Global.EPEprogress + 30
		if ((faction == 21) && (Global.FLRprogress >= 0) && (Global.FLRprogress < 600)):
			Global.FLRprogress = Global.FLRprogress + 30
	if (value == "-"):
		if ((faction == 17) && (Global.NUOprogress > 0) && (Global.NUOprogress <= 200)):
			Global.NUOprogress = Global.NUOprogress - 15
		if ((faction == 19) && (Global.EPEprogress > 0) && (Global.EPEprogress <= 200)):
			Global.EPEprogress = Global.EPEprogress - 15
		if ((faction == 21) && (Global.FLRprogress > 0) && (Global.FLRprogress <= 200)):
			Global.FLRprogress = Global.FLRprogress - 15
	if (value == "--"):
		if ((faction == 17) && (Global.NUOprogress > 0) && (Global.NUOprogress <= 200)):
			Global.NUOprogress = Global.NUOprogress - 30
		if ((faction == 19) && (Global.EPEprogress > 0) && (Global.EPEprogress <= 200)):
			Global.EPEprogress = Global.EPEprogress - 30
		if ((faction == 21) && (Global.FLRprogress > 0) && (Global.FLRprogress <= 200)):
			Global.FLRprogress = Global.FLRprogress - 30
	Global.warcheck()

func lostgame():
	if (Global.losestate() == true):
		$changedayanim.modulate.a8 = 0
		$changedayanim.show()
		for i in range (0, 255, 15):
			await get_tree().create_timer(0.05).timeout
			$changedayanim.modulate.a8 = i
		$changedayanim.modulate.a8 = 255
		$hidelost1.show()
		$lost.show()
		for i in range (255, 0, -5):
			await get_tree().create_timer(0.05).timeout
			$hidelost1.modulate.a8 = i
		$hidelost1.modulate.a8 = 0
		$hidelost2.show()
		$lost2.show()
		for i in range (255, 0, -15):
			await get_tree().create_timer(0.05).timeout
			$hidelost2.modulate.a8 = i
		$hidelost2.modulate.a8 = 0
		$quitbtn.show()
		endconflictday()

func wongame():
	if (Global.winstate() == true):
		if (Global.conflictwinner == "NUO"):
			$lost.text = "¡Victoria de los NUO!"
			$lost2.text = "Las fuerzas de las Naciones Unidas del Oeste \n ganan el conflicto, estableciendo un Gobierno Universal. \n La paz mundial está al alcance de nuestras manos... \n Hasta que otro manufacturador de armas \n se quiera hacer rico."
		if (Global.conflictwinner == "EPE"):
			$lost.text = "¡Victoria de los EPE!"
			$lost2.text = "El Ejército de los Pueblos del Este ha tomado control \n mundial, forzando sus creencias sobre todos los \n ciudadanos del mundo y espiando los que se desvíen \n de estas. Bienvenido al nuevo mundo."
		if (Global.conflictwinner == "FLR"):
			$lost.text = "¡Victoria de los FLR!"
			$lost2.text = "A través de extrema violencia y feroz resistencia, \n los FLR se encuentran con un nuevo mundo sin ocupaciones ni \n fuerzas invasoras... ¿Cometerán los mismos actos que sus \n predecesores o encontrarán una nueva forma de convivir?"
		$changedayanim.modulate.a8 = 0
		$changedayanim.show()
		for i in range (0, 255, 15):
			await get_tree().create_timer(0.05).timeout
			$changedayanim.modulate.a8 = i
		$changedayanim.modulate.a8 = 255
		$hidelost1.show()
		$lost.show()
		for i in range (255, 0, -5):
			await get_tree().create_timer(0.05).timeout
			$hidelost1.modulate.a8 = i
		$hidelost1.modulate.a8 = 0
		$hidelost2.show()
		$lost2.show()
		for i in range (255, 0, -15):
			await get_tree().create_timer(0.05).timeout
			$hidelost2.modulate.a8 = i
		$hidelost2.modulate.a8 = 0
		$quitbtn.show()
		endconflictday()
		
func endconflictday():
	$lost4.text = str(Global.day)
	$lost3.show()
	$lost4.show()


func _on_quitbtn_pressed():
	get_tree().quit()


func squad3unlocked():
	if (Global.unlockedsquads == 2):
		$dailyreport/squad3locked.hide()
		$missionsinprogress/squad3locked.hide()

func firstbootinfo():
	if (Global.firstbootinfo == true):
		$fadescreenbg.show()
		$contextinfo.show()
