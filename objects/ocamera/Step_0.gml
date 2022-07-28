/// @description Update Camera

// Update destination
if(instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));


// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);	
if (layer_exists("BackgroundLayer1"))
{
	layer_x("BackgroundLayer1", x / 15);
}
if (layer_exists("BackgroundLayer2"))
{
	layer_x("BackgroundLayer2", x / 10);
}

if (layer_exists("BackgroundLayer3"))
{
	layer_x("BackgroundLayer3", x / 8);
}