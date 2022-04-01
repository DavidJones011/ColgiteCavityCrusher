/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
{
	image_speed = 1.0;
	enemy_sm.step_sm();
	depth = CalcDepthFromY();
	update_move();	
}
else
{
	image_speed = 0.0;
}