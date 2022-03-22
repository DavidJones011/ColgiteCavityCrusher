// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Initial attack state that can lead to chained combos
function EnemyMeleeAttackState(_id = "MeleeAttack", _sprite = undefined, _damage = 10, _hit_frame = 0, _followup = undefined) : State(_id) constructor
{
	followUpState = _followup;
	damage = _damage;
	sprite = _sprite;
	hasHit = false;
	hitFrame = _hit_frame;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		hasHit = false;
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{
		/*var owner = _sm.get_owner();
		if(!hasHit && owner.has_passed_frame(hitFrame))
		{
			owner.spawn_projectile(projectile)
			hasThrown = true;
		}*/
	}
	
	static exit_state = function(_sm)
	{
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