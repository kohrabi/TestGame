// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyHit(_damage){
	hp -= _damage;
	if (hp > 0)
	{
		state = ENEMY_STATE.HIT;
		done = 0;
		if (oPlayer.image_xscale != 0)
			hsp = 3 * sign(oPlayer.image_xscale);
		vsp = -4;
	}
	else
		state = ENEMY_STATE.DEAD;
}