// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ProcessMovement(_hsp = hsp, _vsp = vsp){
	// Horizontal Collision
	var bbox_side;
	if (_hsp > 0)
		bbox_side = bbox_right;
	else
		bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(global.tilemap, bbox_side + _hsp, bbox_top);
	p2 = tilemap_get_at_pixel(global.tilemap, bbox_side + _hsp, bbox_bottom);
	if (p1 == 1 || p2 == 1)
	{
		if (_hsp > 0)
			x = x - (x % 24) + 23 - (bbox_right - x);
		else
			x = x - (x % 24) - (bbox_left - x);
		_hsp = 0;
	}
	x += _hsp;
	
	var bbox_side;
	if (_vsp >= 0)
		bbox_side = bbox_bottom;
	else
		bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(global.tilemap, bbox_left, bbox_side + _vsp);
	p2 = tilemap_get_at_pixel(global.tilemap, bbox_right, bbox_side + _vsp);
	if (p1 == 1 || p2 == 1)
	{
		if (_vsp >= 0)
			y = y - (y % 24) + 23 - (bbox_bottom - y);
		else
			y = y - (y % 24) - (bbox_top - y);
		_vsp = 0;
	}
	y += _vsp;

}