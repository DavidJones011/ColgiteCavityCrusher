// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// pixels before we consider the next depth

depth_section_size = 100
function calc_depth_from_y(_y)
{
	var count = room_height / depth_section_size
	return ceil((room_height - _y) / depth_section_size)
}