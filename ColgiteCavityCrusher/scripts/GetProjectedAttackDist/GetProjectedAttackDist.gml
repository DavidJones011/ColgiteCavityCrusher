// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetProjectedAttackDist(_target, _enemy, _vert_thresh = 300.0)
{
	var dist_x = abs(_target.x - _enemy.x);
	var dist_y = abs(_target.y - _enemy.y);
	var vert_thresh = max(_vert_thresh, 50);
	if(dist_y > vert_thresh)
		return 0.0;
	else
		return dist_x * (1.0 - dist_y/vert_thresh);
}