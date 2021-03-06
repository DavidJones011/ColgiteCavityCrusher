/// @description Insert description here
// You can write your code in this editor

event_inherited();

//change stats
EnemyStats.attackSpeed = 15000;
EnemyStats.attack_dev = 15000;
EnemyStats.distToAttack = 400;
EnemyStats.maxSpeed = 17.0;
EnemyStats.minSpeed = 12.0;
EnemyStats.hurtSound = snd_hurt_03;

// create ranged enemy states
idle_state = new EnemyIdleState("Idle", spr_meleeenemy_idle);
walk_rand_state = new EnemyMoveToRandomState("MoveToRand", spr_meleeenemy_idle);
walk_target_state = new EnemyMoveToTargetState("MoveToTarget", spr_meleeenemy_idle);
walk_around_target_state = new EnemyMoveToCircleState("MoveAroundTarget", spr_meleeenemy_idle);
attack_state = new EnemyMeleeHitState("Attack", spr_meleeenemy_attack, "Idle", 60000);
hurt_state = new PlayAnimationOnceState("Hurt", spr_meleeenemy_hurt, "Idle");
death_state = new EnemyDeathState("Death", spr_meleeenemy_death);

// add the states to the state machine
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
enemy_sm.add_state(walk_rand_state);
enemy_sm.add_state(walk_around_target_state);
enemy_sm.add_state(walk_target_state);
enemy_sm.add_state(attack_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");


