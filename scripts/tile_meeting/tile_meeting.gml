/// @description tile_meeting(tilemap, hsp, vsp)
/// @arg hsp Location to check in x direction
/// @arg vsp Location to check in y direction
///	@arg tilemap layer_tilemap_get_id of id	
function tile_meeting(hsp, vsp, tilemap = global.tilemap){
	var bbox_side;
	var collision = false;
	if (hsp != 0)
	{
		if (hsp > 0)
			bbox_side = bbox_right;
		else
			bbox_side = bbox_left;
		collision = 
				tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top) == 1 || 
				tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) == 1;
	}
	if (vsp != 0)
	{
		if (vsp > 0)
			bbox_side = bbox_bottom;
		else
			bbox_side = bbox_top;	
		collision = 
				tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) == 1 || 
				tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) == 1;
	}
	return collision;
}