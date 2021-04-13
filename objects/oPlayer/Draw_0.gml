draw_self();
draw_text(x, y - 32, string(steps));

if (shouldShowInventory){
	var len = ds_list_size(inventoryItems);
	for (var i = 0; i < len; i++){
		var key = ds_list_find_value(inventoryItems, i);
		var value = ds_map_find_value(inventory,key);
	}
}