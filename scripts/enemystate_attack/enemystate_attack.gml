// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Attack(){
	sprite_index = attackSprite;
	image_speed = 1;
	if (image_index >= attackBegin && image_index <= attackEnd)
	{
		mask_index = attackHB;
		if (place_meeting(x, y, oPlayer))
		{
			with (oPlayer)
			{
				state = PLAYER_STATE.DEAD;
				if (sprite_index != sPlayerDead)
				{
					if (other.image_xscale != 0)
						hsp = 2.2 * sign(other.image_xscale);
					vsp = -4;
					hascontrol = false;
					game_set_speed(30, gamespeed_fps);
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		mask_index = idleSprite;
	}
	else if (animation_end())
		state = ENEMY_STATE.FREE;
}