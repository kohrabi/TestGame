// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	// Calculate Movement
	if (key_crouch)
	{
		walksp = 1.5;
		jumpheight = -8.5;
	}
	else
	{
		walksp = 3;
		jumpheight = -7;
	}
	
	hsp = (key_right - key_left) * walksp;
	
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
		ScreenShake(10, 10);
		vsp = 0;
		hsp = sign(image_xscale) * dashSpeed; 
	}
	else
		vsp += grv;
	
	ProcessMovement();
	
	
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
		image_xscale = 1.3;
	else if (sign(hsp) < 0 || key_left)
		image_xscale = -1.3;
		
	if (key_attack)
		state = PLAYER_STATE.ATTACK1;
	
}