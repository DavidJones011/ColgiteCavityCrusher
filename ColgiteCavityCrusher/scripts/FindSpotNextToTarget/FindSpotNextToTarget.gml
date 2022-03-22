// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function FindSpotNextToTarget(_enemy, _target, _desired_dist)
{
	if(is_undefined(_target))
		return undefined;
		
	var attackDist = abs(_desired_dist);
	var dir = sign(_enemy.x - _target.x);	
	var spotX = _target.x + (attackDist * dir);
	var spotY = _target.y;
	return [spotX,spotY]
}