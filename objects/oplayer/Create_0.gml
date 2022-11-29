hsp = 0; // Horizontal speed
vsp = 0; // Vertical speed
hsp_fraction = 0;
vsp_fraction = 0;
grv = 0.4; // Gravity
// Walk speed and jump height are set in the PlayerState_Free() function
walksp = 0; // Walk speed
jumpheight = 0;

attackNow = false;
hascontrol = true;
done = 0;
canjump = 0;
dashDuration = 0;
dashSpeed = 10;

state = PLAYER_STATE.FREE;
hitByAttack = ds_list_create();

enum PLAYER_STATE
{
	FREE,
	ATTACK1,
	ATTACK2,
	DEAD
}