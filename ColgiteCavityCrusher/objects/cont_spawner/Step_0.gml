/// @description Insert description here
// You can write your code in this editor

if((current_time - prev_time)*0.001 > time_to_spawn && current_spawns < spawn_limit)
{
	var inst = instance_create_depth(x,y+random_range(-300,300),0, obj_enemy_base);
	with(inst)
	{
		inst.set_spawner(other);
	}
	current_spawns++;
	prev_time = current_time;
}