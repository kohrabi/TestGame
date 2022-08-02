// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Free(){
	// Calculate Movement
	vsp += grv;
	
	// Don't walk off edges
	if (grounded && afraidofheights && !place_meeting(x + hsp, y + 1, oWall))
		hsp = -hsp;

	ProcessMovement();
	
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