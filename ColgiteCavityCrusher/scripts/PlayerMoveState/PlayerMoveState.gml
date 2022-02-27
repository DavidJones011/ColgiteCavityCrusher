// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move state
function PlayerMoveState(_id = "Move", _sprite = undefined, _speed = 2) : State(_id) constructor
{
	sprite = _sprite;
	speed = _speed;
	_x = 0;
	_y = 0;
	
	
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
		if(!owner.move(_x, _y)){
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
		_sm.set_state("Idle");
	}
	
	static handle_input = function(_sm, _input){
		var owner = _sm.get_owner();
		if(_input == "up"){
			//owner.move(0, -1);
			_y = -1;
		}
		if(_input == "down"){
			_y = 1;
			//owner.move(0, 1);
		}
		if(_input == "right"){
			_x = 1;
			//owner.move(1, 0);
		}
		if(_input == "left"){
			_x = -1;
			//owner.move(-1, 0);
		}
		if(_input == "attack"){
			_sm.set_state("Attack");
		}
		
		
		
	}
}