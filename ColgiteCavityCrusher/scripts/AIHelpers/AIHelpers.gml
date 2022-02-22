// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function find_spot_at_player(_enemy, _player, _attack_dist)
{
	if(is_undefined(_player))
		return;
		
	var attackDist = abs(_attack_dist);
	var dir = sign(_player.x - _enemy.x);	
	var spotX = _player.x + _attack_dist * dir;
	var spotY = _player.y + random_range(-10, 10);
	return [spotX,spotY]
}