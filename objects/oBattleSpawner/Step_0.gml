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
	}
	
	//spawn monsters
	totalMonsterGroups = irandom_range(1, maxMonsterGroups);
	
	for (var i = 0; i < totalMonsterGroups; i ++){
		monsterGroup = instance_create_depth(aMonsterPos[i, 0], aMonsterPos[i, 1], -100, oEnemies);
		monsterGroup.type = irandom((sprite_get_number(sEnemies) - 1));
		monsterGroup.number = irandom(maxMonstersPerGroup - 1) + 1;
	}
	
	state = "READY";
} 


if (state = "READY"){
	if (keyboard_check_pressed(vk_space)){
		state = "INIT";
	}
}