// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	// Calculate Movement
	/*if (key_crouch)
	{
		walksp = 2;
		jumpheight = -12;
	}
	else
	{
		walksp = 4;
		jumpheight = -10;
	}
	
	dashDuration = max(0, dashDuration - 1);
	if (key_dash)
		dashDuration = 10;

	canjump = max(0, canjump - 1);
	if (canjump > 0 && key_jump)
	{
		vsp = jumpheight;
		canjump = 0;	
	}
	
	if (dashDuration > 0)
	{
		vsp = 0;
		hsp = sign(image_xscale) * dashSpeed; 
	}
	else*/
	vsp += grv;
	hsp = (key_right - key_left) * walksp;	
	
	hsp += hsp_fraction;
	vsp += vsp_fraction;
	
	hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
	hsp -= hsp_fraction;
	vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
	vsp -= vsp_fraction;
		
	// Horizontal Collision
	var bbox_side;
	if (hsp > 0)
		bbox_side = bbox_right;
	else
		bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(global.tilemap, bbox_side + hsp, bbox_top);
	p2 = tilemap_get_at_pixel(global.tilemap, bbox_side + hsp, bbox_bottom);
	if (p1 == 1 || p2 == 1)
	{
		if (hsp > 0)
			x = x - (x % 24) + 23 - (bbox_right - x);
		else
			x = x - (x % 24) - (bbox_left - x);
		hsp = 0;
	}
	x += hsp;
	
	if (vsp > 0)
		bbox_side = bbox_bottom;
	else
		bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(global.tilemap, bbox_left, bbox_side + vsp);
	p2 = tilemap_get_at_pixel(global.tilemap, bbox_right, bbox_side + vsp);
	if (p1 == 1 || p2 == 1)
	{
		if (vsp > 0)
			y = y - (y % 24) + 23 - (bbox_bottom - y);
		else
			y = y - (y % 24) - (bbox_top - y);
		vsp = 0;
	}
	y += vsp;
	
	/*
	if (!tile_meeting(0, 1))
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
		canjump = 10;
		if (sprite_index == sPlayerFall)
		{
			audio_play_sound(sfFoot3, 5, false);
			audio_sound_pitch(sfLandingDirt, random_range(0.5, 1));
			audio_sound_pitch(sfMetalClink, random_range(0.5, 1));
			audio_play_sound(sfLandingDirt, 5, false);
			audio_play_sound(sfMetalClink, 4, false);
		}
		if (((sprite_index == sPlayerIdle || sprite_index == sPlayerRun || 
				sprite_index == sPlayerFall) && key_crouch)
		|| (sprite_index == sPlayerCrouch && !key_crouch))
		{
			sprite_index = sPlayerCrouchTrans;
		}
		if (sprite_index == sPlayerCrouchTrans && !animation_end())
			sprite_index = sPlayerCrouchTrans;
		else
		{
			if (hsp == 0)
			{
				if (key_crouch)
					sprite_index = sPlayerCrouch;
				else
					sprite_index = sPlayerIdle;
			}
			else
			{
				if (key_crouch)
					sprite_index = sPlayerCrouchWalk;
				else
					sprite_index = sPlayerRun;
				if (image_index >= 1 && image_index <= 1.2) || 
					(image_index >= 6 && image_index <= 6.2)
					audio_play_sound(choose(sfFoot1, sfFoot2, sfFoot3, sfFoot4),
							5, false);
			}
		}
	}
	
	if (dashDuration > 0)
		image_index = sPlayerDash;
	
	if (sign(hsp) > 0 || key_right)
		image_xscale = 2.2;
	else if (sign(hsp) < 0 || key_left)
		image_xscale = -2.2;
		
	if (key_attack)
		state = PLAYER_STATE.ATTACK1;
	*/
}