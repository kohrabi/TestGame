// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Free(){
	// Calculate Movement
	vsp += grv;
	
	// Don't walk off edges
	if (grounded && afraidofheights && !place_meeting(x + hsp, y + 1, oWall))
	{
		hsp = -hsp;
	}
	
	// Horizontal Collision
	if (place_meeting(x + hsp, y, oWall))
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);
		}
		hsp = -hsp;		
	}
	
	x += hsp;
	
	// Vertical Collision
	if (place_meeting(x, y + vsp, oWall))
	{
		while (!place_meeting(x, y + sign(vsp), oWall))
		{
			 y += sign(vsp);
		}
		vsp = 0;		
	}
	
	y += vsp;
	
	if (!place_meeting(x, y + 1, oWall))
	{
		grounded = false;
		if (hsp == 0)
			sprite_index = idleSprite;
		else
			sprite_index = walkSprite;
	}
	else
	{
		grounded = true;
	}
	
	if (sign(hsp) > 0)
		image_xscale = -size;
	else if (sign(hsp) < 0)
		image_xscale = size;
}