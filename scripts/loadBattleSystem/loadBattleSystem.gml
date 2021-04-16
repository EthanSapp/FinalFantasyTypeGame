// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadBattleSystem(){
	if(file_exists("battlesystem.sav")){
		ini_open("battlesystem.sav");
		gaHeroes[hero.index, 2] = ini_read_real("Save1", "playerHealth", 0);
		//gaHeroes[hero.index, 4] = ini_read_real("Save1", "playerMP", 0);
		ini_close();
	}
}