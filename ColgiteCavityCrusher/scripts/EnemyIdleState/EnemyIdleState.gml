// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for enemies
function EnemyIdleState(_id = "Idle", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	start_time = 0;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
				
		// check the distance from the target
		var dist = 0;
		if(!is_undefined(stats.target))
		{
			var spot = FindSpotAtTarget(_sm.get_owner(), stats.target, stats.distToAttack);
			_sm.get_owner().image_xscale = sign(_sm.get_owner().x - stats.target.x);
			dist = point_distance(_sm.get_owner().x, _sm.get_owner().y, spot[0], spot[1]+300);
		}

		if(dist > 550)
		{
			_sm.set_state("MoveTo");
		}
		else if(current_time - start_time >= stats.hitRate)
		{
			_sm.set_state("Attack");
		}
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}