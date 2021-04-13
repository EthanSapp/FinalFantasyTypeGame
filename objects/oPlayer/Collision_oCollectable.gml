var key = other.object.index;
var value = 1;

if (ds_map_exists(inventory, key)){
	value += ds_map_find_value(inventory, key);
	ds_map_replace(inventory, value, key);
} else{ 
	ds_map_add(inventory, value, key);
	ds_list_add(inventoryItems, key);
}


instance_destroy(other);