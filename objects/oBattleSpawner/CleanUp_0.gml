if (ds_exists(dsHeroes, ds_type_list)){
	ds_list_destroy(dsHeroes);
	dsHeroes = -1; 
}

if (ds_exists(dsMonsters, ds_type_list)){
	ds_list_destroy(dsMonsters);
	dsMonsters = -1; 
}

if (ds_exists(dsTargetHeroes, ds_type_list)){
	ds_list_destroy(dsTargetHeroes);
	dsTargetHeroes = -1; 
}

if (ds_exists(dsTargetMonsters, ds_type_list)){
	ds_list_destroy(dsTargetMonsters);
	dsTargetMonsters = -1; 
}