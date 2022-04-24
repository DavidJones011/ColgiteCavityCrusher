/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
{
	image_speed = 1.0;
	if(isMoving)
	{
		time += delta_time / 1000000;
		y = initial_y + sin(time) * 400;	
	}	
}
else
{
	image_speed = 0.0;
}