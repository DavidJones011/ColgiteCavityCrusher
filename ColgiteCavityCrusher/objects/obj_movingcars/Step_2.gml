/// @description Insert description here
// You can write your code in this editor

if(prevIsColliding != isColliding && isColliding)
{
	obj_player.take_damage(20, x);
}
prevIsColliding = isColliding;