// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FindRandomSpotInCamera(_camera, _min_y = 0, _radius = 300)
{
	if(is_undefined(_camera))
		return undefined;
			
	var height = camera_get_view_height(_camera);
	var width = camera_get_view_width(_camera);
	var pos_x = camera_get_view_x(_camera) + random_range(_radius, width - _radius);
	var pos_y = camera_get_view_y(_camera) + random_range(_min_y + _radius, height - _radius);
	return [pos_x,pos_y];
}