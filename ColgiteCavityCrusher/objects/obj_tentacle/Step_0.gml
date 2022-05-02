/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
{
	image_speed = 1.0;
	if(isMoving)
	{
		time += delta_time / 1000000;
		y = initial_y + sin(time + offset) * 400;
		x = initial_x + cos(time * 2 + offset * 0.5) * 400;
		
		var dist = (obj_boss.x - obj_player.x);
		if(dist < 800)
		{
			x += 800;
		}
	}	
}
else
{
	image_speed = 0.0;
}