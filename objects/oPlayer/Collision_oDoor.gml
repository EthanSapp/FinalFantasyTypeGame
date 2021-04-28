with (other){
	global.targetRoom = targetRoom;
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	//instance_deactivate_object(room)
	room_goto(targetRoom);
}