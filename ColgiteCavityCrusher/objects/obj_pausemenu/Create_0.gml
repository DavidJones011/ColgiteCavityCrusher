/// @description Insert description here
// You can write your code in this editor

global.paused = false;
prevIndex = -1;
timer = 500000;
index = 0;
viewing_controls = false;

function togglePause()
{
	global.paused = !global.paused;	
	if(!global.paused)
		viewing_controls = false;
}