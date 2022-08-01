// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Free(){
	// Calculate Movement
	vsp += grv;
	
	// Don't walk off edges
	if (grounded && afraidofheights && !tile_meeting(hsp, 1))
	{
		hsp = -hsp;
	}

	if (tile_meeting(hsp, 0))
	{
		if (hsp > 0)
			x = x - (x % 24) + 23 - (bbox_right - x);
		else
			x = x - (x % 24) - (bbox_left - x);
		hsp = -hsp;
	}
	x += hsp;
	
	if (tile_meeting(0, vsp))
	{
		if (vsp > 0)
			y = y - (y % 24) + 23 - (bbox_bottom - y);
		else
			y = y - (y % 24) - (bbox_top - y);
		vsp = 0;
	}
	y += vsp;
	
	if (tile_meeting(0, 1))
	{
		grounded = true;
		if (hsp == 0)
			sprite_index = idleSprite;
		else
			sprite_index = walkSprite;
	}
	else
		grounded = false;
	
	if (sign(hsp) > 0)
		image_xscale = -size;
	else if (sign(hsp) < 0)
		image_xscale = size;
	
	if (grounded)
	{
		if (distance_to_object(oPlayer) < 100 && 
			!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
			state = ENEMY_STATE.REACT;
	}
}