// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ProcessMovement(){
	// Horizontal Collision
	if (place_meeting(x + hsp, y, oWall))
	{
		var sgn = sign(hsp);
		while (!place_meeting(x + sgn, y, oWall))
			x += sgn;
		hsp = 0;		
	}
	
	x += hsp;
	
	// Vertical Collision
	if (place_meeting(x, y + vsp, oWall))
	{
		var sgn = sign(vsp);
		while (!place_meeting(x, y + sgn, oWall))
			 y += sgn;
		vsp = 0;		
	}
	
	y += vsp;
}