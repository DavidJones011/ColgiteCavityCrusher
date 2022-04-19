/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

energy = 100.0;
EnemyStats.hurtSound = snd_hurt_04;
EnemyStats.hp = 1000
image_blend = c_aqua;

// create ranged enemy states
idle_state = new BossIdleState("Idle", spr_boss_idle);
//walk_rand_state = new EnemyMoveToRandomState("MoveToRand", spr_meleeenemy_idle);
//walk_target_state = new EnemyMoveToTargetState("MoveToTarget", spr_meleeenemy_idle);
//walk_around_target_state = new EnemyMoveToCircleState("MoveAroundTarget", spr_meleeenemy_idle);
//attack_state = new EnemyMeleeHitState("Attack", spr_meleeenemy_attack, "Idle", 60000);
hurt_state = new PlayAnimationOnceState("Hurt", spr_boss_idle, "Idle");
death_state = new EnemyDeathState("Death", spr_boss_death);

// add the states to the state machine
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
//enemy_sm.add_state(walk_rand_state);
//enemy_sm.add_state(walk_around_target_state);
//enemy_sm.add_state(walk_target_state);
//enemy_sm.add_state(attack_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");

