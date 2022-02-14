/// @description Insert description here
// You can write your code in this editor

// variables needed for the MoveTo state
target = obj_enemy_target;
target_position = undefined;
//

idle_state = new IdleState("Idle", spr_cat_example1);
chase_state = new MoveToState("MoveTo", spr_cat_example2, 2);
attack_state = new AttackState("Attack", spr_rangedenemy_attack);

enemy_sm = new StateMachine(self);
enemy_sm.add_state(idle_state);
enemy_sm.add_state(chase_state);
enemy_sm.add_state(attack_state);
enemy_sm.set_default_state("Idle");


// move to function
function move(_goal_x, _goal_y, _speed = 2)
{
	if(is_undefined(_goal_x) || is_undefined(_goal_y))
		return;
		
	//mp_potential_settings(0, 0, 3, true);
	mp_potential_step(_goal_x, _goal_y, _speed, true);
}
