/// @description Insert description here
// You can write your code in this editor
	var randSpawn = irandom_range(0,1);
	if(randSpawn == 1)
	{
			instance_create_depth(x,y-300,depth,obj_pickup_health);
	}

