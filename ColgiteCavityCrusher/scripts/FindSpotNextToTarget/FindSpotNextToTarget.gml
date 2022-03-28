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
	
	var height = camera_get_view_height(view_camera[0]);
	var width = camera_get_view_width(view_camera[0]);
	var camera_posX = camera_get_view_x(view_camera[0]);
	var camera_posY = camera_get_view_y(view_camera[0]);
	spotX = clamp(spotX, camera_posX + 300.0, camera_posX + width - 300.0);
	spotY = clamp(spotY, camera_posY + 300.0, camera_posY + height - 300.0);
	return [spotX,spotY]
}