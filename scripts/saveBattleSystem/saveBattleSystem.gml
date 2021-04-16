// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveBattleSystem(){
	if (file_exists("battlesystem.sav")){
		file_delete("battlesystem.sav")
	}
	ini_open("battlesystem.sav");
	ini_write_real("Save1", "playerHealth", gaHeroes[hero.index, 2]);
	//ini_write_real("Save1", "playerMP", gaHeroes[hero.index, 4]);
	ini_close();
	
	battleAlreadyHappened = true;
}