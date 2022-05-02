/// @description Insert description here
// You can write your code in this editor

if(global.paused)
	return;

if(prevIsColliding != isColliding && isColliding)
{
	obj_player.take_damage(20, x);
	audio_play_sound(snd_horn, 10, false);
}
prevIsColliding = isColliding;