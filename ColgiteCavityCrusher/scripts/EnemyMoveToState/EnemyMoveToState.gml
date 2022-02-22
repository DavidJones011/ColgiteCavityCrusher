// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move state
function EnemyMoveToState(_id = "MoveTo", _sprite = undefined, _speed = 2, _dist_threshold = 5) : State(_id) constructor
{
	sprite = _sprite;
	speed = _speed;
	goal_position = undefined;
	goal_object = undefined;
	dist_threshold = _dist_threshold;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
	}
	
	static step_state = function(_sm)
	{
		// grab the enemy stats
		var stats = _sm.get_owner().EnemyStats;
		
		// goal object takes priority over specific location
		var owner = _sm.get_owner();
		if(!owner.move(stats.target, speed, dist_threshold))
		{
			_sm.set_state("Idle");
		}
	}
	
	static exit_state = function(_sm)
	{
		// reset the goal target for the next call
		goal_position = undefined;
		goal_object = undefined;
	}
}