if (place_meeting(x, y, oPlayer)){
	instance_create_depth(0, 0, 0, oFade);
	instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oCheckPoint);
	instance_destroy(id);
	room_goto(rCultistBattle);
}