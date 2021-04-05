state = "INIT";
dsHeroes = -1;
dsMonsters = -1;
dsTargetMonsters = -1;
dsTargetHeroes = -1;

maxMonsterGroups = 3;
maxMonstersPerGroup = 5;

aMonsterPos[0,0] = 560; //monster group 0 x cord
aMonsterPos[0,1] = room_width / 2; // monster group 0 y cord

aMonsterPos[1,0] = 560; //monster group 1 x cord
aMonsterPos[1,1] = aMonsterPos[0,1] - (sprite_get_height(sEnemies) + 104) - 24; // monster group 1 y cord

aMonsterPos[2,0] = 520; //monster group 2 x cord
aMonsterPos[2,1] = aMonsterPos[0,1] - (sprite_get_height(sEnemies) + 20) - 24; // monster group 2 y cord

//create menu array

aMenu[0] = "ATT";
aMenu[1] = "MGK";
aMenu[2] = "ITEM";
aMenu[3] = "DFND";
aMenu[4] = "FLEE";
