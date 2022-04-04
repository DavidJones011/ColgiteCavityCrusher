// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Move state
function PlayerBlockState(_id = "Block", _sprite = undefined, _speed = 2) : State(_id) constructor
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
		if(_sm.get_owner().wasBlock){
			_sm.get_owner().blockEnd = true;
			_sm.get_owner().image_speed = 0;	
			_sm.get_owner().image_index = 6;
		}
		_sm.get_owner()._input = true;
	}
	
	static step_state = function(_sm)
	{
		// grab the enemy stats
		//var stats = _sm.get_owner().PlayerStats;
		var owner = _sm.get_owner();
		if(owner.blockEnd){
			_sm.get_owner().image_index = 6;
			_sm.get_owner().image_speed = 0;
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
		_sm.get_owner.image_speed = 1;
		_sm.set_state("BlockRecovery");
		
	}
	
	static handle_input = function(_sm, _input){
	
		if(_input == "stopBlock"){
			_sm.get_owner.image_speed = 1;
			_sm.set_state("BlockRecovery")
		}
		if(_input == "hit"){
			_sm.get_owner().image_speed = 1;
			_sm.get_owner()._block = false;
			_sm.set_state("BlockHit");	
		}
		
	}
}	