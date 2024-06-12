extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	repapplier()
	warapplier()
	upgradescheck()
	$ammocount.text = str(Global.ammo)
	$constmatscount.text = str(Global.constmats)
	$rationscount.text = str(Global.ration)
	$partscount.text = str(Global.parts)
	$moneycount.text = str(Global.money)
	$dianum.text = str(Global.day)


func _on_listmissionbtn_pressed():
	get_tree().change_scene_to_file("res://missionmenu.tscn")


func _on_blackmarketbtn_pressed():
	get_tree().change_scene_to_file("res://blackmarket.tscn")


func _on_close_pressed():
	$fadescreenbg.hide()
	$barracks.hide()


func _on_barracksbtn_pressed():
	$fadescreenbg.show()
	$barracks.show()


func _on_backbtn_pressed():
	$fadescreenbg.hide()
	$contextinfo.hide()


func _on_infocontextbtn_pressed():
	$fadescreenbg.show()
	$contextinfo.show()


func _on_missioninprogbtn_pressed():
	assigndata()
	$fadescreenbg.show()
	$missionsinprogress.show()

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


func _on_backprogbtn_pressed():
	$fadescreenbg.hide()
	$missionsinprogress.hide()


func _on_nobuy_pressed():
	$fadescreenbg.hide()
	$passday.hide()


func _on_closescreen_pressed():
	$fadescreenbg.hide()
	$passday.hide()


func _on_enddaybtn_pressed():
	Global.calcsoldierpay()
	$fadescreenbg.show()
	$passday.show()
	$passday/moneycount.text = str(Global.soldierpay)


func _on_yesendday_pressed():
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




func _on_backbtnreport_pressed():
	showfallen()
	$dailyreport.hide()
	$fallensoldiers.show()


func _on_clinicbtn_pressed():
	$fadescreenbg.show()
	$clinic.show()


func _on_closeclinic_pressed():
	$fadescreenbg.hide()
	$clinic.hide()


func _on_closescreenfallen_pressed():
	$fallensoldiers.hide()
	$fadescreenbg.hide()
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
			Global.NUOprogress = Global.NUOprogress + 80
		if ((faction == 19) && (Global.EPEprogress >= 0) && (Global.EPEprogress < 600)):
			Global.EPEprogress = Global.EPEprogress + 80
		if ((faction == 21) && (Global.FLRprogress >= 0) && (Global.FLRprogress < 600)):
			Global.FLRprogress = Global.FLRprogress + 80
	if (value == "++"):
		if ((faction == 17) && (Global.NUOprogress >= 0) && (Global.NUOprogress < 600)):
			Global.NUOprogress = Global.NUOprogress + 30
		if ((faction == 19) && (Global.EPEprogress >= 0) && (Global.EPEprogress < 600)):
			Global.EPEprogress = Global.EPEprogress + 30
		if ((faction == 21) && (Global.FLRprogress >= 0) && (Global.FLRprogress < 600)):
			Global.FLRprogress = Global.FLRprogress + 30
	if (value == "-"):
		if ((faction == 17) && (Global.NUOprogress > 0) && (Global.NUOprogress <= 200)):
			Global.NUOprogress = Global.NUOprogress - 80
		if ((faction == 19) && (Global.EPEprogress > 0) && (Global.EPEprogress <= 200)):
			Global.EPEprogress = Global.EPEprogress - 80
		if ((faction == 21) && (Global.FLRprogress > 0) && (Global.FLRprogress <= 200)):
			Global.FLRprogress = Global.FLRprogress - 80
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


func _on_quitbtn_pressed():
	get_tree().quit()


func _on_upgradeclinic_pressed():
	clinupgradeinfo()
	$fadescreenbg.show()
	$upgradeclinic.show()


func _on_upgradebarracks_pressed():
	barrupgradeinfo()
	$fadescreenbg.show()
	$upgradebarracks.show()


