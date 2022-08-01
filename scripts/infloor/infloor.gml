// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InFloor(x, y, tilemap = global.tilemap){
	if (tilemap_get_at_pixel(tilemap, x, y) == 1)
		return y % 24;
	else
		return -(24 - y % 24);
}