/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

energy = 100.0;
vulnerable = false;
EnemyStats.hurtSound = snd_hurt_04;

EnemyStats.maxHealth = 400;
EnemyStats.hp = 400;

EnemyStats.spawner = cont_bossevent;
tired_timer = 52000;

healthSegment = EnemyStats.maxHealth / 3;
phase = 0;

back_tentacle = instance_find(obj_tentacle,0);
front_tentacle = instance_find(obj_tentacle,1);

image_blend = c_red;
back_tentacle.image_blend = c_red;
front_tentacle.image_blend = c_red;

// create ranged enemy states
idle_state = new BossIdleState("Idle");
weak_state = new BossVulnerableState("Weak");
attack_bt_state = new BossMeleeHitState("AttackBT", 0, "Idle");
attack_ft_state = new BossMeleeHitState("AttackFT", 1, "Idle");
recover_state = new BossRecoverState("Recover");
hurt_state = new BossPlayAnimationOnceState("Hurt", spr_boss_hurt_body, spr_boss_hurt_bt, spr_boss_hurt_ft, "Weak");
death_state = new BossDeathState("Death", spr_boss_death_body, spr_boss_death_bt, spr_boss_death_ft);

// add the states to the state machine
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
enemy_sm.add_state(recover_state);
enemy_sm.add_state(attack_bt_state);
enemy_sm.add_state(attack_ft_state);
enemy_sm.add_state(weak_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");

function take_damage(_damage = 10)
{	
	cancel_move();
	if(self.EnemyStats.hp == 0)
	{
		self.enemy_sm.set_state("Death");
		return;
	}
	
	if(vulnerable)
	{
		self.EnemyStats.hp -= _damage;
		self.EnemyStats.hp = clamp(self.EnemyStats.hp, 0, self.EnemyStats.maxHealth);
		if(EnemyStats.hp < EnemyStats.maxHealth - healthSegment * (phase + 1))
		{
			self.EnemyStats.hp = clamp(self.EnemyStats.hp, 1000 - healthSegment * (phase + 1), self.EnemyStats.maxHealth);
			vulnerable = false;
			phase++;
			energy = 100.0;
			self.enemy_sm.set_state("Recover");
		}
	
		if(!is_undefined(cont_camera))
			cont_camera.shake_camera(7, 0.1);
	
		if(self.EnemyStats.hp == 0)
		{
			audio_play_sound(snd_critcal_hit, 5, false);
			audio_play_sound(EnemyStats.hurtSound, 5, false);
			self.enemy_sm.set_state("Death");
		}
		else
		{
			audio_play_sound(snd_normal_hit, 5, false);
			if(random_range(0, 10) <= 4.0)
				audio_play_sound(EnemyStats.hurtSound, 5, false);
			self.enemy_sm.set_state("Hurt");
		}	
	}
	else
	{
		audio_play_sound(snd_block_hit, 5, false);	
	}
}