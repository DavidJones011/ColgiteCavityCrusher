// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// projectile attack, spawn a projectile after a certain frame
function EnemyMeleeHitState(_id = "ProjectileAttack", _sprite = undefined, _next_id = "Idle", _timeToHit = 6000.0) : State(_id) constructor
{
	next_id = _next_id;
	sprite = _sprite;
	timer = _timeToHit;
	bHit = false;
		
	static enter_state = function(_sm)
	{
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;
		}
		bHit = false;
	}
	
	static step_state = function (_sm)
	{
		var stats = _sm.get_owner().EnemyStats;
		timer -= _sm.get_owner().delta_time;
		if(timer <= 0.0 && !bHit)
		{
			_sm.get_owner().hit(stats.distToAttack, 500, 100, -200, 10);
			bHit = true;
		}
	}
	
	static handle_input = function(_sm, _input="")
	{		
		if(_input == "anim_end")
		{
			var bValid = (_sm.get_owner().sprite_index == sprite);
			if(bValid)
			{
				_sm.set_state(next_id);	
			}
		}
	}
}