/// @description Insert description here
// You can write your code in this editor

x += delta_time * 0.0000001 * 3000.0;
if(x > room_width + 4000)
{
	self.swap_car();
	x = -4000;
}