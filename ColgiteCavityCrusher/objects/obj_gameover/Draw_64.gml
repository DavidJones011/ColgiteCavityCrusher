/// @description Insert description here
// You can write your code in this editor

var hoveringOverOption = false;
var selectIndex = 0;

sizeX = window_get_width();
sizeY = window_get_height();
centerX = window_get_width()/2;
centerY = window_get_height()/2;

// draw game over menu
draw_sprite_ext(spr_black_trans, 0, 0, 0, sizeX, sizeY, 0, -1, 1);
draw_sprite(spr_gameover_title, 0, centerX, centerY - 100);
draw_sprite(spr_tryagain, 0, centerX - 200, centerY);
draw_sprite(spr_quit, 0, centerX + 200, centerY);
draw_sprite(spr_deadtooth, 0, centerX, centerY+100);

//view port mouse location
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

// is mouse overlapping try again?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var tryExtentX = 92;//sprite_get_width(spr_tryagain) / 2;
var tryExtentY = 33;//sprite_get_height(spr_tryagain) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX-200-tryExtentX, centerY-tryExtentY, centerX-200+tryExtentX, centerY+tryExtentY))
{
	hoveringOverOption = true;
	selectIndex = 0;
}

// is mouse overlapping quit?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var quitExtentX = 92;//sprite_get_width(spr_quit) / 2;
var quitExtentY = 33;//sprite_get_height(spr_quit) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX+200-quitExtentX, centerY-quitExtentY, centerX+200+quitExtentX, centerY+quitExtentY))
{
	hoveringOverOption = true;
	selectIndex = 1;
}

// check if we pressed the mouse button and are hoving over an option
if(hoveringOverOption && mouse_check_button_pressed(mb_left))
{
	switch(selectIndex)
	{
		case 0:
			room_restart();
			break;
		case 1:
			game_end();
		default:
			break;
	}
}