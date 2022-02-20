/// @description Insert description here
// You can write your code in this editor

// enemy stats that the states can read from
// states shouldn't manipulate them, its better to have functions
EnemyStats =
{
	maxHealth : 100,
	hp : 100,
	hitRate : 1000,
	distToAttack : 500,    // negative means infinite
	target : obj_player
}

// state initalization
idle_state = new EnemyIdleState("Idle", spr_cat_example1);
chase_state = new EnemyMoveToState("MoveTo", spr_cat_example2, 100, 500);
attack_state = new EnemyProjectileAttackState("Attack", spr_rangedenemy_attack, obj_enemy_projectile, 0);

// setup state machine
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
	mp_potential_step(_goal_x, _goal_y, _speed * (delta_time/1000000), true);
}

// send damage to the enemy object
// if the enemy's hp = 0, then enemy enters a death state
// else the enemy enters a hurt state
function take_damage(_damage = 10)
{	
	EnemyStats.hp -= _damage;
	EnemyStats.hp = clamp(EnemyStats.hp, 0, EnemStats.maxHealth);
	
	if(EnemyStats.hp == 0)
	{
		enemy_sm.set_state("Death");
	}
	else
	{
		enemy_sm.set_state("Hurt");
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
		
	var posX = other.x + 200;
	var posY = other.y - other.sprite_height/2;
	with(instance_create_layer( posX, posY, "Projectiles", _projectile))
	{
		var targetY = other.EnemyStats.target.y - sprite_height/2;
		depth = Helpers().calc_depth_from_y(min(other.EnemyStats.target.y, posY));
		speed = 10;
		var dirX = other.EnemyStats.target.x - posX;
		var dirY = targetY - posY;
		var offset = 0.0;

		if(dirX == 0.0)
			dirX =  1.0;
		else if(dirX < 0.0)
			offset = 180;
			
		direction = radtodeg(arctan(-dirY/dirX)) + offset;
			
		show_debug_message(string(direction))
	}	
}

function has_passed_frame(_frame_index)
{
	return image_index > _frame_index;
}