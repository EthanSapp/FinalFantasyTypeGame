// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrDamage(){
	totalDamage = argument0;
	target = argument1;
	
	if (target.sprite_index == sEnemies){
		target.hp -= totalDamage;
		
		if (target.hp <= 0){
			target.number --;
			
			if (target.number <= 0){
				target.dead = true;
				pos = ds_list_find_index(dsTargetMonsters, target);
				ds_list_delete(dsTargetMonsters, pos);
				
				if (ds_list_size(dsTargetMonsters) == 0){
					oBattleSpawner.state = "BATTLE OVER";
					oBattleSpawner.battleOverText = "VICTORY!"
				}
			} else {
				target.hp = gaMonsters[target.type, 1]
			}
		}
	} else {
		if (target.sprite_index == sHero){
			if (target.isDefending) totalDamage = ceil(totalDamage / 2);
			
			gaHeroes[target.index, 2] -= totalDamage;
			
			if (gaHeroes[target.index, 2] <= 0){
				target.dead = true;
				if (gaHeroes[target.index, 2] <= 0){
					gaHeroes[target.index, 2] = 0;
				}
				
				pos = ds_list_find_index(dsTargetHeroes, target);
				ds_list_delete(dsTargetHeroes, pos);
				
				if (ds_list_size(dsTargetHeroes) == 0){
					oBattleSpawner.state = "BATTLE OVER";
					oBattleSpawner.battleOverText = "DEFEAT..."
				}
			}
		}
	}
	
	damage = instance_create_depth(target.x + sprite_get_width(target.sprite_index) / 2, target.y, -200, oDamageIndicator);
	damage.text = totalDamage
}