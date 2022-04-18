/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_player_recovery ){
	image_speed = 0;	
	image_index = 15;
}
else if(sprite_index == spr_player_block_recovery){
	image_speed = 0;
	image_index = 6;
	blockSet  = false;
}
else if(sprite_index == spr_player_special){
	special_bool = false;
}
else if(sprite_index == spr_player_block_start && !blockSet){
	blockEnd = true;
	blockSet = true;
}
else if(sprite_index == spr_player_block_hit){
	image_speed = 0;	
}

player_sm.send_input("anim_end");


counts = true;
