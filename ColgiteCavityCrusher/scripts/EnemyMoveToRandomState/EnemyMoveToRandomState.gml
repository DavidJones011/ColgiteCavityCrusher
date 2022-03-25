// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move a random location state
function EnemyMoveToRandomState(_id = "MoveTo", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	update_time = 0;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		
		var moving = _sm.get_owner().move_to_random();

		// failed to find spot
		if(moving == false)
		{
			_sm.set_state("Idle");
		}
	}
	
	static step_state = function(_sm)
	{	
		if((current_time - update_time) > 300)
		{
			update_time = current_time;
			var stats = _sm.get_owner().EnemyStats;
			var attack_val = GetProjectedAttackDist(stats.targetObj, _sm.get_owner(), 100);
			var rand = random_range(0,1);
			if(attack_val > 0.8 && rand > -1 && rand < 1)
			{
				_sm.set_state("MoveToTarget");
			}	
		}
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