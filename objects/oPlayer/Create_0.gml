image_speed = 0;
//depth = -y;
//view_camera[0] = persistent;

global.targetX = -1;
global.targetY = -1;
global.targetRoom = -1;

spd = 2;

globalvar ministeps, steps;

steps = 0;
ministeps = 0
ministeps = 0

enum itemStats {
	name
}

enum itemTypes {
	sword,
	bow
}

aItems[itemTypes.sword, itemStats.name] = "SWORD";
aItems[itemTypes.bow, itemStats.name] = "BOW";

maxInvSlots = 6;

for (var inv = 0; inv < maxInvSlots; inv++){
	aInv[inv] = -1;
}


