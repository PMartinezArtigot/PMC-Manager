extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	assigndata()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func assigndata():
	$ammocost.text = str(Global.missionlist[Global.arr[2]][0])
	$rationscost.text = str(Global.missionlist[Global.arr[2]][1])
	$constmatscost.text = str(Global.missionlist[Global.arr[2]][2])
	$partscost.text = str(Global.missionlist[Global.arr[2]][3])
	$moneycost.text = str(Global.missionlist[Global.arr[2]][4])
	$ammoreward.text = str(Global.missionlist[Global.arr[2]][5])
	$rationsreward.text = str(Global.missionlist[Global.arr[2]][6])
	$constmatsreward.text = str(Global.missionlist[Global.arr[2]][7])
	$partsreward.text = str(Global.missionlist[Global.arr[2]][8])
	$moneyreward.text = str(Global.missionlist[Global.arr[2]][9])
	$titlemission.text = Global.missionlist[Global.arr[2]][10]
	$duracionnum.text = str(Global.missionlist[Global.arr[2]][11])
	$hcreqnum.text = str(Global.missionlist[Global.arr[2]][12])
	$othereq.text = str(Global.missionlist[Global.arr[2]][13])
