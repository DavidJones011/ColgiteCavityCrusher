// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function EnemyDeathState(_id = "ProjectileAttack", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	timeStart = -1.0;
	timeToDisappear = 3.0;
		
	static enter_state = function(_sm)
	{
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
			_sm.get_owner().mask_index = spr_empty; // stupid way of disabling collision
		}
	}
	
	static step_state = function(_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		
		// instead of a boolean, if the time start is negative then the animation didn't finish
		if(timeStart < 0.0)
			return;
			
		if((current_time - timeStart)*0.001 >= timeToDisappear)
		{
			stats.spawner.remove_enemy(_sm.get_owner());
		}
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "anim_end" && !is_undefined(sprite))
		{
			_sm.get_owner().image_speed = 0;
			_sm.get_owner().image_index = _sm.get_owner().sprite_get_number(sprite)-1;
			timeStart = current_time;
		}
	}
}