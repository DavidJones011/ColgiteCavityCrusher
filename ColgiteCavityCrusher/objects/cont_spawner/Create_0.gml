/// @description Insert description here
// You can write your code in this editor
current_spawns = 0;
disabled = false;

function remove_enemy(_enemy)
{
	if(is_undefined(_enemy))
		return;
		
	instance_destroy(_enemy);
	current_spawns--;
	
	if(current_spawns <= 0)
	{
		cont_camera.set_target(obj_player);	
	}
}

function spawn_enemies()
{
	disabled = true;
	for(var i = 0; i < melee_enemies; i++)
	{
		var spot = FindSpotOutsideOfCamera(view_camera[0], 1800, 400);
		var inst = instance_create_depth(spot[0], spot[1], 0, obj_enemy_melee);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
	}
	
	for(var i = 0; i < ranged_enemies; i++)
	{
		var spot = FindSpotOutsideOfCamera(view_camera[0], 1800, 400);
		var inst = instance_create_depth(spot[0], spot[1], 0, obj_enemy_ranged);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
	}
	
}