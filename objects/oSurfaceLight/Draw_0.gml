if (surface_exists(surface)){
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	
	
	surface_set_target(surface);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, cw, ch,0);
	draw_set_alpha(0.6);
	
	gpu_set_blendmode(bm_subtract);
	
	with(oPlayer){
		draw_sprite_ext(sLightSphere, 0, x - cx, y - cy, 1, 1, 0, c_white, 1);
	}
	
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
	draw_set_color(c_white);
	draw_surface(surface, cx, cy);
	

}

if (!surface_exists(surface)){
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	
	surface = surface_create(cw, ch);
	
	surface_set_target(surface);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, cw, ch,0);
	draw_set_alpha(0.6);
	draw_set_color(c_white);
	
	surface_reset_target();
}