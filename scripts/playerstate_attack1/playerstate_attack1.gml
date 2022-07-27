	// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack1(){
	//hsp = 0;
	//vsp = 0;
	
	ProcessAttack(sPlayerAttack1, sPlayerAttack1HB);
	
	// Trigger combo change
	if (key_attack && !(key_left || key_right || key_jump))
		attackNow = true;

	if (animation_end())
	{
		if (attackNow)
		{
			state = PLAYER_STATE.ATTACK2;
			attackNow = false;
		}
		else
		{
			sprite_index = sPlayerIdle;
			state = PLAYER_STATE.FREE;
		}
	}
}