if (state == "READY"){
	if (!dead){
		draw_self();		
	}


	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);

	//draw_text(x + (sprite_width / 2), y, string(number));
	numberX = x + ((sprite_width / 2) + 8);
	draw_set_halign(fa_left);
//	draw_text(numberX, y + (sprite_height / 2), string(gaMonsters[i, );
	
	draw_set_halign(fa_center)
	if (dead == false){
		if (stunned > 0){
			draw_text(x + (sprite_width / 2), y, "duhhh...");
		}
		if (stunned > 0) && (isAsleep){
			draw_text(x + (sprite_width / 2), y - 24, "zzz");
		}
		if (stunned == 0) && (isAsleep){
			draw_text(x + (sprite_width / 2), y, "zzz");
		}
	}
}