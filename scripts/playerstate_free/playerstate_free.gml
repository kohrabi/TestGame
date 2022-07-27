// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	// Calculate Movement
	hsp = (key_right - key_left) * walksp;
	vsp += grv;
	
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
	
	if (place_meeting(x, y + 1, oWall) && key_jump)
		vsp = -10;
	
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
	
	if (!place_meeting(x, y + 1, oWall))
	{
		if (sign(vsp) > 0)
		{
			if (sprite_index == sPlayerJump || 
				(sprite_index == sPlayerJumpFallTrans 
					&& image_index >= 0 && image_index <= 1))
				sprite_index = sPlayerJumpFallTrans;
			else
				sprite_index = sPlayerFall;
		}
		else
			sprite_index = sPlayerJump;
	
	}
	else
	{
		if (hsp == 0)
			sprite_index = sPlayerIdle;
		else
			sprite_index = sPlayerRun;
	}
	
	if (sign(hsp) > 0 || key_right)
		image_xscale = 2.2;
	else if (sign(hsp) < 0 || key_left)
		image_xscale = -2.2;
	
	if (key_attack)
		state = PLAYER_STATE.ATTACK1;
}