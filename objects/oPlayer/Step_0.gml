depth = -y;
image_speed = 0;
if (room != rBattle){
	var moveHorizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A")));

	hsp = moveHorizontal * spd;

	var moveVertical = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

	vsp = moveVertical * spd;

	if (place_meeting(x + hsp * 2, y, oWall)){
		while(!place_meeting(x + sign(hsp) * 2, y, oWall)){
			x += sign(hsp)
		}
		hsp = 0;
	}

	if (place_meeting(x, y + vsp * 2, oWall)){
		while(!place_meeting(x, y + sign(vsp) * 2, oWall)){
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


	if (distance_to_object(oSwordInStone) < 10) && keyboard_check_pressed(ord("E")){
		oSwordInStone.image_index = 0;
	}
}

min_ = 10;
max_ = 30;
if (ministeps == 75){
	steps ++;
	ministeps = 0;
}

global.chanceOfbattle = irandom_range(min_, max_);
if (steps == global.chanceOfbattle){
	instance_create_depth(0, 0, 0, oFade);
	room_goto(rBattle);
	steps = 0;
	ministeps = 0;
	
}




