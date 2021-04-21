depth = -y;
image_speed = 0;

var moveHorizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A")));

hsp = moveHorizontal * spd;

var moveVertical = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

vsp = moveVertical * spd;

if (place_meeting(x + hsp, y, oWall)){
	while(!place_meeting(x + sign(hsp), y, oWall)){
		x += sign(hsp)
	}
	hsp = 0;
}

if (place_meeting(x, y + vsp, oWall)){
	while(!place_meeting(x, y + sign(vsp), oWall)){
		y += sign(vsp)
	}
	vsp = 0;
}

x += hsp;

y += vsp;
if (hsp > 0){
	sprite_index = s_player_run_right;
	image_xscale = 1;
	image_speed = 1;
	ministeps ++;
} else if (hsp < 0){
	sprite_index = s_player_run_right;
	image_xscale = -1;
	image_speed = 1
	ministeps ++;
} else if (vsp > 0){
	sprite_index = s_player_run_down;
	image_speed = 1;
	ministeps ++;
} else if (vsp < 0) {
	sprite_index = s_player_run_up;
	image_speed = 1;
	ministeps ++;
} else {
	image_index = 0;
}


 





//if (keyboard_check(ord("W")) && (!place_meeting(x , y - 2, oWall))){
//	y -= 2;
//	ministeps ++;
//	sprite_index = s_player_run_up
//	image_speed = 1;
//}

//if (keyboard_check(ord("S")) && (!place_meeting(x, y + 2, oWall))){
//	y += 2;
//	ministeps ++;
//	sprite_index = s_player_run_down;
//	image_speed = 1;
//}

//if (keyboard_check(ord("D")) && (!place_meeting(x + 2, y, oWall))){
//	x += 2;
//	ministeps ++;
//	sprite_index = s_player_run_right;
//	image_speed = 1;
//}

//if (keyboard_check(ord("A")) && (!place_meeting(x - 2, y, oWall))){
//	x -= 2;
//	ministeps ++;
//	sprite_index = s_player_run_left;
//	image_speed = 1;
//}



min_ = 10;
max_ = 30;
if (ministeps == 50){
	steps ++;
	ministeps = 0;
}

chanceOfbattle = irandom_range(min_, max_);
if (steps == chanceOfbattle){
	if (!instance_exists(oFade)){
		fadeToRoom(rBattle, 60, c_white);
	}
	//room_goto(rBattle);
	steps = 0;
	ministeps = 0;
	
}



