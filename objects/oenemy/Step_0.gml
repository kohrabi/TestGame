// State Machine
switch (state)
{
	case ENEMY_STATE.FREE: EnemyState_Free(); break;
	case ENEMY_STATE.HIT: EnemyState_Hit(); break;
	case ENEMY_STATE.REACT: EnemyState_React(); break;
	case ENEMY_STATE.CHASE: EnemyState_Chase(); break;
	case ENEMY_STATE.ATTACK: EnemyState_Attack(); break;
}
