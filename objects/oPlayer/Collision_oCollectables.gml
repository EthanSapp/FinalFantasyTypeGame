var key = other.object_index;
var value = 1;

ds_map_add(inventory, key, value);

if (ds_map_exists(inventory, key)){
	value += ds_map_find_value(inventory, key);
}

ds_map_add(inventory, key, value);

instance_destroy(other);

show_message("KEY: " + string(key) + " VALUE: " + string(value));