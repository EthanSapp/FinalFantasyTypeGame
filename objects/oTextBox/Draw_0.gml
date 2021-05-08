var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

draw_sprite(sTextBox, 0, cx, cy + (room_height / 2));

if (charCount < string_length(text[page])){
	charCount += 0.5;
}

textPart = string_copy(text[page], 1, charCount);

draw_set_halign(fa_center)
draw_text(cx + (boxWidth / 2), (cy + (room_height / 2)), name);

draw_set_halign(fa_left);
draw_text_ext(cx + xBuffer, (cy + (room_height / 2)) + yBuffer, textPart, stringHeight, boxWidth - xBuffer);