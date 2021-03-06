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
		obj_GO.show_go();
		audio_stop_sound(snd_combatmusic);
		audio_play_sound(snd_calmmusic, 1000, true);
	}
}

function spawn_enemies()
{
	audio_stop_sound(snd_calmmusic);
	audio_play_sound(snd_combatmusic, 1000, true);
	disabled = true;
	for(var i = 0; i < melee_enemies; i++)
	{
		var spot = FindSpotOutsideOfCamera(view_camera[0], 1900, 400);
		var inst = instance_create_depth(spot[0], spot[1], 0, obj_enemy_melee);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
	}
	
	for(var i = 0; i < ranged_enemies; i++)
	{
		var spot = FindSpotOutsideOfCamera(view_camera[0], 1900, 400);
		var inst = instance_create_depth(spot[0], spot[1], 0, obj_enemy_ranged);
		with(inst)
		{
			inst.set_spawner(other);
		}
		current_spawns++;
	}
	
}