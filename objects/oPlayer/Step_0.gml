depth = -y;
if (keyboard_check(ord("W")) && (!place_meeting(x , y - 2, oWall))){
	y -= 2;
	steps ++;
}

if (keyboard_check(ord("S")) && (!place_meeting(x, y + 2, oWall))){
	y += 2;
	steps ++;
}

if (keyboard_check(ord("D")) && (!place_meeting(x + 2, y, oWall))){
	x += 2;
	steps ++;
}

if (keyboard_check(ord("A")) && (!place_meeting(x - 2, y, oWall))){
	x -= 2;
	steps ++;
}



min_ = 700;
max_ = 850;
chanceOfbattle = irandom_range(min_, max_);
if (steps == chanceOfbattle){
	room_goto(rBattle);
} else if (steps > max_){
	steps = 0;
	min_ += 5;
	max_ -= 5;
}



