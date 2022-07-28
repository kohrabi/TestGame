hsp = 0; // Horizontal speed
vsp = 0; // Vertical speed
grv = 0.5; // Gravity
walksp = 4; // Walk speed
attackNow = false;
hascontrol = true;
done = 0;
canjump = 0;

state = PLAYER_STATE.FREE;
hitByAttack = ds_list_create();

enum PLAYER_STATE
{
	FREE,
	ATTACK1,
	ATTACK2,
	DEAD
}