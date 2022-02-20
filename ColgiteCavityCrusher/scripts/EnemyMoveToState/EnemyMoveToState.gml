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
		//var done = false;
		if(!is_undefined(stats.target))
		{
			owner.move(stats.target.x, stats.target.y, speed);
			if(at_goal(owner.x, owner.y, stats.target.x, stats.target.y))
			{
				_sm.set_state("Idle");
			}
		}
		//else if(!is_undefined(goal_position))
		//{
		//	move(goal_position.x, goal_position.y, speed);
			
		//	if(at_goal(owner.x, owner.y, goal_position.x, goal_position.y))
		//	{
				//_sm.set_state("Idle");
		//	}
		//}
	}
	
	static exit_state = function(_sm)
	{
		// reset the goal target for the next call
		goal_position = undefined;
		goal_object = undefined;
	}
	
	static set_goal_position = function(_goal_position)
	{
		goal_position = _goal_position;
	}
	
	static set_goal_object = function(_goal_object)
	{
		goal_object = _goal_object;
	}
	
	static at_goal = function(_x, _y, _goal_x, _goal_y)
	{
		var dist = point_distance(_x, _y, _goal_x, _goal_y);
		return (dist <= dist_threshold);
	}
	
	static set_dist_threshold = function(_dist_threshold)
	{
		dist_threshold = _dist_threshold;	
	}
}