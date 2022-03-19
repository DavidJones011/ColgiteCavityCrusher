/// @description Insert description here
// You can write your code in this editor

event_inherited();

//change stats
EnemyStats.attackSpeed = 2500;

// create ranged enemy states
idle_state = new EnemyIdleState("Idle", spr_rangedenemy_idle);
chase_state = new EnemyMoveToState("MoveTo", spr_rangedenemy_walk, 10, 500);
attack_state = new EnemyProjectileAttackState("Attack", spr_rangedenemy_attack, obj_enemy_projectile, 0);
hurt_state = new PlayAnimationOnceState("Hurt", spr_rangedenemy_hurt, "Idle");
death_state = new EnemyDeathState("Death", spr_rangedenemy_death);

// add the states to the state machine
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
enemy_sm.add_state(chase_state);
enemy_sm.add_state(attack_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");