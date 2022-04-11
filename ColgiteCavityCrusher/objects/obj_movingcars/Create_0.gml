/// @description Insert description here
// You can write your code in this editor

function swap_car()
{
	var rand = irandom_range(0,4);
	switch(rand)
	{
		case 0:
			sprite_index = spr_car_white;
			break;
		case 1:
			sprite_index = spr_car_black;
			break;
		case 2:
			sprite_index = spr_car_green;
			break;
		case 3:
			sprite_index = spr_car_blue;
			break;
		case 4:
			sprite_index = spr_truck_2;
			break;
		default:
			break;
	}
}

depth = CalcDepthFromY();
self.swap_car();
isColliding = false;
prevIsColliding = false;
