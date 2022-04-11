// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetPointAroundTarget(_target, _minY = 0, _minDist = 0, _maxDist = 1)
{
	if(is_undefined(_target))
		return undefined;
		
	var dist = random_range(_minDist, _maxDist);
	var angle = random_range(0, 6.28318531);
	
	var spotX = dist * cos(angle) + _target.x;
	var spotY = max(dist * sin(angle) + _target.y, _minY);
	
	var height = camera_get_view_height(view_camera[0]);
	var width = camera_get_view_width(view_camera[0]);
	var camera_posX = camera_get_view_x(view_camera[0]);
	var camera_posY = camera_get_view_y(view_camera[0]);
	
	spotX = clamp(spotX, camera_posX + 300.0, camera_posX + width - 300.0);
	spotY = clamp(spotY, camera_posY + 300.0, camera_posY + height - 300.0);
	return [spotX,spotY];
}