// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// pixels before we consider the next depth

function CalcDepthFromY()
{
	var depth_section_size = 100;
	var count = room_height / depth_section_size
	return ceil((room_height - y) / depth_section_size)
}