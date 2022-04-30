// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// projectile attack, spawn a projectile after a certain frame
function BossMeleeHitState(_id = "BossAttack", _type = 0, _next_id = "Idle") : State(_id) constructor
{
	next_id = _next_id;
	bHit = false;
	type = _type;
	timer = 0;
		
	static enter_state = function(_sm)
	{
		_sm.get_owner().sprite_index = spr_boss_attack_body;
		timer = 97000;
		var rand = random_range(0, 29);
		if(rand > -1 && rand < 10)
		{
			if(type == 0)
			{
				_sm.get_owner().back_tentacle.sprite_index = spr_boss_attack_near;
			}
			else
			{
				_sm.get_owner().front_tentacle.sprite_index = spr_boss_attack_near;
			}
		}
		else if(rand >= 10 && rand < 20)
		{
			if(type == 0)
			{
				_sm.get_owner().back_tentacle.sprite_index = spr_boss_attack_mid;
			}
			else
			{
				_sm.get_owner().front_tentacle.sprite_index = spr_boss_attack_mid;
			}
		}
		else
		{
			if(type == 0)
			{
				_sm.get_owner().back_tentacle.sprite_index = spr_boss_attack_far;
			}
			else
			{
				_sm.get_owner().front_tentacle.sprite_index = spr_boss_attack_far;
			}
		}
		bHit = false;
		_sm.get_owner().back_tentacle.isMoving = false;
		_sm.get_owner().front_tentacle.isMoving = false;
	}
	
	static step_state = function (_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		timer -= _sm.get_owner().delta_time;
		if(timer <= 0.0 && !bHit)
		{
			audio_play_sound(snd_groundsmack, 10, false);
			cont_camera.shake_camera(10, 0.2);
			_sm.get_owner().back_tentacle.reset_hit();
			_sm.get_owner().front_tentacle.reset_hit();
			//_sm.get_owner().hit(stats.distToAttack, 500, 100, -200, 10);
			_sm.get_owner().energy -= 25;
			bHit = true;
		}
	}
	
	static exit_state = function(_sm)
	{
		_sm.get_owner().back_tentacle.isMoving = true;
		_sm.get_owner().front_tentacle.isMoving = true;
		_sm.get_owner().back_tentacle.has_hit = true;
		_sm.get_owner().front_tentacle.has_hit = true;
	}
	
	static handle_input = function(_sm, _input="")
	{		
		if(_input == "anim_end")
		{
			var bValid = (_sm.get_owner().sprite_index == spr_boss_attack_body);
			if(bValid)
			{
				_sm.set_state(next_id);	
			}
		}
	}
}