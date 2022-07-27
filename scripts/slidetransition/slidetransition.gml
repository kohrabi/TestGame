/// @description SlideTransition(mode, targetroom)
///	@arg Mode sets transition mode between next, restart and goto
/// @arg Target sets target room when using the goto mode
function SlideTransition(_mode, _room = room)
{
	with (oTransition)
	{
		mode = _mode;
		target = _room;
	}
}