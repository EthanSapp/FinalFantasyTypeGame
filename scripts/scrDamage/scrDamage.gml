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
			} else {
				target.hp = gaMonsters[target.type, 1]
			}
		}
	} else {
		if (target.sprite_index == sEnemies){
			gaMonsters[target.index, 2] -= totalDamage;
			
			if (gaHeroes[target.index, 2] <= 0){
				target.dead = true;
			}
		}
	}
}