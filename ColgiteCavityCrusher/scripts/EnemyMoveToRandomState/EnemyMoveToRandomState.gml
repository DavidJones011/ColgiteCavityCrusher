// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move a random location state
function EnemyMoveToRandomState(_id = "MoveTo", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	timer = 0.0;
	
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
		timer = 600 + random_range(-300,100);
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		var attack_val = GetProjectedAttackDist(stats.targetObj, _sm.get_owner(), stats.distToAttack, 1000);
		var rand = random_range(0,2);
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