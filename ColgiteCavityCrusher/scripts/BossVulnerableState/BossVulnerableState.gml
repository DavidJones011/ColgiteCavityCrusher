// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for ranged nemies
function BossVulnerableState(_id = "Idle") : State(_id) constructor
{	
	static enter_state = function(_sm)
	{
		_sm.get_owner().image_blend = c_white;
		_sm.get_owner().back_tentacle.image_blend = c_white;
		_sm.get_owner().front_tentacle.image_blend = c_white;
	}
	
	static step_state = function(_sm)
	{
		_sm.get_owner().tired_timer -= delta_time;
		if(_sm.get_owner().tired_timer <= 0.0)
		{
			_sm.set_state("Recover");
			_sm.get_owner().tired_timer = 50000;
		}
	}
	
	static exit_state = function(_sm)
	{
		_sm.get_owner().energy = 100.0;
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}