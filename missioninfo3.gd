extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	assigndata() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func assigndata():
	$desc.text = str(Global.missionlist[Global.arr[2]][14])
	$titlemission.text = str(Global.missionlist[Global.arr[2]][10])
	$NUOrelations.text = str(Global.missionlist[Global.arr[2]][16])
	$NUOconflict.text = str(Global.missionlist[Global.arr[2]][17])
	$EPErelations.text = str(Global.missionlist[Global.arr[2]][18])
	$EPEconflict.text = str(Global.missionlist[Global.arr[2]][19])
	$FLRrelations.text = str(Global.missionlist[Global.arr[2]][20])
	$FLRconflict.text = str(Global.missionlist[Global.arr[2]][21])
