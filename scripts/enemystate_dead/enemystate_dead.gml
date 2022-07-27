// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Dead(){
	sprite_index = deadSprite;
	image_speed = 1;
	if (animation_end())
		image_speed = 0;
	else
		ScreenShake(6, 25);
}