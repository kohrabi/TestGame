// State Machine
switch (state)
{
	case ENEMY_STATE.FREE: EnemyState_Free(); break;
	case ENEMY_STATE.HIT: EnemyState_Hit(); break;
	case ENEMY_STATE.DEAD: EnemyState_Dead(); break;
}
