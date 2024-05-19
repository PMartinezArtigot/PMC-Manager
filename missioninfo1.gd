extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	assigndata() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func assigndata():
	$desc.text = str(Global.missionlist[Global.arr[0]][14])
	$titlemission.text = str(Global.missionlist[Global.arr[0]][10])
	$NUOrelations.text = str(Global.missionlist[Global.arr[0]][16])
	$NUOconflict.text = str(Global.missionlist[Global.arr[0]][17])
	$EPErelations.text = str(Global.missionlist[Global.arr[0]][18])
	$EPEconflict.text = str(Global.missionlist[Global.arr[0]][19])
	$FLRrelations.text = str(Global.missionlist[Global.arr[0]][20])
	$FLRconflict.text = str(Global.missionlist[Global.arr[0]][21])
