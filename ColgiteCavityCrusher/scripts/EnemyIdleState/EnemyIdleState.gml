// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// simple idle state for ranged nemies
function EnemyIdleState(_id = "Idle", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	timer = 0.0;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
		var stats = _sm.get_owner().EnemyStats;
		timer = stats.attackSpeed + random_range(-stats.attackSpeedDev, stats.attackSpeedDev);
	}
	
	static step_state = function(_sm)
	{		
		var stats = _sm.get_owner().EnemyStats;
		var rand = random_range(0,10);
		var attack_val = GetProjectedAttackDist(stats.targetObj, _sm.get_owner(), stats.distToAttack, 600);
		
		_sm.get_owner().image_xscale = -sign(stats.targetObj.x - _sm.get_owner().x);
			
		timer -= _sm.get_owner().delta_time;			
		if(timer <= 0.0)
		{
			timer = stats.attackSpeed + random_range(-stats.attackSpeedDev, stats.attackSpeedDev);
			if(attack_val > 0.5)
			{
				_sm.set_state("Attack");
			}
			else
			{
				if(rand > -1 && rand < 5)
				{
					_sm.set_state("MoveToRand");
				}
				else if(rand > 4 && rand < 7)
				{
					_sm.set_state("MoveAroundTarget");
				}
				else
				{
					_sm.set_state("MoveToTarget");
				}
			}
		}
	}
	
	static exit_state = function(_sm)
	{
	}
	
	static handle_input = function(_sm, _input="")
	{
	}
}