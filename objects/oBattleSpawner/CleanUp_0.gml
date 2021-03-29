if (ds_exists(dsHeroes, ds_type_list)){
	ds_list_destroy(dsHeroes);
	dsHeroes = -1; 
}

if (ds_exists(dsMonsters, ds_type_list)){
	ds_list_destroy(dsMonsters);
	dsMonsters = -1; 
}