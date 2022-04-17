/// @description Insert description here
// You can write your code in this editor


if(!visible || global.paused)
	return;
	
timer -= delta_time;
index_timer -= delta_time;
if(index_timer <= 0.0)
{
	index_timer = 62500;
	index++;
	if(index >= sprite_get_number(spr_go))
		index = 0;
}

if(timer <= 0.0)
{
	visible = false;
}

var centerX = window_get_width()/2 + 400;
var centerY = window_get_height()/2;

draw_sprite_ext(spr_go, index, centerX, centerY, 0.2, 0.2, 0, c_white, 1);