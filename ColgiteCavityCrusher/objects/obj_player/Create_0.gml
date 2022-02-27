
PlayerStats=
{
	hp: 100,
	_speed: 2
}

animEnd = false;

idle_state = new PlayerIdleState("Idle", spr_player_idle);
chase_state = new PlayerMoveState("Move", spr_player_walk);
attack_state = new PlayerAttackState("Attack", spr_player_attack);
hurt_state = new PlayAnimationOnceState("Hurt", spr_player_hit, "Idle");
recovery_state = new PlayAnimationOnceState("Recover", spr_player_recovery, "Idle");
death_state = new PlayerDeathState("Death", spr_player_death);

// setup state machine
player_sm = new StateMachine(self);
player_sm.add_state(idle_state);
player_sm.add_state(hurt_state);
player_sm.add_state(chase_state);
player_sm.add_state(attack_state);
player_sm.add_state(death_state);
player_sm.add_state(recovery_state);
player_sm.set_default_state("Idle");

function take_damage(_damage){
	hp -= _damage;
	if(hp ==0){
		player_sm.set_state("Death");
		
	}
	else{
		player_sm.set_state("Hurt");
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
		
	x += _x * PlayerStats._speed;
	y += _y * PlayerStats._speed;
	return true;
}

function attack(){
	if(keyboard_check(vk_nokey)){
		return false;	
	}
	return true;
}