func _on_closescreenupgradeclinic_pressed():
	$fadescreenbg.hide()
	$upgradeclinic.hide()


func _on_closescreenupgbar_pressed():
	$fadescreenbg.hide()
	$upgradebarracks.hide()

#0. Nombre misión 1. ammo reward 2. ration reward 3. constmats reward
#4. parts reward 5. money reward 6. victory chance 7. days left

func barrupgradeinfo():
	$upgradebarracks/ammocount.text = str(Global.upgradecostbarr[0])
	$upgradebarracks/rationscount.text = str(Global.upgradecostbarr[1])
	$upgradebarracks/constmatscount.text = str(Global.upgradecostbarr[2])
	$upgradebarracks/partscount.text = str(Global.upgradecostbarr[3])
	$upgradebarracks/moneycount.text = str(Global.upgradecostbarr[4])
	if ((Global.upgradecostbarr[0] > Global.ammo) || (Global.upgradecostbarr[1] > Global.ration)
	|| (Global.upgradecostbarr[2] > Global.constmats) || (Global.upgradecostbarr[3] > Global.parts)
	|| (Global.upgradecostbarr[4] > Global.money)):
		$upgradebarracks/yesbuy.disabled = true
	else:
		$upgradebarracks/yesbuy.disabled = false
		
func clinupgradeinfo():
	$upgradeclinic/ammocount.text = str(Global.upgradecostclinic[0])
	$upgradeclinic/rationscount.text = str(Global.upgradecostclinic[1])
	$upgradeclinic/constmatscount.text = str(Global.upgradecostclinic[2])
	$upgradeclinic/partscount.text = str(Global.upgradecostclinic[3])
	$upgradeclinic/moneycount.text = str(Global.upgradecostclinic[4])
	if ((Global.upgradecostclinic[0] > Global.ammo) || (Global.upgradecostclinic[1] > Global.ration)
	|| (Global.upgradecostclinic[2] > Global.constmats) || (Global.upgradecostclinic[3] > Global.parts)
	|| (Global.upgradecostclinic[4] > Global.money)):
		$upgradeclinic/yesbuy.disabled = true
	else:
		$upgradeclinic/yesbuy.disabled = false


func _on_upgbarnobuy_pressed():
	$fadescreenbg.hide()
	$upgradebarracks.hide()


func _on_yesbuy_pressed():
	Global.ammo = Global.ammo - Global.upgradecostbarr[0]
	Global.ration = Global.ration - Global.upgradecostbarr[1]
	Global.constmats = Global.constmats - Global.upgradecostbarr[2]
	Global.parts = Global.parts - Global.upgradecostbarr[3]
	Global.money = Global.money - Global.upgradecostbarr[4]
	Global.unlockedreserve = 2
	Global.unlockedsquads = 2
	$fadescreenbg.hide()
	$upgradebarracks.hide()

func upgradescheck():
	if (Global.unlockedreserve == 2):
		$barrackspanel/barrackslvlnum.text = "2"
		$barrackspanel/upgradebarracks.disabled = true
	if (Global.healamount == 20):
		$Clinic/cliniclvlnum.text = "2"
		$Clinic/upgradeclinic.disabled = true


func _on_nobuyupgcln_pressed():
	$fadescreenbg.hide()
	$upgradeclinic.hide()


func _on_yesbuycliupg_pressed():
	Global.ammo = Global.ammo - Global.upgradecostclinic[0]
	Global.ration = Global.ration - Global.upgradecostclinic[1]
	Global.constmats = Global.constmats - Global.upgradecostclinic[2]
	Global.parts = Global.parts - Global.upgradecostclinic[3]
	Global.money = Global.money - Global.upgradecostclinic[4]
	Global.healupgrade()
	$fadescreenbg.hide()
	$upgradeclinic.hide()

func squad3unlocked():
	if (Global.unlockedsquads == 2):
		$dailyreport/squad3locked.hide()
		$missionsinprogress/squad3locked.hide()

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
