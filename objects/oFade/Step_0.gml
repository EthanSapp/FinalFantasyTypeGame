if (state == 0){
	timer ++;
	if (timer >= duration){
		room_goto(targetRoom);
			
		state = 1;
	}
} else if (state == 1){
	timer --;
		
	if (timer <= 0){
		instance_destroy();
	}
	
	alpha = timer / duration;
}