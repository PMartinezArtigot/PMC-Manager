extends Node

var day = 1
var ammo = 1000
var ration = 1000
var parts = 1000
var constmats = 1000
var money = 1000

var NUOprogress = 0
var EPEprogress = 0
var FLRprogress = 0
var NUOrep = 0
var EPErep = 0
var FLRrep = 0
var mission1inprog = 0
var mission2inprog = 0
var mission3inprog = 0

#0. ammo cost 1. ration cost 2. constmats cost 3. parts cost 4. money cost
#5. ammo reward 6. ration reward 7.constmats reward 8. parts reward 9. money reward
#10. mission title 11. mission duration 12. CA 13. other requirements
#14. missiondesc 15. array of rewards 16. NUO relations 17. NUO conflict prog
#18. EPE relations 19. EPE conflict prog 20. FLR relations 21. FLR conflict prog


const NUOconstroute = [0, 500, 0, 500, 300, 0, 500, 800, 0, 1000, "Construcción de rutas de suministro (NUO)",
 5, 1500, "Soldado con habilidad de arquitecto civil",
"Un comandante de las Naciones Unidas del Oeste ha solicitado nuestros servicios para la construcción de rutas de suministro entre varias bases bajo su dominio. Estas bases se encuentran en territorio simpatizante con las Fuerzas de Liberación Rebelde (FLR).",
 [], "++", "+", "x", "x", "-", "x"]
const EPEammotransport = [500, 400, 0, 0, 300, 0, 0, 1000, 750, 800, "Proteger transporte de municiones (EPE)", 0, 5000, "",
"Un sargento del Ejército de los Pueblos del Este ha solicitado nuestros servicios para asistir con el transporte de munición en una zona ocupada por los NUO. Esperamos mucha resistencia de sus fuerzas.",
 [], "--", "-", "x", "x", "++", "+"]
const FLRrecovervic = [100, 200, 0, 500, 100, 0, 600, 1000, 300, 500, "Recuperar vehículo abandonado (FLR)", 2, 3000, "Soldado con habilidad de mecánico", "Un capitán de las Fuerzas de Liberación Rebelde ha solicitado nuestros servicios para recuperar un vehículo blindado en una zona ocupada por los EPE. No esperamos una confrontación contra sus fuerzas.",
 [], "x", "x", "+", "+", "-", "x"]
const missionlist = [NUOconstroute, EPEammotransport, FLRrecovervic]

var squad1 = [["Stalone", 2000], ["Arnold", 2000], ["Seagal", 1000], ["Damme", 1500], ["Norris", 9990]]
var squad2 = [["Soap", 500], ["Price", 1000], ["Ghost", 800], ["Makarov", 600], ["Yuri", 500]]
var squad3 = [["Prapor", 200], ["Skif", 150], ["Skier", 100], ["Jaeger", 200], ["Fence", 200]]
var currentmissions = []
var arr = []






# Called when the node enters the scene tree for the first time.
func _ready():
	get_random_numbers(0, 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
#get_random_numbers(0, 3)
func get_random_numbers(from, to):
	for i in range(from,to):
		arr.append(i)
		arr.shuffle()
		
