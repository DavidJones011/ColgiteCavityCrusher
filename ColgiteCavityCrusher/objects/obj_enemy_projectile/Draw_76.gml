/// @description Insert description here
// You can write your code in this editor

// destroy projectile if it exits room boundary
if(x < 0 || x > room_width || y < 0 || y > room_height)
{
	instance_destroy();
}

// destory projectile and cause damage to player
if(place_meeting(x,y,obj_player))
{
	//obj_player.take_damage(10);
	instance_destroy();
}