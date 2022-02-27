/// @description Insert description here
// You can write your code in this editor

// enemy stats that the states can read from
// states shouldn't manipulate them, its better to have functions
EnemyStats =
{
	maxHealth : 100,
	hp : 100,
	hitRate : 1000,
	distToAttack : 2300,    // negative means infinite
	target : obj_player
}

// state initalization
idle_state = new EnemyIdleState("Idle", spr_rangedenemy_idle);
chase_state = new EnemyMoveToState("MoveTo", spr_rangedenemy_walk, 10, 500);
attack_state = new EnemyProjectileAttackState("Attack", spr_rangedenemy_attack, obj_enemy_projectile, 0);
hurt_state = new PlayAnimationOnceState("Hurt", spr_rangedenemy_hurt, "Idle");
death_state = new EnemyDeathState("Death", spr_rangedenemy_death);

// setup state machine
enemy_sm = new StateMachine(self);
enemy_sm.add_state(idle_state);
enemy_sm.add_state(hurt_state);
enemy_sm.add_state(chase_state);
enemy_sm.add_state(attack_state);
enemy_sm.add_state(death_state);
enemy_sm.set_default_state("Idle");


// moves the instance towards a spot near the target
// return true when finished moving
// return false when not finished
function move(_target, _speed = 2, _dist_threshold = 5)
{
	if(is_undefined(_target))
		return false;
		
	var spot = FindSpotAtTarget(self, self.EnemyStats.target, self.EnemyStats.distToAttack);	
	if (distance_to_point(spot[0], spot[1]+300) > 10)
	{
		mp_linear_step_object(spot[0], spot[1]+300, _speed, all);
		if(direction > 90 && direction < 270)
		{
			image_xscale = 1;
		}
		else
		{
			image_xscale = -1;
		}
		return true;
	}	
	return false;
}

// send damage to the enemy object
// if the enemy's hp = 0, then enemy enters a death state
// else the enemy enters a hurt state
function take_damage(_damage = 10)
{	
	self.EnemyStats.hp -= _damage;
	self.EnemyStats.hp = clamp(self.EnemyStats.hp, 0, self.EnemyStats.maxHealth);
	
	if(self.EnemyStats.hp == 0)
	{
		self.enemy_sm.set_state("Death");
	}
	else
	{
		self.enemy_sm.set_state("Hurt");
	}
}

function check_player_hit()
{
	return instance_place(x,y,obj_player)
}

function cleanup_player_hit(_instance_id = noone)
{
	if(_instance_id != noone)
		instance_destroy(_instance_id);		
}

function get_sprite_frame_count()
{
	return sprite_get_number(sprite_index);
}

function spawn_projectile(_projectile)
{	
	if(is_undefined(_projectile))
		return;
		
	var posX = other.x - 400 * image_xscale;
	var posY = other.y - other.sprite_height/2;
	with(instance_create_layer( posX, posY, "Projectiles", _projectile))
	{
		var targetY = other.EnemyStats.target.y - sprite_height/2;
		depth = CalcDepthFromY(min(other.EnemyStats.target.y, posY));
		speed = 70;
		var dirX = other.EnemyStats.target.x - posX;
		var dirY = targetY - posY;
		var offset = 0.0;

		if(dirX == 0.0)
			dirX =  1.0;
		else if(dirX < 0.0)
			offset = 180;
			
		direction = radtodeg(arctan(-dirY/dirX)) + offset;
			
		show_debug_message(string(direction));
	}	
}

function has_passed_frame(_frame_index)
{
	return image_index > _frame_index;
}