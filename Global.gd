extends Node

var day = 1
var ammo = 1000
var ration = 1000
var parts = 1000
var constmats = 1000
var money = 1000
var soldierpay = 0
var squadselected = 0
var NUOprogress = 200
var EPEprogress = 200
var FLRprogress = 200
var NUOrep = 0
var EPErep = 0
var FLRrep = 0
var mission1selected = 0
var mission2selected = 0
var mission3selected = 0
var unlockedsquads = 1
var unlockedreserve = 1
var healamount = 10
var conflictwinner = ""
var firstbootinfo = true

#0. ammo cost 1. ration cost 2. constmats cost 3. parts cost 4. money cost
#5. ammo reward 6. ration reward 7.constmats reward 8. parts reward 9. money reward
#10. mission title 11. mission duration 12. CA 13. other requirements
#14. missiondesc 15. array of rewards 16. NUO relations 17. NUO conflict prog
#18. EPE relations 19. EPE conflict prog 20. FLR relations 21. FLR conflict prog


const NUOconstroute = [0, 500, 0, 500, 300, 0, 500, 800, 0, 1000, "Construcción de rutas de suministro (NUO)",
 5, 1500, "",
"Un comandante de las Naciones Unidas del Oeste ha solicitado nuestros servicios para la construcción de rutas de suministro entre varias bases bajo su dominio. Estas bases se encuentran en territorio simpatizante con las Fuerzas de Liberación Rebelde (FLR).",
 [], "++", "+", "x", "x", "-", "-"]
const NUOprotectgeneral = [300, 200, 0, 0, 400, 600, 300, 100, 100, 300, "Escolta de un General (NUO)",
 3, 3500, "",
"Un General de las Naciones Unidas del Oeste ha solicitado nuestros servicios para escoltarlo en una visita a una planta de manufacturación de armas. Se sospecha que un escuadrón secreto del EPE planea asesinarle. Si el General sobrevive este ataque, la empresa a cargo de la producción de munición apuntará la 'pérdida' de un envío de municiones.",
 [], "++", "+", "-", "-", "x", "x"]
const NUOrescuehostages = [400, 300, 0, 0, 500, 0, 0, 400, 200, 800, "Rescate de rehenes (NUO)",
 4, 6000, "",
"Un Capitán de las Naciones Unidas del Oeste ha solicitado nuestros servicios para rescatar un escuadrón especial de los NUO. Han sido capturados en una base secreta del FLR escondida bajo un sitio de construcción abandonado. El Capitán ha autorizado la ‘recuperación’ de los materiales de construcción de la zona como bono extra por la misión.",
 [], "+", "+", "x", "x", "-", "--"]
const EPEammotransport = [500, 400, 0, 0, 300, 0, 0, 1000, 750, 800, "Proteger transporte de municiones (EPE)", 3, 5000, "",
"Un sargento del Ejército de los Pueblos del Este ha solicitado nuestros servicios para asistir con el transporte de munición en una zona ocupada por los NUO. Esperamos mucha resistencia de sus fuerzas.",
 [], "--", "-","++", "+", "x", "x"]
const EPEpropaganda = [100, 600, 0, 0, 500, 800, 500, 0 , 0, 1000, "Entrega de propaganda (EPE)", 7, 3000, "",
"Un agente secreto del Ejército de los Pueblos del Este ha solicitado nuestros servicios para esparcir propaganda política en una zona bajo el dominio de los NUO. Aunque no se espera ninguna escaramuza, nuestros soldados deberán tener un poco de experiencia. La misión es larga pero compensará con una buena paga y un gran envío de municiones y raciones.",
 [], "-", "--","+", "++", "x", "x"]
const EPEclearbase = [500, 100, 0, 0, 500, 1000, 500, 0 , 0, 1000, "Ataque en base secreta del FLR (EPE)", 2, 8000, "",
"Un espía del Ejército de los Pueblos del Este ha solicitado nuestros servicios para neutralizar una base secreta del FLR en su territorio. Esta base alberga una gran cantidad de municiones y explosivos, y el EPE sospecha de que planean un ataque en uno de sus edificios gubernamentales. Es una misión rápida, pero necesitarás tus soldados más fuertes para llevar a cabo la misión y conseguir un gran bono.",
 [], "x", "x", "+", "++", "--", "--"]
const FLRrecovervic = [100, 200, 0, 500, 100, 0, 600, 1000, 300, 500, "Recuperar vehículo abandonado (FLR)", 2, 3000, "", "Un capitán de las Fuerzas de Liberación Rebelde ha solicitado nuestros servicios para recuperar un vehículo blindado en una zona ocupada por los EPE. No esperamos una confrontación contra sus fuerzas.",
 [], "x", "x", "-", "-", "+", "+"]
const FLRstealshipment = [300, 200, 0, 0, 100, 500, 300, 0, 500, 600, "Robar cargo de los NUO (FLR)", 3, 4000, "",
"Un capitán de las Fuerzas de Liberación Rebelde ha solicitado nuestros servicios para capturar un transporte de cargo de los NUO que pasará por un territorio dominado por las fuerzas del FLR. Este está bien defendido pero los FLR lucharán a nuestro lado. Como recompensa, aparte del dinero, ofrecen una porción de los contenidos de cargo.",
 [], "--", "--", "x", "x", "++", "++"]
