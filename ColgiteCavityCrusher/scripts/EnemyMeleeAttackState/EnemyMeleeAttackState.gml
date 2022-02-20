// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Initial attack state that can lead to chained combos
function EnemyMeleeAttackState(_id = "MeleeAttack", _sprite = undefined, _mask = undefined, _damage = 10, _followup = undefined) : State(_id) constructor
{
	followUpState = _followup
	cachedMask = undefined
	damage = _damage
	hasHit = false
	sprite = _sprite;
	mask = _mask;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		
		// set the sprite mask
		if(!is_undefined(mask))
		{
			cachedMask = _sm.get_owner().mask_index;
			_sm.get_owner().mask_index = mask;
		}
		
		hasHit = false;
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{
		if(!hasHit)
		{
			var hit = _sm.get_owner().check_player_hit();
			if(hit != noone)
			{
				with(hit)
				{
					// TODO: hurt the player
					show_debug_message("HIT")
				}
				hasHit = true;
			}
			_sm.get_owner().cleanup_player_hit(hit);
		}
	}
	
	static exit_state = function(_sm)
	{
		// restore previous mask
		mask_index = cachedMask
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "anim_end")
		{
			if(!is_undefined(followUpState) && hasHit)
			{
				_sm.set_state(followUpState);
			}
			else
			{
				_sm.set_state("Idle");	
			}
		}
	}
}