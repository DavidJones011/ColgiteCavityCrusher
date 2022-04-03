/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
	return;

timer -= delta_time;
if(timer <= 0.0)
{
	timer = 500000;
	index++;
	if(index >= sprite_get_number(spr_sleep))
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
draw_sprite(spr_pause_title, 0, centerX, centerY - 200);
draw_sprite(spr_sleeptooth, 0, centerX + 200, centerY + 100);
draw_sprite(spr_sleep, index, centerX + 250, centerY + 100);
draw_sprite(spr_resume, 0, centerX, centerY);
draw_sprite(spr_options, 0, centerX, centerY + 100);
draw_sprite(spr_quit, 0, centerX, centerY + 200);

//view port mouse location
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

// is mouse overlapping try again?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var tryExtentX = 92;//sprite_get_width(spr_tryagain) / 2;
var tryExtentY = 33;//sprite_get_height(spr_tryagain) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX-tryExtentX, centerY-tryExtentY, centerX+tryExtentX, centerY+tryExtentY))
{
	draw_sprite_ext(spr_resume, 0, centerX, centerY, 1, 1, 0, c_yellow, 1.0);
	hoveringOverOption = true;
	selectIndex = 0;
}

var optionsExtentX = 92;//sprite_get_width(spr_quit) / 2;
var optionsExtentY = 33;//sprite_get_height(spr_quit) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX-optionsExtentX, centerY+100-optionsExtentY, centerX+optionsExtentX, centerY+100+optionsExtentY))
{
	draw_sprite_ext(spr_options, 0, centerX, centerY+100, 1, 1, 0, c_yellow, 1.0);		
	hoveringOverOption = true;
	selectIndex = 2;
}

// is mouse overlapping quit?
// sprites have a lot of empty space, have to calculate the widths by hand :(
var quitExtentX = 92;//sprite_get_width(spr_quit) / 2;
var quitExtentY = 33;//sprite_get_height(spr_quit) / 2;
if(point_in_rectangle(mouseX, mouseY, centerX-quitExtentX, centerY+200-quitExtentY, centerX+quitExtentX, centerY+200+quitExtentY))
{
	draw_sprite_ext(spr_quit, 0, centerX, centerY+200, 1, 1, 0, c_yellow, 1.0);		
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
			togglePause(); 
			break;
		case 1:
			room_goto(rm_mainMenu);
			break;
		case 2:
			break;
		default:
			break;
	}
}

prevIndex = selectIndex;