// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// projectile attack, spawn a projectile after a certain frame
function PlayAnimationOnceState(_id = "ProjectileAttack", _sprite = undefined, _next_id = "Idle") : State(_id) constructor
{
	next_id = _next_id;
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
		if(_input == "anim_end")
		{
			_sm.set_state(next_id);
		}
	}
}