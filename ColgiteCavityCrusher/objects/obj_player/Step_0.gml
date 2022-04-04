/// @description Insert description here
// You can write your code in this editor
if(!global.paused){
depth = CalcDepthFromY();

if(_input){
	
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
	
}
//else if(image_index > image_number -1){
//	sprite_index = spr_player_recovery;
//	//need to figure out states with how they take in key inputs
//}

player_sm.step_sm();
}