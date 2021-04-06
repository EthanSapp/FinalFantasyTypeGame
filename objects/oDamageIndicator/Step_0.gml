timer ++;

if (timer >= timeTillAscend){
	y--;
	alpha -= 0.1;
	timer = 0;
}

if (alpha <= 0){
	instance_destroy();
}