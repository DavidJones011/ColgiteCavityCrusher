/// @description Insert description here
// You can write your code in this editor
if(!global.paused){
depth = CalcDepthFromY();
if(_input && !special_bool){
if(!_block){	
	_key = "";
	if(keyboard_check(ord("A"))){
		_key = "A"
		//player_sm.send_input("left");
	}

	if(keyboard_check(ord("D"))){
		_key = "D";
		//player_sm.send_input("right");
	}

	if(keyboard_check(ord("W"))){
		if(_key == "A"){
			_key = "AW";
		}
		else if(_key == "D"){
			_key = "DW";
		}
		else{
			_key = "W";
		}
		//player_sm.send_input("up");
	}

	if(keyboard_check(ord("S"))){
		if(_key != ""){
			if(_key == "A"){
				_key = "AS";
			}
			else if(_key == "D"){
				_key = "DS";
			}
		}
		else{
			_key = "S";
		}
		//player_sm.send_input("down");
	}
	
	if(_key != ""){
		player_sm.send_input(_key);
	}
	_stopAttackTimer++;
	if(keyboard_check_pressed(vk_space)){
		_stopAttackTimer = 0;
		player_sm.send_input("attack");
	}
	if(keyboard_check(vk_shift) && powerup > 0){
		instance_create_layer(x+450*(image_xscale), y-400, "Instances", obj_beam);
		obj_beam.image_xscale = image_xscale;
		player_sm.send_input("special");	
		powerup--;
		special_bool = true;
	}
	
	if(keyboard_check(ord("E")) && !_block){
		player_sm.send_input("block");
		_block = true;
	}
}
	if(keyboard_check_released(ord("E")) && _block){
		_block = false;
		wasBlock = false;
		blockEnd = false;
		player_sm.send_input("stopBlock");
		image_speed = 1;
	}
	show_debug_message(image_speed);
}
//else if(image_index > image_number -1){
//	sprite_index = spr_player_recovery;
//	//need to figure out states with how they take in key inputs
//}

player_sm.step_sm();
}