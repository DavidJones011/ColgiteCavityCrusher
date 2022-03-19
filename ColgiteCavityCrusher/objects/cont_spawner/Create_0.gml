/// @description Insert description here
// You can write your code in this editor

prev_time = 0;
time_to_spawn = 2.0;
spawn_limit = 2;
current_spawns = 0;

function remove_enemy(_enemy)
{
	if(is_undefined(_enemy))
		return;
		
	instance_destroy(_enemy);
	current_spawns--;
}

function add_enemy()
{
	current_spawn++;	
}