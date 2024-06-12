extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	$ammocost.text = str(Global.missionlist[Global.arr[0]][0])
	$rationscost.text = str(Global.missionlist[Global.arr[0]][1])
	$constmatscost.text = str(Global.missionlist[Global.arr[0]][2])
	$partscost.text = str(Global.missionlist[Global.arr[0]][3])
	$moneycost.text = str(Global.missionlist[Global.arr[0]][4])
	$ammoreward.text = str(Global.missionlist[Global.arr[0]][5])
	$rationsreward.text = str(Global.missionlist[Global.arr[0]][6])
	$constmatsreward.text = str(Global.missionlist[Global.arr[0]][7])
	$partsreward.text = str(Global.missionlist[Global.arr[0]][8])
	$moneyreward.text = str(Global.missionlist[Global.arr[0]][9])
	$titlemission.text = Global.missionlist[Global.arr[0]][10]
	$duracionnum.text = str(Global.missionlist[Global.arr[0]][11])
	$hcreqnum.text = str(Global.missionlist[Global.arr[0]][12])
	$othereq.text = str(Global.missionlist[Global.arr[0]][13])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	assigndata()
	
	
func assigndata():
	$ammocost.text = str(Global.missionlist[Global.arr[0]][0])
	$rationscost.text = str(Global.missionlist[Global.arr[0]][1])
	$constmatscost.text = str(Global.missionlist[Global.arr[0]][2])
	$partscost.text = str(Global.missionlist[Global.arr[0]][3])
	$moneycost.text = str(Global.missionlist[Global.arr[0]][4])
	$ammoreward.text = str(Global.missionlist[Global.arr[0]][5])
	$rationsreward.text = str(Global.missionlist[Global.arr[0]][6])
	$constmatsreward.text = str(Global.missionlist[Global.arr[0]][7])
	$partsreward.text = str(Global.missionlist[Global.arr[0]][8])
	$moneyreward.text = str(Global.missionlist[Global.arr[0]][9])
	$titlemission.text = Global.missionlist[Global.arr[0]][10]
	$duracionnum.text = str(Global.missionlist[Global.arr[0]][11])
	$hcreqnum.text = str(Global.missionlist[Global.arr[0]][12])
	$othereq.text = str(Global.missionlist[Global.arr[0]][13])
	broke()

func broke():
	if ((Global.missionlist[Global.arr[0]][0] > Global.ammo) || (Global.missionlist[Global.arr[0]][1] > Global.ration)
	|| (Global.missionlist[Global.arr[0]][2] > Global.constmats) || (Global.missionlist[Global.arr[0]][3] > Global.parts)
	|| (Global.missionlist[Global.arr[0]][4] > Global.money)):
		$asignarescbtn.disabled = true
	else:
		$asignarescbtn.disabled = false
