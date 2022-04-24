// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// projectile attack, spawn a projectile after a certain frame
function BossPlayAnimationOnceState(_id = "ProjectileAttack", _sprite = undefined, _sprite_bt = undefined, _sprite_ft = undefined, _next_id = "Idle") : State(_id) constructor
{
	next_id = _next_id;
	sprite = _sprite;
	sprite_bt = _sprite_bt;
	sprite_ft = _sprite_ft;
		
	static enter_state = function(_sm)
	{
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
			_sm.get_owner().front_tentacle.sprite_index = sprite_ft;
			_sm.get_owner().back_tentacle.sprite_index = sprite_bt;
		}
	}
	
	static handle_input = function(_sm, _input="")
	{		
		if(_input == "anim_end")
		{
			var bValid = (_sm.get_owner().sprite_index == sprite);
			if(bValid)
			{
				//show_debug_message(_sm.get_owner().image_index);
				_sm.set_state(next_id);	
			}
		}
	}
}