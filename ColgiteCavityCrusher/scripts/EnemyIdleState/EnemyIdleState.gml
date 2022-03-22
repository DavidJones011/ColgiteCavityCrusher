// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for enemies
function EnemyIdleState(_id = "Idle", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	start_time = 0;
	attack_dev = 0;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
		var stats = _sm.get_owner().EnemyStats;		
		start_time = current_time;
		attack_dev = random_range(-stats.attackSpeedDev, stats.attackSpeedDev);
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;		
		var utility = new ScopedUtilityEvaluator();
	
		if(!is_undefined(stats.targetObj))
		{
			//var spot = FindSpotAtTarget(_sm.get_owner(), stats.targetObj, stats.distToAttack);
			
			var target_pos = [stats.targetObj.x, stats.targetObj.y];
			//_sm.get_owner().image_xscale = sign(_sm.get_owner().x - stats.target.x);
			var dist = point_distance(_sm.get_owner().x, _sm.get_owner().y, target_pos[0], target_pos[1]);
			utility.add_utility_squared("MoveTo", dist, 1000);
			utility.add_utility_linear("Idle", dist, 800);
			if(current_time - start_time >= stats.attackSpeed + attack_dev)
			{
				utility.add_utility_linear("Attack", 800, dist);
			}
		}
				
		_sm.set_state(utility.get_utility_name());
		//show_debug_message(utility.get_utility());
		delete utility;
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}