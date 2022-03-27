// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Initial attack state that can lead to chained combos
function PlayerAttackState(_id = "Attack", _sprite = undefined) : State(_id) constructor
{
	sprite = _sprite;
	
	//have timer until I have animations
	start_time = 0;
	duration = 1000;
	animTimer = 0;
	
	static enter_state = function(_sm)
	{
		// set the sprite
		if(!is_undefined(sprite))
		{
			_sm.get_owner().sprite_index = sprite;	
		}
		animTimer = 0;
		start_time = current_time;
	}
	
	static step_state = function(_sm)
	{		
		animTimer++;
		if(!_sm.get_owner().attack()){
			if(_sm.get_owner().sprite_index = spr_player_attack_loop){
				_sm.get_owner().sprite_index = spr_player_attack3;
				_sm.get_owner().image_index = 17;
			}
			_sm.set_state("Recover");	
		}
		if(animTimer = 10){
			_sm.get_owner().sprite_index = spr_player_attack2;	
		}
		else if(animTimer = 21){
			_sm.get_owner().sprite_index = spr_player_attack3;
		}
		else if(animTimer = 25){
			_sm.get_owner().sprite_index = spr_player_attack_loop;	
		}
	}
	
	static exit_state = function(_sm)
	{
		//_sm.set_state("Recover");
	}
	
	static handle_input = function(_sm, _input)
	{
		//if(_input != "attack"){
		//	_sm.set_state("Recover");	
		//}
		// would be triggered by animation
	}
}