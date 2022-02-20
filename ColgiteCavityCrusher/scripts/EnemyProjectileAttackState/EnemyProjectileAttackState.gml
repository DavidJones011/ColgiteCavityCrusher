// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// projectile attack, spawn a projectile after a certain frame
function EnemyProjectileAttackState(_id = "ProjectileAttack", _sprite = undefined, _projectile_obj = undefined, _spawn_frame = 0) : State(_id) constructor
{
	spawnFrame = _spawn_frame
	projectile = _projectile_obj
	hasThrown = false
	sprite = _sprite;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		hasThrown = false;
		spawnFrame = min(sprite, sprite_get_number(sprite)-1);
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{
		var owner = _sm.get_owner();
		if(!hasThrown && !is_undefined(projectile) && owner.has_passed_frame(spawnFrame))
		{
			owner.spawn_projectile(projectile)
			hasThrown = true;
		}
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "anim_end")
		{
			_sm.set_state("Idle");	
		}
	}
}