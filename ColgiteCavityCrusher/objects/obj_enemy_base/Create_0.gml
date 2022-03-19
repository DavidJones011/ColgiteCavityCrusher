/// @description Insert description here
// You can write your code in this editor

// enemy stats that the states can read from
// states shouldn't manipulate them, its better to have functions
EnemyStats =
{
	maxHealth : 100,
	hp : 100,
	attackSpeed : 1000,
	attackSpeedDev : 700,
	distToAttack : 2300,
	target : obj_player,
	spawner : undefined
}

// create state machine for enemy
// make sure to add states to this state machine
enemy_sm = new StateMachine(self);

/* moves the instance towards a spot near the target
 * return true when finished moving
 * return false when not finished
 */
function move(_target, _speed = 2, _dist_threshold = 5)
{
	if(is_undefined(_target))
		return false;
		
	var spot = FindSpotAtTarget(self, self.EnemyStats.target, self.EnemyStats.distToAttack);	
	if (distance_to_point(spot[0], spot[1]+300) > 100)
	{
		mp_potential_step(spot[0], spot[1]+300, _speed, all);
		//mp_linear_step_object(spot[0], spot[1]+300, _speed, all);
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

/* send damage to the enemy object
 * if the enemy's hp = 0, then enemy statemachien enters the death state (if available)
 * else the enemy enters a hurt state
 */
function take_damage(_damage = 10)
{	
	self.EnemyStats.hp -= _damage;
	self.EnemyStats.hp = clamp(self.EnemyStats.hp, 0, self.EnemyStats.maxHealth);
	
	if(self.EnemyStats.hp == 0)
	{
		//audio_play_sound(snd_critcal_hit, 5, false);
		self.enemy_sm.set_state("Death");
	}
	else
	{
		//audio_play_sound(snd_normal_hit, 5, false);
		self.enemy_sm.set_state("Hurt");
	}
}

/* 
 * wrapper to call instance_place for player collision
 */
function check_player_hit()
{
	return instance_place(x,y,obj_player)
}

/* 
 */
function cleanup_player_hit(_instance_id = noone)
{
	if(_instance_id != noone)
		instance_destroy(_instance_id);		
}

/* get the current frame image of the sprite
 */
function get_sprite_frame_count()
{
	
	return sprite_get_number(sprite_index);
}

/* spawn a projectile
 */
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

/* check to see if the current frame on the sprite has past the given frame index
 */
function has_passed_frame(_frame_index)
{
	return image_index > _frame_index;
}

/* sets the spawner for this enemy object
 */
function set_spawner(_spawner)
{
	if(is_undefined(_spawner) || _spawner.object_index != cont_spawner)
		return;		
	self.EnemyStats.spawner = _spawner;
}