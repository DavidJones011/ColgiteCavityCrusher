/// @description Insert description here
// You can write your code in this editor
current_spawns = 1;
disabled = false;

melee_enemies = ds_list_create();
ranged_enemies = ds_list_create();

ds_list_add(melee_enemies, 0);
ds_list_add(melee_enemies, 1);
ds_list_add(melee_enemies, 2);

ds_list_add(ranged_enemies, 0);
ds_list_add(ranged_enemies, 1);
ds_list_add(ranged_enemies, 1);

function remove_enemy(_enemy)
{
	if(is_undefined(_enemy))
		return;
		
	instance_destroy(_enemy);
	current_spawns--;
	
	if(current_spawns <= 0)
	{
		cont_camera.set_target(obj_player);
		obj_GO.show_go();
		audio_stop_sound(snd_bossmusic);
		audio_play_sound(snd_calmmusic, 1000, true);
	}
}

function spawn_enemies(_wave = 0)
{
	if(_wave = 0)
	{
		audio_stop_sound(snd_calmmusic);
		audio_play_sound(snd_bossmusic, 1000, true);	
		disabled = true;
	}
	
	for(var i = 0; i < ds_list_find_value(melee_enemies, _wave); i++)
	{
		var spot = FindSpotOutsideOfCamera(view_camera[0], 1800, 400);
		var inst = instance_create_depth(spot[0], spot[1], 0, obj_enemy_melee);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
	}
	
	for(var i = 0; i < ds_list_find_value(ranged_enemies, _wave); i++)
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