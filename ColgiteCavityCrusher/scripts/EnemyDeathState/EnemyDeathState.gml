// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function EnemyDeathState(_id = "ProjectileAttack", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
		
	static enter_state = function(_sm)
	{
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "anim_end" && !is_undefined(sprite))
		{
			_sm.get_owner().image_speed = 0;
			_sm.get_owner().image_index = _sm.get_owner().sprite_get_number(sprite)-1;
		}
	}
}