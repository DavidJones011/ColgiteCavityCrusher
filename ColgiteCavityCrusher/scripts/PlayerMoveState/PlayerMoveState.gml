// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move state
function PlayerMoveState(_id = "Move", _sprite = undefined, _speed = 2) : State(_id) constructor
{
	sprite = _sprite;
	speed = _speed;
	_x = 0;
	_y = 0;
	lastX = 0;
	lastY = 0;
	
	
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
		//var stats = _sm.get_owner().PlayerStats;
		var owner = _sm.get_owner();
		if(!owner.move(_x, _y) && !owner._block && !owner.special_bool){
			_sm.set_state("Idle");
		}
		_x = 0;
		_y = 0;
		// goal object takes priority over specific location
		//var owner = _sm.get_owner();
		//if(!owner.move(stats.target, speed, dist_threshold))
		//{
		//	_sm.set_state("Idle");
		//}
	}
	
	static exit_state = function(_sm)
	{
		// reset the goal target for the next call
		//_sm.set_state("Idle");
	}
	
	static handle_input = function(_sm, _input){
		var owner = _sm.get_owner();
		if(_input == "W"){
			//owner.move(0, -1);
			lastY = -1;
			lastX = 0;
			_y = -1;
		}
		else if(_input == "S"){
			_y = 1;
			lastY = -1;
			lastX = 0;
			//owner.move(0, 1);
		}
		else if(_input == "D"){
			_x = 1;
			lastX = 1;
			lastY = 0;
			//owner.move(1, 0);
		}
		else if(_input == "A"){
			_x = -1;
			lastX = -1;
			lastY = 0;
			//owner.move(-1, 0);
		}
		else if(_input == "AW"){
			_x = -1;
			_y = -1;
			lastY = -1;
			lastX = -1;
		}
		else if(_input == "AS"){
			_x = -1;
			_y = 1;
			lastY = 1;
			lastX = -1;
		}
		else if(_input == "DW"){
			_x = 1;
			_y = -1;
			lastY = -1;
			lastX = 1;
		}
		else if(_input == "DS"){
			_x = 1;
			_y = 1;
			lastY = 1;
			lastX = 1;
		}
		
		else if(_input == "attack"){
			_sm.set_state("Attack");
		}
		else if(_input == "block"){
			_sm.set_state("Block");
		}
		else if(_input == "anim_end"){
			_x = lastX;
			_y = lastY;
	}
		
		
		
	}
}	