// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for enemies
function PlayerIdleState(_id = "Idle", _sprite = undefined) : State(_id) constructor
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
		_sm.get_owner()._input = true;
		_sm.get_owner()._block = false;
		_sm.get_owner().image_speed = 1;
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{
		//var stats = _sm.get_owner().PlayerStats;
				
		// check the distance from the target
		//var dist = 0;
		//if(!is_undefined(stats.target))
		//{
		//	//var spot = AIHelpers().find_spot_at_player(_sm.get_owner(), stats.target, stats.distToAttack);
		//	//dist = abs(_sm.get_owner().x - spot[0]);
		//}

		//var diff = dist - stats.distToAttack;
		//if(dist > 500|| dist < -500)
		//{
		//	_sm.set_state("MoveTo");
		//}
		//else if(current_time - start_time >= stats.hitRate)
		//{
		//	_sm.set_state("Attack");
		//}
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "attack"){
			_sm.set_state("Attack");	
		}
		else if(_input == "block"){
			_sm.set_state("Block");
		}
		else if(_input == "special"){
			_sm.set_state("Special");
		}
		else if(_input != "anim_end"){
			_sm.set_state("Move");
		}	
	}
}