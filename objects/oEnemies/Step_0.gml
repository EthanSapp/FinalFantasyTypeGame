if (state = "INIT"){
	image_index = type;
	state = "READY";
}

if (state == "READY"){
	if (attack){
		if (x == startX) x -= (sprite_width * 3);
		attackAnimationTimer ++;
		if (attackAnimationTimer >= timeTillAttackAnimationEnds){
			x = startX;
			attackAnimationTimer = 0;
			attack = false;
		}
	}
}