//draw menu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fMenu);

fontSize = font_get_size(fMenu);

BUFFER = 4;
menuX = sprite_get_width(sSelector);
menuY = room_height - ((fontSize + BUFFER) * (array_length_1d(aMenu)));


if (menuState == "MAIN"){
	if (optionState != "ATTACK"){
		for (var i = 0; i < array_length_1d(aMenu); i ++){
			draw_text(menuX, menuY + (i * (fontSize + BUFFER)), aMenu[i]);
	
			if (menuSelected == i){
				arrowX = 0;
				arrowY = menuY + (i * (fontSize + BUFFER));
				draw_sprite(sSelector, 0, arrowX, arrowY);
			}
		}
	}
	if (optionState = "ATTACK"){
		if (optionTarget.sprite_index == sEnemies){
			draw_sprite_ext(sSelector, 0, optionTarget.x + sprite_get_width(sEnemies) / 2, optionTarget.y, 1, 1, 270, c_white, 1);
		}else {
			if (optionTarget.sprite_index == sHero){
				draw_sprite_ext(sSelector, 0, optionTarget.x + sprite_get_width(sEnemies) / 2, optionTarget.y - sprite_get_height(sSelector), 1, 1, 270, c_white, 1);
			}
		}
	}
}

