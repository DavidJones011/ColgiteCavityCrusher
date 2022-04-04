/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_player_recovery){
	image_speed = 0;	
	image_index = 15;
}
if(sprite_index == spr_player_special){
	special_bool = false;
}

player_sm.send_input("anim_end");
//if(sprite_index != spr_player_walk){
//	player_sm.step_sm();
//}

counts = true;
