extends Panel


func _ready():
	assigndata()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func assigndata():
	$ammocost.text = str(Global.missionlist[Global.arr[1]][0])
	$rationscost.text = str(Global.missionlist[Global.arr[1]][1])
	$constmatscost.text = str(Global.missionlist[Global.arr[1]][2])
	$partscost.text = str(Global.missionlist[Global.arr[1]][3])
	$moneycost.text = str(Global.missionlist[Global.arr[1]][4])
	$ammoreward.text = str(Global.missionlist[Global.arr[1]][5])
	$rationsreward.text = str(Global.missionlist[Global.arr[1]][6])
	$constmatsreward.text = str(Global.missionlist[Global.arr[1]][7])
	$partsreward.text = str(Global.missionlist[Global.arr[1]][8])
	$moneyreward.text = str(Global.missionlist[Global.arr[1]][9])
	$titlemission.text = Global.missionlist[Global.arr[1]][10]
	$duracionnum.text = str(Global.missionlist[Global.arr[1]][11])
	$hcreqnum.text = str(Global.missionlist[Global.arr[1]][12])
	$othereq.text = str(Global.missionlist[Global.arr[1]][13])
