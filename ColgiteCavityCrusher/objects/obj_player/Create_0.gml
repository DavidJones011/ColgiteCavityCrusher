
PlayerStats=
{
	hp: 100,
	_speed: 20
}

points = 390;
_death = false;
_attack = false;
_input = true;
counts = true;
_stopAttackTimer = 0;
_attackTimer = 0;
powerup = 0;
_block = false;
special_bool = false;
wasBlock = false;
blockEnd = false;
powerupTotal = 0;
hasInput = false;
blockSet = false;
//animEnd = false;

idle_state = new PlayerIdleState("Idle", spr_player_idle);
chase_state = new PlayerMoveState("Move", spr_player_walk);
attack_state = new PlayerAttackState("Attack", spr_player_attack);
hurt_state = new PlayAnimationOnceState("Hurt", spr_player_hit, "Idle");
recovery_state = new PlayAnimationOnceState("Recover", spr_player_recovery, "Idle");
death_state = new PlayerDeathState("Death", spr_player_death);
block_state = new PlayerBlockState("Block", spr_player_block_start);
block_recovery_state = new PlayAnimationOnceState("BlockRecovery", spr_player_block_recovery, "Idle");
block_hit_state = new PlayAnimationOnceState("BlockHit", spr_player_block_hit, "Block");
special_state = new PlayAnimationOnceState("Special", spr_player_special, "Idle");

// setup state machine
player_sm = new StateMachine(self);
player_sm.add_state(idle_state);
player_sm.add_state(hurt_state);
player_sm.add_state(chase_state);
player_sm.add_state(attack_state);
player_sm.add_state(death_state);
player_sm.add_state(recovery_state);
player_sm.add_state(block_state);
player_sm.add_state(block_recovery_state);
player_sm.add_state(special_state);
player_sm.add_state(block_hit_state);
player_sm.set_default_state("Idle");


function take_damage(_damage, _x){
	if(!special_bool){
		if((!_block || (image_xscale > 0 && _x < x) || (image_xscale < 0 && _x > x))){
			image_speed = 1;
			PlayerStats.hp -= _damage;
			point(-20);
			if(PlayerStats.hp <=0){
				audio_play_sound(snd_player_death, 10, false);
				player_sm.set_state("Death");
		
			}
			else{
				player_sm.set_state("Hurt");
				audio_play_sound(snd_hurt_01, 10, false);
				_input = false;
			}
		}
		else if(!hasInput){
			player_sm.set_state("BlockHit");
			image_speed = 1;
			blockEnd = false;
			wasBlock = true;
		}
	}
}

function move(_x, _y){
	
	if(_x == 0 && _y ==0){
		return false;
	}
	if(_x < 0 && image_xscale >0 ){
		image_xscale *= -1;	
	}
	else if(image_xscale < 0 && _x > 0){
		image_xscale *= -1;
	}
	
	
	if(_y == 1 && y < 4000){
		y += _y * PlayerStats._speed;
	}
	else if(y > 2350 && _y == -1){
		y += _y * PlayerStats._speed;	
	}
	if(x+_x*PlayerStats._speed > cont_camera.posX && x+_x*PlayerStats._speed < (cont_camera.posX+cont_camera.cameraWidth*cont_camera.zoomFactor))
	{	
		x += _x * PlayerStats._speed;
	}
	
	return true;
}

function attack(start_time){
	_attack = true;
	_attackTimer++;

	if( _stopAttackTimer > 20)  {
		audio_play_sound(snd_woosh_01, 10, false);
		_attack = false;
		_input = false;
		counts = true; 
		return false;	
	}		
	
	return true;
}

function death(_end){
	_death = true;
	if(!_end){
		//instance_deactivate_all(true);
	}
	else{
		obj_gameover.game_over();
		//instance_create_layer(0,0,"Instances", obj_gameover);
	}
	
}

function block(){
	return blockEnd;	
}

function point(_pointChange){
	points += _pointChange;	
	if(points > 400*(powerupTotal + 1)){
		instance_create_layer(x ,2200, "Instances", obj_powerup_text);
		powerupTotal++;
		powerup++;	
	}
}


function attacking(){
	if(sprite_index == spr_player_attack || sprite_index == spr_player_attack_loop || sprite_index == spr_player_attack2 || sprite_index == spr_player_attack3){
		return true;
	}
	return false;
}