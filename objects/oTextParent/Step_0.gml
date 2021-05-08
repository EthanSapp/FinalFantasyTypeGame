var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);


if (place_meeting(x, y, oPlayer)){
	if (textBoxExists == noone){
		textBoxExists = instance_create_layer(cx, cy + (room_height / 2), "text", oTextBox);
		textBoxExists.text = instructions;
		textBoxExists.creator = self;
		textBoxExists.name = myName;
	}
} else {
	if (textBoxExists != noone){
		instance_destroy(textBoxExists);
		textBoxExists = noone;
	}
}