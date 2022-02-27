// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Initial attack state that can lead to chained combos
function PlayerAttackState(_id = "Attack", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	
	//have timer until I have animations
	start_time = 0;
	duration = 1000;
	
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
		
		if(!_sm.get_owner().attack()){
			_sm.set_state("Recover");	
		}
	}
	
	static exit_state = function(_sm)
	{
		_sm.set_state("Recover");
	}
	
	static handle_input = function(_sm, _input)
	{
		
		// would be triggered by animation
	}
}