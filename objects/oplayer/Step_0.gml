// Input
if (hascontrol)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_space);
	key_crouch = keyboard_check(vk_down);
	key_attack = keyboard_check_pressed(ord("Z"));
	key_dash = keyboard_check_pressed(ord("C"));
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	key_crouch = 0;
	key_attack = 0;
	key_dash = 0;
}
// State Machine

switch (state)
{
	case PLAYER_STATE.FREE: PlayerState_Free(); break;
	case PLAYER_STATE.ATTACK1: PlayerState_Attack1(); break;
	case PLAYER_STATE.ATTACK2: PlayerState_Attack2(); break;
	case PLAYER_STATE.DEAD: PlayerState_Dead(); break;
}

