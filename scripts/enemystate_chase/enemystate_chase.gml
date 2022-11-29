// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Chase(){
	if (distance_to_object(oPlayer) < 100 && 
			!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
	{
		if (sign(x - oPlayer.x) > 0)
			hsp = -walksp;	
		else if (sign(x - oPlayer.x) < 0)
			hsp = walksp;
		
		// Gravity
		vsp += grv;
		
		// Horizontal Collision
		if (place_meeting(x + hsp, y, oWall))
		{
			while (!place_meeting(x + sign(hsp), y, oWall))
			{
				x += sign(hsp);
			}
			hsp = 0;		
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
			mask_index = foundHB;
			if (place_meeting(x, y, oPlayer))
				state = ENEMY_STATE.ATTACK;
			mask_index = idleSprite;
		}
	}
	else
		state = ENEMY_STATE.FREE;
}