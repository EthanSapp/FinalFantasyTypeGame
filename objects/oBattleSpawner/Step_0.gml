if (room == rBattle){
	#region battle system
	#region init/reset

	if (state = "INIT"){
		if (ds_exists(dsTargetHeroes, ds_type_list)){
			ds_list_destroy(dsTargetHeroes);
			dsTargetHeroes = -1; 
		}

		if (ds_exists(dsTargetMonsters, ds_type_list)){
			ds_list_destroy(dsTargetMonsters);
			dsTargetMonsters = -1; 
		}
	
		dsTargetHeroes = ds_list_create();
		dsTargetMonsters = ds_list_create();
	
		with(oHero){
			instance_destroy();
		}
	
		with(oEnemies){
			instance_destroy();
		}
	
		//spawn heroes
		heroPartySize = array_height_2d(gaHeroes);
	
		heroX = room_width - 520;
		heroY = 50;
	
		for (var i = 0; i < heroPartySize; i ++){
			hero = instance_create_depth(heroX, heroY + (i * (sprite_get_height(sHero) + 20)), -100, oHero);
			hero.index = i;
			hero.dead = false;
			hero.stunned = 0;
			hero.isAsleep = false;
			hero.isDefending = false;
			ds_list_add(dsTargetHeroes, hero);
		}
	
		//spawn monsters
		totalMonsterGroups = irandom_range(1, 3);	 
	
		for (var i = 0; i < totalMonsterGroups; i ++){
			monsterGroup = instance_create_depth(aMonsterPos[i, 0], aMonsterPos[i, 1], -100, oEnemies);
			monsterGroup.type =	irandom((sEnemies) - 1);
			monsterGroup.number = irandom(maxMonstersPerGroup - 1) + 1;
			monsterGroup.dead = false;
			monsterGroup.stunned = 0;
			monsterGroup.isAsleep = false;
			monsterGroup.hp  = gaMonsters[monsterGroup.type, 1];
			ds_list_add(dsTargetMonsters, monsterGroup);
		}
	
	
		playerTurn = true;
		actionState = "INIT";
		magicState = "MAIN"
		attackTimer = 0;
		timeTillMonstersAttack = 60;
		timer = 0;
	
		item = 0;

	
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
	
		if (ds_exists(dsMagic, ds_type_list)){
			ds_list_destroy(dsMagic);
			dsMagic = -1; 
		}
	
		state = "READY";
	} 

	#endregion

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
					isDefending = false
				}
			
				ds_list_sort(dsHeroes,true);
		
				menuState = "MAIN";
				menuSelected = 0;
				optionState = "MENU";
				optionTarget = noone;
		
				actionState = "READY";
			}
		
			if (actionState == "READY"){
			
				heroToCommand = dsHeroes[| 0];
			
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
						#region attack
						if(menuSelected == 0){
							if (optionState != "ATTACK"){
								with(oEnemies){
									if (number > 0){
										other.optionTarget = id;
										break;
									}
								}
							
								//selectedActor = ds_list_find_value(dsTargetMonsters, optionTarget);
								selectedActor = 0;
								optionState = "ATTACK";
							} else {
								heroToCommand = ds_list_find_value(dsHeroes, 0);
								ds_list_delete(dsHeroes, 0);
							
								heroMaxDamage = gaHeroes[heroToCommand.index, 5];
								heroTotaldamage = irandom_range(1, heroMaxDamage);
							
								scrDamage(heroTotaldamage, optionTarget);
							
								heroToCommand.attack = true;
								optionState = "MENU";
							}
						}
						#endregion
					
						#region magic
						//magic
						if (menuSelected == 1){
							if (optionState != "MAGIC"){
								//check magic list exists
								if (ds_exists(dsMagic, ds_type_list)){
									ds_list_destroy(dsMagic);
									dsMagic = -1;
								}
								//create magic list
								dsMagic = ds_list_create();
							
								//add spells to list
								for (var spells = 6; spells < 10; spells ++){
									if(gaHeroes[heroToCommand.index, spells] = true){
										ds_list_add(dsMagic, spells);
									}
								}
							
								selectedSpell = 0;
								magicState = "MAIN"
								optionState = "MAGIC";
							} else {
								if (magicState != "CHOOSE TARGET"){
									if (dsMagic[| selectedSpell] == 6){
										optionTarget = heroToCommand
										selectedActor = heroToCommand.index;
									} else {
										with (oEnemies){
											if (number > 0){
												other.optionTarget = id;
												break;
											}
										}
										//selectedActor = ds_list_find_value(dsTargetMonsters, optionTarget);
										selectedActor = 0;
									}
									if (ds_list_size(dsMagic) > 0 ) magicState = "CHOOSE TARGET";

								} else {
									if (dsMagic[| selectedSpell] <= 7){
										healMPCost = 2;
										hurtMPCost = 4;
										if (dsMagic[| selectedSpell] == 6){
											if (healMPCost <= gaHeroes[heroToCommand.index, 4]){
												heroTotaldamage = irandom_range(-4, -8);
										
												scrDamage(heroTotaldamage, optionTarget);
												gaHeroes[heroToCommand.index, 4] -= healMPCost;
											} else {
												magicState = "MAIN";
											}
										} else if (dsMagic[| selectedSpell] == 7){
											if (hurtMPCost <= gaHeroes[heroToCommand.index, 4]){
												heroTotaldamage = irandom_range(4, 8);
										
												scrDamage(heroTotaldamage, optionTarget);
												gaHeroes[heroToCommand.index, 4] -= hurtMPCost;
											}  else {
												magicState = "MAIN";
											}
										}

									} else {
										//stun
										stunMpCost = 1;
										if (stunMpCost <= gaHeroes[heroToCommand.index, 4]){
											if (dsMagic[| selectedSpell] == 8){
												chanceToStun = 50;
												roll = irandom(99);
												if (chanceToStun < roll){
													optionTarget.stunned = 3;
												}
												gaHeroes[heroToCommand.index, 4] -= stunMpCost;

											}
										} else {
											magicState = "MAIN";
										}
									
										//sleep
										sleepMpCost = 3;
										if (sleepMpCost <= gaHeroes[heroToCommand.index, 4]){
											if (dsMagic[| selectedSpell] == 9){
												chanceToSleep = 25;
												roll = irandom(99);
												gaHeroes[heroToCommand.index, 4] -= sleepMpCost;
										
												if (chanceToSleep < roll){
													optionTarget.isAsleep = true;
												}
											}
										}
									}
									heroToCommand = ds_list_find_value(dsHeroes, 0);
									ds_list_delete(dsHeroes, 0);
									heroToCommand.attack = true;
									optionState = "MENU";
									magicState = "MAIN";
								}
							}
						}
						#endregion
						//item
						if (menuSelected == 2){
							selectedItem = 0
							if (optionState != "ITEM") && (optionState != "CHOOSE TARGET"){
								optionState = "ITEM";
							} else {
								if (optionState == "ITEM"){
									if (selectedItem  != ""){
										optionTarget = heroToCommand;
										selectedActor = heroToCommand.index
										selectedItem = array_length_1d(inv);
										optionState = "CHOOSE TARGET"
										
									}
								} else {
									if (optionState == "CHOOSE TARGET"){
										heroToCommand = ds_list_find_value(dsHeroes, 0);
									
										//selectedItem = 0;
										if (inv[selectedItem] == "POTION"){
											heroTotaldamage = irandom_range(-5, -10);
											scrDamage(heroTotaldamage, optionTarget);
										}
										if (inv[selectedItem] == "EATHER"){
											heroTotaldamage = irandom_range(1,5);
											scrDamage(heroTotaldamage, optionTarget);
										}
										

									
										ds_list_delete(dsHeroes, 0);
									
															
										heroToCommand.attack = true;
										optionState = "MENU";
										menuState = "MAIN";
									}
								}
							}
						}
						//defence
						if (menuSelected == 3){
							heroToCommand.isDefending = true
						
							heroToCommand = ds_list_find_value(dsHeroes, 0);
									
						
							heroToCommand.attack = true;
							optionState = "MENU";
						}
						//flee
						if (menuSelected == 4){
							//optionState = "FLEE";'
							runEvent = choose("FAIL", "SUCCEED"){
								if (runEvent == "FAIL"){
									heroToCommand.isDefending = true
						
									heroToCommand = ds_list_find_value(dsHeroes, 0);
									
						
									heroToCommand.attack = true;
									optionState = "MENU";
								} else {
									battleOverText = "THE HEROES RAN AWAY!";
									state = "BATTLE OVER";
								}
							}
						}
					}
				
					if (optionState = "ATTACK") || (magicState == "CHOOSE TARGET"){
						if (optionTarget.sprite_index == sEnemies){
							if (keyboard_check_pressed(vk_left)){
								optionTarget = dsTargetHeroes[|0];
							}
						
							if (keyboard_check_pressed(vk_down)){
								if ((selectedActor + 1) < ds_list_size(dsTargetMonsters)){
									selectedActor ++;
								} else {
									selectedActor = 0;
								}
								optionTarget = dsTargetMonsters[|selectedActor];
							}
							if (keyboard_check_pressed(vk_up)){
								if ((selectedActor - 1) >= 0){
									selectedActor --;
								} else {
									selectedActor = (ds_list_size(dsTargetMonsters) - 1)
								}
								optionTarget = dsTargetMonsters[|selectedActor];
							}
						} else {
							if (optionTarget.sprite_index == sHero){
								if (keyboard_check_pressed(vk_right)){
									selectedActor = 0;
									optionTarget = dsTargetMonsters[|0];
								}
						
								if (keyboard_check_pressed(vk_down)){
									if ((selectedActor + 1) < ds_list_size(dsTargetHeroes)){
										selectedActor ++;
									} else {
										selectedActor = 0;
									}
									optionTarget = dsTargetHeroes[|selectedActor];
								}
								if (keyboard_check_pressed(vk_up)){
									if ((selectedActor - 1) >= 0){
										selectedActor --;
									} else {
										selectedActor = (ds_list_size(dsTargetHeroes) - 1)
									}
									optionTarget = dsTargetHeroes[|selectedActor];
								}
							}
						}
					}
					//magic
					if (optionState = "MAGIC"){
					
						if (magicState == "MAIN"){
							totalKnownSpells = ds_list_size(dsMagic) - 1;
							if (keyboard_check_pressed(vk_up)){
								if (selectedSpell == 0){
									selectedSpell = totalKnownSpells
								} else {
									selectedSpell --
								}
							}
							if (keyboard_check_pressed(vk_down)){
								if (selectedSpell == totalKnownSpells){
									selectedSpell = 0;
								} else {
									selectedSpell ++;
								}
							}
						}
					}
					if (optionState == "ITEM"){
						totalItems = 4;
						if (keyboard_check_pressed(vk_up)){
							if (selectedItem == 0){
								selectedItem = totalItems
							} else {
								selectedItem --
							}
						}
						if (keyboard_check_pressed(vk_down)){
							if (selectedItem == totalItems){
								selectedItem = 0;
							} else {
								selectedItem ++;
							}
						}
					}
				}
			
				if (keyboard_check_pressed(vk_tab)){
					menuState = "MAIN"
					optionState = "MENU";
					magicState = "MAIN"
				}

				if (ds_list_size(dsHeroes) <= 0){
					actionState = "INIT";	
					playerTurn = false;
				}
			}
		}
		#region enemy turn
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
						//ger proper monster
					
						activeMonster = ds_list_find_value(dsMonsters, 0);
						ds_list_delete(dsMonsters, 0);
					
						//check if stun / asleep
						if (activeMonster.stunned > 0){
							activeMonster.stunned --;
						}
					
						if (activeMonster.isAsleep){
							roll = irandom(99);
							chanceToWake = 25;
						
							if (chanceToWake < roll){
								activeMonster.isAsleep = false;
							}
						}
					
						if (activeMonster.stunned <= 0) && (activeMonster.isAsleep = false){
							activeMonster.attack = true;
						
							randomVictim = irandom(ds_list_size(dsTargetHeroes) - 1);
							victim = dsTargetHeroes[|randomVictim];
							maxMonsterDamage = gaMonsters[activeMonster.image_index, 5];
							damage = irandom_range(1, maxMonsterDamage);
						
							scrDamage(damage, victim);
						}
						attackTimer = 0;
					}
				
					if (ds_list_size(dsMonsters) <= 0){
						actionState = "INIT";	
						playerTurn = true;
					}
				
			}
		}
		#endregion
	}

	if (state == "BATTLE OVER"){
		timer ++;
		if (keyboard_check(vk_space)) && (timer >= room_speed * 3){
			with(oHero){
				instance_destroy();
			}
		
			with(oEnemies){
				instance_destroy();
			}
		
			instance_destroy();
		
			room_goto(rMain);
		}
	}
	#endregion
}