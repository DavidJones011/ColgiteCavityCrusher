// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move to location next to the target
function EnemyMoveToTargetState(_id = "MoveTo", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		
		var moving = _sm.get_owner().move_next_to_target();

		// failed to find spot
		if(moving == false)
		{
			_sm.set_state("Idle");
		}
	}
	
	static step_state = function(_sm)
	{
		
		
		
		/*var stats = _sm.get_owner().EnemyStats;
		var utility = new ScopedUtilityEvaluator();
		utility.add_utility_squared_peak("Idle", GetProjectedAttackDist(stats.targetObj, _sm.get_owner(), 200), 200);
		
		var state = utility.get_utility_name(0.6);
		if(!is_undefined(state))
		{
			_sm.get_owner().cancel_move();
			_sm.set_state(state);
		}
		delete utility;*/
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "goal_reached")
		{
			_sm.set_state("Idle");
		}
	}
}