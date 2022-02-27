/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("A"))){
	//if(image_xscale >0){
	//	image_xscale *=-1;
	//}
	
	//speed = -2
	
	player_sm.send_input("left");
}

if(keyboard_check(ord("D"))){
//	if(image_xscale <0){
//		image_xscale *= -1;
//	}
	
////image_angle = 180;
//	speed = 2;

player_sm.send_input("right");
}

if(keyboard_check(ord("W"))){
	//x +=1;
	//y = y -2;
	player_sm.send_input("up");
}

if(keyboard_check(ord("S"))){
	//x -=1;
	//y = y+2;
	player_sm.send_input("down");
}

//if(keyboard_check(vk_nokey)){
	
//	player_sm.send_input("none");
//}
if(keyboard_check_direct(vk_space)){
//		speed /= 2;
//		sprite_index = spr_player_attack;
//		attack = true;
//		//on anim finish, switch sprite back
	player_sm.send_input("attack");
}

//else if(image_index > image_number -1){
//	sprite_index = spr_player_recovery;
//	//need to figure out states with how they take in key inputs
//}

player_sm.step_sm();