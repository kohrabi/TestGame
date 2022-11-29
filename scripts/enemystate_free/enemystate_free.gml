// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Free(){
	// Calculate Movement
	vsp += grv;
	
	// Don't walk off edges
	if (grounded && afraidofheights && !place_meeting(x + hsp, y + 1, oWall))
		hsp = -hsp;

	// Horizontal Collision
	if (place_meeting(x + hsp, y, oWall))
	{
		var sgn = sign(hsp);
		while (!place_meeting(x + sgn, y, oWall))
			x += sgn;
		hsp = -hsp;		
	}
	
	x += hsp;
	
	// Vertical Collision
	if (place_meeting(x, y + vsp, oWall))
	{
		var sgn = sign(vsp);
		while (!place_meeting(x, y + sgn, oWall))
			 y += sgn;
		vsp = 0;		
	}
	
	y += vsp;
	
	if (place_meeting(x, y + 1, oWall))
	{
		grounded = true;
		if (hsp == 0)
			sprite_index = idleSprite;
		else
			sprite_index = walkSprite;
	}
	else
		grounded = false;
	
	if (sign(hsp) != 0)
		image_xscale = size * sign(hsp);
	
	if (grounded)
	{
		if (distance_to_object(oPlayer) < 100 && 
			!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
			state = ENEMY_STATE.CHASE;
	}
}