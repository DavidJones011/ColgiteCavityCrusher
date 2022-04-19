// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move to location next to the target
function EnemyMoveToCircleState(_id = "MoveTo", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		
		var moving = _sm.get_owner().move_to_circle_at_target();

		// failed to find spot
		if(moving == false)
		{
			_sm.set_state("Idle");
		}
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		var rand = random_range(0,10);
		var attack_val = GetProjectedAttackDist(stats.targetObj, _sm.get_owner(), stats.distToAttack, 600);
		if(attack_val > 0.5)
		{
			_sm.set_state("MoveToTarget");
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