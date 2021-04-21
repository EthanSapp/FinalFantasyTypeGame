// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fadeToRoom(rm, dr, c){
	var _room = argument0;
	var _dur = argument1;
	var _color = argument2;
	
	var inst = instance_create_depth(0, 0, 0, oFade);
	
	with (inst){
		targetRoom = _room;
		duration = _dur;
		color = _color
	}	
}