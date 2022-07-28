/// @description Draw Menu
draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	if (i == 3)
	{
		var pogWid = sprite_get_width(sMenuPog) / 4;
		var pogHei = sprite_get_height(sMenuPog) / 2;
		draw_sprite_ext(sMenuPog, 0, xx - pogWid, yy - pogHei, 1.05, 1.05, 0, c_black, 1);
		draw_sprite_ext(sMenuPog, 0, xx - pogWid, yy - pogHei, 1, 1, 0, c_white, 1);
		if (menu_cursor == i)
		{
			txt = ">      ";
			draw_set_color(c_black);
			draw_text(xx - offset, yy, txt);
			draw_text(xx + offset, yy, txt);
			draw_text(xx, yy + offset, txt);
			draw_text(xx, yy - offset, txt);
			draw_set_color(col);
			draw_text(xx, yy, txt);
		}
	}
	else
	{
		draw_set_color(c_black);
		draw_text(xx - offset, yy, txt);
		draw_text(xx + offset, yy, txt);
		draw_text(xx, yy + offset, txt);
		draw_text(xx, yy - offset, txt);
		draw_set_color(col);
		draw_text(xx, yy, txt);
	}
	
}
