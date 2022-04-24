// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for ranged nemies
function BossIdleState(_id = "Idle") : State(_id) constructor
{
	timer = 870000;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		_sm.get_owner().sprite_index = spr_boss_idle_body;
		_sm.get_owner().front_tentacle.sprite_index = spr_boss_idle_ft;
		_sm.get_owner().back_tentacle.sprite_index = spr_boss_idle_bt;
		timer = 2200000;
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		timer -= delta_time;
		if(timer <= 0.0)
		{
			if(_sm.get_owner().x - stats.targetObj.x <= 4500)
			{
				var val = GetSideValue(view_camera[0], 1800, stats.targetObj.y);
				if(val < 0.5)
					_sm.set_state("AttackBT");
				else
					_sm.set_state("AttackFT");	
			}
		}
		
		if(_sm.get_owner().energy <= 0)
		{
			_sm.set_state("Weak");
		}
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}