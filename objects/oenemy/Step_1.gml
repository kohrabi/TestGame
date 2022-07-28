if (hp <= 0)
{
	state = ENEMY_STATE.DEAD;
	instance_create_layer(x, y, layer, oEnemyDead);
	with (oEnemyDead)
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	instance_destroy();
}