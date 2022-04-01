/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
{
	var farLayer = layer_get_id("Distant_Buildings");
	layer_x(farLayer, lerp(0, camera_get_view_x(view_camera[0]), 0.15));	
}