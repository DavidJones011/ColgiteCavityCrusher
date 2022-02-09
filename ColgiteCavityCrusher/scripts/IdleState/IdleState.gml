// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for enemies
function IdleState(_id = "Idle", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	
	// TODO: store in struct for AI data
	start_time = 0;
	attack_speed = 1000;
	
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
		// check the distance from the target
		var dist = 0.0;
		var target = _sm.get_owner().target;
		var target_position = _sm.get_owner().target_position;
		if(!is_undefined(target))
		{
			dist = point_distance(_sm.get_owner().x, _sm.get_owner().y, target.x, target.y);
		}
		else if(!is_undefined(target_position))
		{
			dist = point_distance(_sm.get_owner().x, _sm.get_owner().y, target_position.x, target_position.y);
		}
		
		// if the distance is greater than the threshold, change to move state
		//TODO: make a properties struct for the enemies that states can read data from
		if(dist > 5.0)
		{
			_sm.set_state("MoveTo");
		}
		else if(dist <= 5.0 && (current_time - start_time >= attack_speed))
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