// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for ranged nemies
function BossRecoverState(_id = "Idle", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	timer = 0.0;
	
	static enter_state = function(_sm)
	{
		cont_bossevent.spawn_enemies(_sm.get_owner().phase);
		//_sm.get_owner().image_blend = c_red;
		//_sm.get_owner().back_tentacle.image_blend = c_red;
		//_sm.get_owner().front_tentacle.image_blend = c_red;
		_sm.get_owner().front_tentacle.isMoving = true;
		_sm.get_owner().back_tentacle.isMoving = true;
		_sm.set_state("Idle");
		_sm.get_owner().energy = 100.0;
	}
	
	static step_state = function(_sm)
	{
		
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}