// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function FindSpotAtTarget(_enemy, _target, _attack_dist)
{
	if(is_undefined(_target))
		return [_enemy.x, _enemy.y];
		
	var attackDist = abs(_attack_dist);
	var dir = sign(_enemy.x - _target.x);	
	var spotX = _target.x + (_attack_dist * dir);
	var spotY = _target.y;
	return [spotX,spotY]
}