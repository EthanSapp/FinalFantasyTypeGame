if (state = "INIT"){
	with(oHero){
		instance_destroy();
	}
	
	with(oEnemies){
		instance_destroy();
	}
	
	//spawn heroes
	heroPartySize = array_height_2d(gaHeroes);
	
	heroX = room_width - 520;
	heroY = 100;
	
	for (var i = 0; i < heroPartySize; i ++){
		hero = instance_create_depth(heroX, heroY + (i * (sprite_get_height(sHero) + 20)), -100, oHero);
		hero.index = i;
		hero.dead = false;
	}
	
	//spawn monsters
	totalMonsterGroups = 3;	 
	
	for (var i = 0; i < totalMonsterGroups; i ++){
		monsterGroup = instance_create_depth(aMonsterPos[i, 0], aMonsterPos[i, 1], -100, oEnemies);
		monsterGroup.type =	irandom((sprite_get_number(sEnemies) - 1));
		monsterGroup.number = irandom(maxMonstersPerGroup - 1) + 1;
		monsterGroup.dead = false;
		monsterGroup.hp  = gaMonsters[monsterGroup.type, 1];
	}
	
	playerTurn = true;
	actionState = "INIT";
	attackTimer = 0;
	timeTillMonstersAttack = 60;
	
	menuState = "MAIN";
	menuSelected = 0;
	
	
	if (ds_exists(dsHeroes, ds_type_list)){
		ds_list_destroy(dsHeroes);
		dsHeroes = -1; 
	}

	if (ds_exists(dsMonsters, ds_type_list)){
		ds_list_destroy(dsMonsters);
		dsMonsters = -1; 
	}
	
	state = "READY";
} 


if (state = "READY"){
	if (playerTurn){
		if (actionState == "INIT"){
			if (ds_exists(dsHeroes, ds_type_list)){
				ds_list_destroy(dsHeroes);
				dsHeroes = -1;
			}

		
			dsHeroes = ds_list_create();
		
			with(oHero){
				if (gaHeroes[index, 2] > 0) ds_list_add(other.dsHeroes, id)
			}
			
			ds_list_sort(dsHeroes,true);
		
			menuState = "MAIN";
			menuSelected = 0;
			optionState = "MENU";
			optionTarget = noone;
		
			actionState = "READY";
		}
		
		if (actionState == "READY"){
			if (menuState = "MAIN"){
				if (optionState == "MENU"){
					if (keyboard_check_pressed(vk_up)){
						if ((menuSelected - 1) >= 0){
							menuSelected --;
						} else {
							menuSelected = array_length_1d(aMenu) - 1;
						}
					}

					if (keyboard_check_pressed(vk_down)){
						if ((menuSelected + 1) < array_length_1d(aMenu)){
							menuSelected ++;
						} else {
							menuSelected = 0;
						}
					}
				}
				
				if (keyboard_check_pressed(vk_space)){
					if(menuSelected == 0){
						if (optionState != "ATTACK"){
							with(oEnemies){
								if (number > 0){
									other.optionTarget = id;
									break;
								}
							}
							optionState = "ATTACK";
						} else {
							heroToCommand = ds_list_find_value(dsHeroes, 0);
							ds_list_delete(dsHeroes, 0);
							
							heroMaxDamage = gaHeroes[heroToCommand, 5];
							heroTotaldamage = irandom_range(1, heroMaxDamage);
							
							scrDamage(heroTotaldamage, optionTarget);
							
							heroToCommand.attack = true;
						}
					}
				}
			}

			if (ds_list_size(dsHeroes) <= 0){
				actionState = "INIT";	
				playerTurn = false;
			}
		}
	}
	
	if (!playerTurn){
		if (actionState == "INIT"){
			if (ds_exists(dsMonsters, ds_type_list)){
				ds_list_destroy(dsMonsters);
				dsMonsters = -1;
			}

		
			dsMonsters = ds_list_create();
		
			with(oEnemies){
				if (number > 0) ds_list_add(other.dsMonsters, id);
			}
			
			ds_list_sort(dsHeroes,true);
		
			actionState = "READY";
		}
		
		if (actionState == "READY"){
				attackTimer ++;
				
				if (attackTimer >= timeTillMonstersAttack){
					activeMonster = ds_list_find_value(dsMonsters, 0);
					ds_list_delete(dsMonsters, 0);
					
					activeMonster.attack = true;
					attackTimer = 0;
				}
				
				if (ds_list_size(dsMonsters) <= 0){
					actionState = "INIT";	
					playerTurn = true;
				}
				
		}
	}
}