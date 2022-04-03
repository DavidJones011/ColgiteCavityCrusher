/// @description Insert description here
// You can write your code in this editor

if(!enabled)
	return;
	
timer -= delta_time;
if(timer <= 0.0)
{
	timer = 62500;
	index++;
	if(index >= sprite_get_number(spr_spinningstar))
		index = 0;
}

var hoveringOverOption = false;
var selectIndex = -1;

sizeX = window_get_width();
sizeY = window_get_height();
centerX = window_get_width()/2;
centerY = window_get_height()/2;

// draw game over menu
draw_sprite_ext(spr_black_trans, 0, 0, 0, sizeX, sizeY, 0, -1, 1);
draw_sprite(spr_win_title, 0, centerX, centerY - 100);
draw_sprite(spr_playagain, 0, centerX - 200, centerY);
draw_sprite(spr_quit, 0, centerX + 200, centerY);
draw_sprite(spr_spinningstar, index, centerX, centerY+150);
draw_sprite(spr_toothwin, 0, centerX, centerY+150);

//view port mouse location
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

// is mouse overlapping try again?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var tryExtentX = 92;//sprite_get_width(spr_tryagain) / 2;
var tryExtentY = 33;//sprite_get_height(spr_tryagain) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX-200-tryExtentX, centerY-tryExtentY, centerX-200+tryExtentX, centerY+tryExtentY))
{
	draw_sprite_ext(spr_playagain, 0, centerX - 200, centerY, 1, 1, 0, c_yellow, 1.0);
	hoveringOverOption = true;
	selectIndex = 0;
}

// is mouse overlapping quit?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var quitExtentX = 92;//sprite_get_width(spr_quit) / 2;
var quitExtentY = 33;//sprite_get_height(spr_quit) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX+200-quitExtentX, centerY-quitExtentY, centerX+200+quitExtentX, centerY+quitExtentY))
{
	draw_sprite_ext(spr_quit, 0, centerX + 200, centerY, 1, 1, 0, c_yellow, 1.0);		
	hoveringOverOption = true;
	selectIndex = 1;
}


if(hoveringOverOption && selectIndex != prevIndex)
{
	audio_play_sound(snd_hover_button, 10, false);
}

// check if we pressed the mouse button and are hoving over an option
if(hoveringOverOption && mouse_check_button_pressed(mb_left))
{
	audio_play_sound(snd_click, 10, false);
	switch(selectIndex)
	{
		case 0:
			room_restart();
			break;
		case 1:
			room_goto(rm_mainMenu);
		default:
			break;
	}
}

prevIndex = selectIndex;