const FLRassassination = [200, 100, 0, 0, 500, 400, 400, 300, 300, 1500, "Asesinato de un político del EPE (FLR)", 2, 3000, "",
"Un sargento de las Fuerzas de Liberación Rebelde ha solicitado nuestros servicios para eliminar un político del EPE. Este estará dando una charla pública al aire libre en la capital de los Pueblos del Este, fomentando la ocupación de más territorios independientes. Esta es una misión muy controversial, para ambos los NUO y EPE. No estarán muy contentos de tu colaboración con lo que ellos consideran ‘terrorismo’.",
 [], "x", "--", "--", "--", "+", "++"]
var missionlist = [NUOconstroute, EPEammotransport, FLRrecovervic, NUOprotectgeneral, EPEpropaganda, FLRstealshipment, 
NUOrescuehostages, EPEclearbase, FLRassassination]

#0. name 1. CA 2. HP 3. helmet 4. vest
#5. uniform 6. weapon 7.STR 8. ID 9. STL
#10. MED 11. ENG 12. hab 13. assigned squad


var squad1 = [["Fence", 1200, 100, 0, 0, 0, 0, "A", "E", "C", "C", "E", "Ninguna", "1"],
 ["Skif", 750, 100, 0, 0, 0, 0, "F", "D", "D", "F", "C", "Ninguna", "1"],
 ["Philip", 600, 100, 0, 0, 0, 0, "C", "D", "E", "F", "E", "Ninguna", "1"],
 ["Yuri", 800, 100, 0, 0, 0, 0, "C", "B", "C", "F", "F", "Ninguna", "1"],
 ["Jonah", 500, 100, 0, 0, 0, 0, "E", "D", "E", "F", "A", "Ninguna", "1"]]
var squad2 = [["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]]
var squad3 = [["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]]
var squad4 = [["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]]
var squad5 = [["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]]
var reserve = [["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
 ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"],
["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]]

#0. Nombre misión 1. ammo reward 2. ration reward 3. constmats reward
#4. parts reward 5. money reward 6. victory chance 7. days left

var currentmissions = [["En base", "???", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", "???", false]]
var dailyreport = [["En base", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", false],
["En base", "???", "???", "???", "???", "???", "???", false]]
var fallensoldiers = [["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"]]
var arr = []
var allsquads = [squad1, squad2, squad3, squad4, squad5, reserve]
var busysquads = [false, false, false, false, false]

var upgradecostbarr = [1000, 0, 2000, 3000, 2000]
var upgradecostclinic = [0, 1000, 3000, 2000, 2000]






# Called when the node enters the scene tree for the first time.
func _ready():
	get_random_numbers(0, missionlist.size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
#get_random_numbers(0, 3)
func get_random_numbers(from, to):
	for i in range(from,to):
		arr.append(i)
		arr.shuffle()
		

func assignedsquad(squad):
	squadselected = squad

func calcsoldierpay():
	soldierpay = 0
	for i in allsquads.size():
		for n in allsquads[i].size():
			if (allsquads[i][n][0] != "Vacío"):
				soldierpay = soldierpay + 5
				
func soldierdailyheal():
	for i in allsquads.size():
		for n in allsquads[i].size():
			if (allsquads[i][n][2] != 100):
				allsquads[i][n][2] = allsquads[i][n][2] + randi_range(1, healamount)
				if (allsquads[i][n][2] > 100):
					allsquads[i][n][2] = 100
					
func deadsoldier():
	for i in allsquads.size():
		for n in allsquads[i].size():
			if (allsquads[i][n][2] <= 0):
				fallensoldiers[i][n] = allsquads[i][n][0]
				allsquads[i][n] = ["Vacío", 0, 100, 0, 0, 0, 0, "F", "F", "F", "F", "F", "Ninguna", "???"]
				
func wipedeadsoldier():
	fallensoldiers = [["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
	["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
	["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
	["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"],
	["Ninguno", "Ninguno", "Ninguno", "Ninguno", "Ninguno"]]

func losestate():
	if (money == 0):
		return true

func winstate():
	if (NUOprogress == 0 && EPEprogress == 0):
		return true
		conflictwinner = "FLR"
	if (FLRprogress == 0 && EPEprogress == 0):
		return true
		conflictwinner = "NUO"
	if (FLRprogress == 0 && NUOprogress == 0):
		return true
		conflictwinner = "EPE"

func repcheck():
	if (NUOrep > 150):
		NUOrep = 150
	if (NUOrep < -150):
		NUOrep = -150
	if (EPErep > 150):
		EPErep = 150
	if (EPErep < -150):
		EPErep = -150
	if (FLRrep > 150):
		FLRrep = 150
	if (FLRrep < -150):
		FLRrep = -150
func warcheck():
	if (NUOprogress > 600):
		NUOprogress = 600
	if (NUOprogress < 0):
		NUOprogress = 0
	if (EPEprogress > 600):
		EPEprogress = 600
	if (EPEprogress < 0):
		EPEprogress = 0
	if (FLRprogress > 600):
		FLRprogress = 600
	if (FLRprogress < 0):
		FLRprogress = 0

func healupgrade():
	healamount = 20

func deadfaction():
	if (NUOprogress == 0):
		missionlist[0] = missionlist[randi_range(1, 3)]
		missionlist[3] = missionlist[randi_range(4, 6)]
		missionlist[6] = missionlist[randi_range(7, 9)]
	if (EPEprogress == 0):
		missionlist[1] = missionlist[randi_range(1, 3)]
		missionlist[4] = missionlist[randi_range(4, 6)]
		missionlist[7] = missionlist[randi_range(7, 9)]
	if (FLRprogress == 0):
		missionlist[2] = missionlist[randi_range(1, 3)]
		missionlist[5] = missionlist[randi_range(4, 6)]
		missionlist[8] = missionlist[randi_range(7, 9)]
