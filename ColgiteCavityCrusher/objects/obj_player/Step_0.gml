/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("A"))){
	if(image_xscale >0){
		image_xscale *=-1;
	}
	
	speed = -2
}

if(keyboard_check(ord("D"))){
	if(image_xscale <0){
		image_xscale *= -1;
	}
	
//image_angle = 180;
	speed = 2;
}

if(keyboard_check(ord("W"))){
	x +=1;
	y = y -2;
}

if(keyboard_check(ord("S"))){
	x -=1;
	y = y+2;
}

if(keyboard_check(vk_nokey)){
	speed = 0;
}
if(keyboard_check_direct(vk_space)){
		speed /= 2;
		sprite_index = spr_player_attack;
		attack = true;
		//on anim finish, switch sprite back
}