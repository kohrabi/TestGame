// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_React(){
	sprite_index = sEnemySkeletonReact;
	image_speed = 1;
	if (animation_end())
		state = ENEMY_STATE.CHASE;
}