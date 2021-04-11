if (state == "READY"){
	draw_self();
	
	if ((oBattleSpawner.playerTurn) && (oBattleSpawner.heroToCommand == id)){
		draw_sprite(sSelector, 0, x - (sprite_get_width(sSelector)), y + (sprite_height / 2));
	}
	
	if (dead){
		image_angle  = 90;
		
		y = (startY + sprite_width);
	}
}