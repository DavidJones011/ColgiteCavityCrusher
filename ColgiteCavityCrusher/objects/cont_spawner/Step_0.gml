/// @description Insert description here
// You can write your code in this editor

var spawnX = x;
var spawnY = y + random_range(-300,300);

if((current_time - prev_time)*0.001 > time_to_spawn && (current_spawns < spawn_limit) && distance_to_object(obj_player) > 500)
{
	for(var i = 0; i < melee_enemies; i++)
	{
		var inst = instance_create_depth(spawnX, spawnY,0, obj_enemy_melee);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
		prev_time = current_time;
	}
	
	for(var i = 0; i < ranged_enemies; i++)
	{
		var inst = instance_create_depth(spawnX, spawnY, 0, obj_enemy_ranged);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
		prev_time = current_time;
	}
}