/// @description Insert description here
// You can write your code in this editor

var hoveringOverOption = false;
var selectIndex = -1;

sizeX = window_get_width();
sizeY = window_get_height();
centerX = window_get_width()/2;
centerY = window_get_height()/2;

//view port mouse location
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if(!viewing_controls)
{
	// draw game over menu
	//draw_sprite_ext(spr_black_trans, 0, 0, 0, sizeX, sizeY, 0, -1, 1);
	draw_sprite(spr_game_title, 0, centerX, centerY - 200);
	draw_sprite(spr_tooth, 0, centerX + 100, centerY + 100);
	draw_sprite(spr_start, 0, centerX - 200, centerY);
	draw_sprite(spr_controls, 0, centerX - 200, centerY + 100);
	draw_sprite(spr_quit, 0, centerX - 200, centerY + 200);

	// is mouse overlapping try again?
	// sprites have a lot of empty space, have to calculate the widths by hand :(
	var tryExtentX = 92;//sprite_get_width(spr_tryagain) / 2;
	var tryExtentY = 33;//sprite_get_height(spr_tryagain) / 2;
	if(point_in_rectangle(mouseX, mouseY, centerX-200-tryExtentX, centerY-0-tryExtentY, centerX-200+tryExtentX, centerY-0+tryExtentY))
	{
		draw_sprite_ext(spr_start, 0, centerX-200, centerY-0, 1, 1, 0, c_yellow, 1.0);
		hoveringOverOption = true;
		selectIndex = 0;
	}

	var optionsExtentX = 92;//sprite_get_width(spr_quit) / 2;
	var optionsExtentY = 33;//sprite_get_height(spr_quit) / 2;
	if(point_in_rectangle(mouseX, mouseY, centerX-200-optionsExtentX, centerY+100-optionsExtentY, centerX-200+optionsExtentX, centerY+100+optionsExtentY))
	{
		draw_sprite_ext(spr_controls, 0, centerX-200, centerY+100, 1, 1, 0, c_yellow, 1.0);		
		hoveringOverOption = true;
		selectIndex = 2;
	}

	// is mouse overlapping quit?
	// sprites have a lot of empty space, have to calculate the widths by hand :(
	var quitExtentX = 92;//sprite_get_width(spr_quit) / 2;
	var quitExtentY = 33;//sprite_get_height(spr_quit) / 2;
	if(point_in_rectangle(mouseX, mouseY, centerX-200-quitExtentX, centerY+200-quitExtentY, centerX-200+quitExtentX, centerY+200+quitExtentY))
	{
		draw_sprite_ext(spr_quit, 0, centerX-200, centerY+200, 1, 1, 0, c_yellow, 1.0);		
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
				room_goto(rm_level1); 
				break;
			case 1:
				game_end();
				break;
			case 2:
				viewing_controls = true;
				timer = 20000;
				index = 0;
				break;
			default:
				break;
		}
	}	
}
else
{
	timer -= delta_time;
	if(timer <= 0.0)
	{
		timer = 20000;
		index++;
		if(index >= 30)
			index = 0;
	}

	var optionsExtentX = 92;//sprite_get_width(spr_quit) / 2;
	var optionsExtentY = 33;//sprite_get_height(spr_quit) / 2;
	if(point_in_rectangle(mouseX, mouseY, centerX-optionsExtentX, centerY-optionsExtentY+300, centerX+optionsExtentX, centerY+optionsExtentY+300))
	{
		draw_sprite_ext(spr_back, 0, centerX, centerY+300, 1, 1, 0, c_yellow, 1.0);		
		hoveringOverOption = true;
		selectIndex = 2;
	}
	else
	{
		draw_sprite(spr_back, 0, centerX, centerY+300);
	}
	
	// controls
	draw_sprite(spr_wasd, 0, centerX-400, centerY-200)
	draw_sprite(spr_j, 0, centerX-400, centerY+100)
	draw_sprite(spr_k, 0, centerX+100, centerY-200)
	draw_sprite(spr_specialcontrol, 0, centerX+100, centerY+100)
	
	// labels
	draw_sprite_ext(spr_label_movement, 0, centerX-250, centerY-70, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_label_attack, 0, centerX-250, centerY+230, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_label_block, 0, centerX+250, centerY-70, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_label_special, 0, centerX+300, centerY+230, 0.2, 0.2, 0, c_white, 1.0)
	
	// animations
	draw_sprite_ext(spr_player_walk, index, centerX-200, centerY-140, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_player_attack, index, centerX-200, centerY+160, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_player_block_start, index*0.6, centerX+300, centerY-140, 0.2, 0.2, 0, c_white, 1.0)
	draw_sprite_ext(spr_player_special, index, centerX+400, centerY+160, 0.2, 0.2, 0, c_white, 1.0)
	
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
			case 2:
				viewing_controls = false;
				timer = 500000;
				index = 0;
				break;
			default:
				break;
		}
	}	
}

prevIndex = selectIndex;