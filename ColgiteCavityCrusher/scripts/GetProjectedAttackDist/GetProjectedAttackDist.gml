// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetProjectedAttackDist(_target, _enemy, _desired_dist = 300, _vert_thresh = 300.0)
{
	var dist_x = abs(_target.x - _enemy.x);	
	var dist_y = abs(_target.y - _enemy.y);
	var vert_thresh = max(_vert_thresh, 50);
	if(dist_y > vert_thresh)
		return 0.0;
	else
		var valx = clamp(1.0 - (abs(dist_x - _desired_dist)/dist_x), 0.0, 1.0);
		var valy = clamp(1.0 - (dist_y/vert_thresh), 0.0, 1.0);
		return valx * valy;
}