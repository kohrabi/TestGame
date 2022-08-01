// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Hit(){
	sprite_index = hitSprite;
	if (done == 0)
	{
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
			done = 1;
			hsp = 0;
			vsp = 0;
		}
	}
	else if (animation_end())
	{
		state = ENEMY_STATE.FREE;
		hsp = walksp;
	}
}