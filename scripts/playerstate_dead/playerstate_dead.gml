// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dead(){
	sprite_index = sPlayerDead;
	if (done == 0)
	{
		ProcessMovement();
		
		if (place_meeting(x, y + 1, oWall))
		{
			done = 1;
			hsp = 0;
			vsp = 0;
		}
		else
			vsp += 10;
		if (animation_end())
			image_speed = 0;
	}
	else if (animation_end())
	{
		game_set_speed(60, gamespeed_fps);
		image_speed = 0;
		SlideTransition(TRANS_MODE.GOTO, room);
	}
}