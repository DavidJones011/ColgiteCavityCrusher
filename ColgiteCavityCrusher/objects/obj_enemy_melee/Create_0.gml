/// @description Insert description here
// You can write your code in this editor

event_inherited();

//change stats
EnemyStats.attackSpeed = 1000;
EnemyStats.attack_dev = 500;
EnemyStats.distToAttack = 350;

// create ranged enemy states
idle_state = new EnemyIdleState("Idle", spr_meleeenemy_idle);
chase_state = new EnemyMoveToState("MoveTo", spr_rangedenemy_walk, 10, 500);
attack_state = new PlayAnimationOnceState("Attack", spr_meleeenemy_attack, "Idle");
hurt_state = new PlayAnimationOnceState("Hurt", spr_rangedenemy_hurt, "Idle");
death_state = new EnemyDeathState("Death", spr_rangedenemy_death);

// add the states to the state machine
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
enemy_sm.add_state(chase_state);
enemy_sm.add_state(attack_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");


