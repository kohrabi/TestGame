hsp = 0; // Horizontal speed
vsp = 0; // Vertical speed
hsp_fraction = 0;
vsp_fraction = 0;
grv = 0.4; // Gravity
walksp = 4.1; // Walk speed
jumpheight = -10;
attackNow = false;
hascontrol = true;
done = 0;
canjump = 0;
dashDuration = 0;
dashSpeed = 10;

state = PLAYER_STATE.FREE;
hitByAttack = ds_list_create();
global.tilemap = layer_tilemap_get_id("Collision");

enum PLAYER_STATE
{
	FREE,
	ATTACK1,
	ATTACK2,
	DEAD
}