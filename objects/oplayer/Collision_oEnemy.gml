/// @description Die
state = PLAYER_STATE.DEAD;
if (sprite_index != sPlayerDead)
{
	if (oEnemy.image_xscale != 0)
		hsp = 2.2 * -sign(oEnemy.image_xscale);
	vsp = -4;
	hascontrol = false;
	game_set_speed(30, gamespeed_fps);
	image_index = 0;
	image_speed = 1;
}