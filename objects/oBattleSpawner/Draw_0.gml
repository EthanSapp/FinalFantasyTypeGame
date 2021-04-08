//draw menu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fMenu);

fontSize = font_get_size(fMenu);

BUFFER = 10;
menuX = (room_width / 2 ) + sprite_get_width(sSelector) + 120;
menuY = room_height - ((fontSize + BUFFER) * (array_length_1d(aMenu)));


if (menuState == "MAIN"){
	if (optionState = "MENU"){
		for (var i = 0; i < array_length_1d(aMenu); i ++){
			draw_text(menuX, menuY + (i * (fontSize + BUFFER)), aMenu[i]);
	
			if (menuSelected == i){
				arrowX = menuX - sprite_get_width(sSelector);
				arrowY = menuY + (i * (fontSize + BUFFER));
				draw_sprite(sSelector, 0, arrowX, arrowY);
			}
		}
	}
	if (optionState = "ATTACK") || (magicState == "CHOOSE TARGET") || (optionState == "CHOOSE TARGET"){
		if (optionTarget.sprite_index == sEnemies){
			draw_sprite_ext(sSelector, 0, optionTarget.x + sprite_get_width(sEnemies) / 2, optionTarget.y, 1, 1, 270, c_white, 1);
		}else {
			if (optionTarget.sprite_index == sHero){
				draw_sprite_ext(sSelector, 0, optionTarget.x + sprite_get_width(sEnemies) / 2, optionTarget.y - sprite_get_height(sSelector), 1, 1, 270, c_white, 1);
			}
		}
	}
	if (optionState == "MAGIC"){
		if (magicState = "MAIN"){
			//show spells
			for (var spells = 0; spells < ds_list_size(dsMagic); spells++){
				var spellID = ds_list_find_value(dsMagic, spells);
				if (spellID > -1) var spellName = aSpell[spellID];
				else var spellName = "NO SPELLS";
			
				draw_text(menuX + 100, menuY + (spells * (fontSize + BUFFER)), spellName);
			
				arrowX = (menuX + 100) - sprite_get_width(sSelector);
				arrowY = menuY + (spells * (fontSize + BUFFER));
				if (spells == selectedSpell){
					draw_sprite(sSelector, 0, arrowX, arrowY);
				}
			}
		}
	}
	if (optionState == "ITEM"){
		for (var item = 0; item < 3; item ++){
			if (gaInv[playerIndicator, item] == "") itemName = "EMPTY"
			else itemName = gaInv[playerIndicator, item];
			
			draw_text(menuX + 100, menuY + (item * (fontSize + BUFFER)), itemName);
			
			arrowX = (menuX + 100) - sprite_get_width(sSelector);
			arrowY = menuY + (item * (fontSize + BUFFER));
			if (item == selectedItem){
				draw_sprite(sSelector, 0, arrowX, arrowY);
			}
		}
	}
}

numberOfHeroes = array_height_2d(gaHeroes);
uiX = BUFFER;
uiY = room_height - (numberOfHeroes * (fontSize + BUFFER))

draw_text(uiX, uiY - (fontSize + BUFFER), "NAME:");
draw_text(uiX + string_width("ANDROMEDA "), uiY - (fontSize + BUFFER), "HP:");
draw_text(uiX + string_width("ANDROMEDA 999/999"), uiY - (fontSize + BUFFER), "MP:");

for (var i = 0; i < numberOfHeroes; i++){
	draw_text(uiX, uiY + (i * (fontSize + BUFFER)), gaHeroes[i, 0]);
	draw_text(uiX + string_width("ANDROMEDA "), uiY + (i * (fontSize + BUFFER)), string(gaHeroes[i, 2])  + "/" + string(gaHeroes[i, 1]));
	draw_text(uiX + string_width("ANDROMEDA 999/999"), uiY + (i * (fontSize + BUFFER)), string(gaHeroes[i, 4])  + "/" + string(gaHeroes[i, 3]));
}


