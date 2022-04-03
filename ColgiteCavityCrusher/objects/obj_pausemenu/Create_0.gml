/// @description Insert description here
// You can write your code in this editor

global.paused = false;
prevIndex = -1;
timer = 500000;
index = 0;

function togglePause()
{
	global.paused = !global.paused;	
}