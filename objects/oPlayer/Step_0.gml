depth = -y;
if (keyboard_check(ord("W")) && (!place_meeting(x , y - 2, oWall))){
	y -= 2;
	ministeps ++;
}

if (keyboard_check(ord("S")) && (!place_meeting(x, y + 2, oWall))){
	y += 2;
	ministeps ++;
}

if (keyboard_check(ord("D")) && (!place_meeting(x + 2, y, oWall))){
	x += 2;
	ministeps ++;
}

if (keyboard_check(ord("A")) && (!place_meeting(x - 2, y, oWall))){
	x -= 2;
	ministeps ++;
}

if (ministeps >= 75){
	steps ++;
	ministeps = 0;
}


chanceOfbattle = irandom_range(10,30);
if (steps == chanceOfbattle){
	room_goto(rBattle);
}



