with (other){
	room = targetRoom;
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	//instance_deactivate_object(room)
	room_goto(targetRoom);
	fadeToRoom(targetRoom, 30, c_black);
}