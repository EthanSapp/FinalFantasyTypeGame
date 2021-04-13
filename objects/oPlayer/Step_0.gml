if (keyboard_check(ord("W"))){
	y -= 3;
	ministeps ++;
}

if (keyboard_check(ord("S"))){
	y += 3;
	ministeps ++;
}

if (keyboard_check(ord("D"))){
	x += 3;
	ministeps ++;
}

if (keyboard_check(ord("A"))){
	x -= 3;
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



