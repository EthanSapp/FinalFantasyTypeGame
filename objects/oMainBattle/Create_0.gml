//create menu array



globalvar gaHeroes, gaMonsters, currentHealth, currentMP, heroCount, monsterCount, cultist;


heroCount = 0;

monsterCount = 0;

/*
gaHeroes[heroCount, 0] = "" // name
gaHeroes[heroCount, 1] = ; // Max HP;
gaHeroes[heroCount, 2] = ; // Current HP;
gaHeroes[heroCount, 3] = ; // Max MP;
gaHeroes[heroCount, 4] = ; // Current MP;
gaHeroes[heroCount, 5] = ; //max melee damage
gaHeroes[heroCount, 6] = ; //knows heal spell
gaHeroes[heroCount, 7] = ; //knows hurt spell
gaHeroes[heroCount, 8] = ; // knows stun spell
gaHeroes[heroCount, 9] = ; //know sleep

heroCount ++;
*/

/*
gaMonsters[monsterCount, 0] = ""; // name
gaMonsters[monsterCount, 1] = ; // max HP
gaMonsters[monsterCount, 2] = ; // current HP
gaMonsters[monsterCount, 3] = ; // max MP
gaMonsters[monsterCount, 4] = ; // Current MP
gaMonsters[monsterCount, 5] = ;  //melee damage
gaMonsters[monsterCount, 6] = ; // knows heal spell
gaMonsters[monsterCount, 7] = ; // knows hurt spell
gaMonsters[monsterCount, 8] = ; //knows stun spell
gaMonsters[monsterCount, 9] = ; // knows sleep

monsterCount ++;
*/


gaHeroes[heroCount, 0] = "TITUS" // name
gaHeroes[heroCount, 1] = 20; // Max HP;
gaHeroes[heroCount, 2] = 20; // Current HP;
gaHeroes[heroCount, 3] = 10; // Max MP;
gaHeroes[heroCount, 4] = 10; // Current MP;
gaHeroes[heroCount, 5] = 3; //max melee damage
gaHeroes[heroCount, 6] = true; //knows heal spell
gaHeroes[heroCount, 7] = true; //knows hurt spell
gaHeroes[heroCount, 8] = false; // knows stun spell
gaHeroes[heroCount, 9] = false; //know sleep

gaInv[heroCount, 0] = "HERB";
gaInv[heroCount, 1] = "";
gaInv[heroCount, 2] = "";	
	

heroCount ++;

gaHeroes[heroCount, 0] = "ANDROMEDA" // name
gaHeroes[heroCount, 1] = 40; // Max HP;
gaHeroes[heroCount, 2] = 40; // Current HP;
gaHeroes[heroCount, 3] = 0; // Max MP;
gaHeroes[heroCount, 4] = 0; // Current MP;
gaHeroes[heroCount, 5] = 5; //max melee damage
gaHeroes[heroCount, 6] = false; //knows heal spell
gaHeroes[heroCount, 7] = false; //knows hurt spell
gaHeroes[heroCount, 8] = false; // knows stun spell
gaHeroes[heroCount, 9] = false; //know sleep

gaInv[heroCount, 0] = "HERB";
gaInv[heroCount, 1] = "";
gaInv[heroCount, 2] = "";	


heroCount ++;


gaHeroes[heroCount, 0] = "SALEM" // name
gaHeroes[heroCount, 1] = 15; // Max HP;
gaHeroes[heroCount, 2] = 15; // Current HP;
gaHeroes[heroCount, 3] = 30; // Max MP;
gaHeroes[heroCount, 4] = 30; // Current MP;
gaHeroes[heroCount, 5] = 2; //max melee damage
gaHeroes[heroCount, 6] = false; //knows heal spell
gaHeroes[heroCount, 7] = true; //knows hurt spell
gaHeroes[heroCount, 8] = true; // knows stun spell
gaHeroes[heroCount, 9] = true; //know sleep

gaInv[heroCount, 0] = "HERB";
gaInv[heroCount, 1] = "";
gaInv[heroCount, 2] = "";	
	


heroCount ++;


gaHeroes[heroCount, 0] = "STRAUS" // name
gaHeroes[heroCount, 1] = 12; // Max HP;
gaHeroes[heroCount, 2] = 12; // Current HP;
gaHeroes[heroCount, 3] = 40; // Max MP;
gaHeroes[heroCount, 4] = 40; // Current MP;
gaHeroes[heroCount, 5] = 1; //max melee damage
gaHeroes[heroCount, 6] = true; //knows heal spell
gaHeroes[heroCount, 7] = false; //knows hurt spell
gaHeroes[heroCount, 8] = false; // knows stun spell
gaHeroes[heroCount, 9] = true; //know sleep

gaInv[heroCount, 0] = "HERB";
gaInv[heroCount, 1] = "";
gaInv[heroCount, 2] = "";	


heroCount ++;

gaMonsters[monsterCount, 0] = ""; // name
gaMonsters[monsterCount, 1] = 12; // max HP
gaMonsters[monsterCount, 2] = 12; // current HP
gaMonsters[monsterCount, 3] = 10; // max MP
gaMonsters[monsterCount, 4] = 10; // Current MP
gaMonsters[monsterCount, 5] = 4;  //melee damage
gaMonsters[monsterCount, 6] = false; // knows heal spell
gaMonsters[monsterCount, 7] = true; // knows hurt spell
gaMonsters[monsterCount, 8] = true; //knows stun spell
gaMonsters[monsterCount, 9] = false; // knows sleep

monsterCount ++;

gaMonsters[monsterCount, 0] = ""; // name
gaMonsters[monsterCount, 1] = 6; // max HP
gaMonsters[monsterCount, 2] = 6; // current HP
gaMonsters[monsterCount, 3] = 30; // max MP
gaMonsters[monsterCount, 4] = 30; // Current MP
gaMonsters[monsterCount, 5] = 2;  //melee damage
gaMonsters[monsterCount, 6] = false; // knows heal spell
gaMonsters[monsterCount, 7] = true; // knows hurt spell
gaMonsters[monsterCount, 8] = true; //knows stun spell
gaMonsters[monsterCount, 9] = false; // knows sleep

monsterCount ++;

gaMonsters[monsterCount, 0] = ""; // name
gaMonsters[monsterCount, 1] = 10; // max HP
gaMonsters[monsterCount, 2] = 10; // current HP
gaMonsters[monsterCount, 3] = 12; // max MP
gaMonsters[monsterCount, 4] = 12; // Current MP
gaMonsters[monsterCount, 5] = 2;  //melee damage
gaMonsters[monsterCount, 6] = true; // knows heal spell
gaMonsters[monsterCount, 7] = false; // knows hurt spell
gaMonsters[monsterCount, 8] = false; //knows stun spell
gaMonsters[monsterCount, 9] = false; // knows sleep

monsterCount ++;

cultist[0, 0] = "";
cultist[0, 1] = 50;
cultist[0, 2] = 50;
cultist[0, 3] = 25;
cultist[0, 4] = 25;
cultist[0, 5] = 7;
cultist[0, 6] = true;
cultist[0, 7] = true;
cultist[0, 8] = false;
cultist[0, 9] = true;


globalvar potionAmount, aetherAmount, bombAmount;