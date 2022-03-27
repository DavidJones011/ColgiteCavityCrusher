/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_player_recovery){
	image_speed = 0;	
	image_index = 15;
}
player_sm.send_input("anim_end");

if(sprite_index == spr_player_attack || sprite_index == spr_player_attack_loop || sprite_index == spr_player_attack2 ||sprite_index == spr_player_attack3 ){
	counts = true;
}
