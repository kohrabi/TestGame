/// @description Create variables
// done is used for knockback

state = ENEMY_STATE.FREE;
image_xscale = size;
image_yscale = size;

enum ENEMY_STATE
{
	FREE,
	HIT,
	DEAD,
	REACT,
	CHASE,
	ATTACK
}