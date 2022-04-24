/// @description Insert description here
// You can write your code in this editor
	var randSpawn = irandom_range(0,4);
	if(randSpawn != 0)
	{
			instance_create_depth(x,y-300,depth,obj_pickup_health);
	}

