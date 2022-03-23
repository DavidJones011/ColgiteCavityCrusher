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
	targetObj : obj_player,
	targetPos : undefined,
	spawner : undefined,
	curSpeed : 10.0,
	maxSpeed : 12.0,
	minSpeed : 8.0,
	isMoving : false
}

// create state machine for enemy
// make sure to add states to this state machine
enemy_sm = new StateMachine(self);

function move_to_random()
{
	var destination = FindRandomSpotInCamera(view_camera[0], 1800, 300);
	if(is_array(destination))
	{
		EnemyStats.targetPos = destination;
		EnemyStats.curSpeed = random_range(EnemyStats.minSpeed, EnemyStats.maxSpeed);
		EnemyStats.isMoving = true;
	}
	return EnemyStats.isMoving;
}

function move_next_to_target()
{
	var destination = FindSpotNextToTarget(self, EnemyStats.targetObj, EnemyStats.distToAttack);
	
	if(is_array(destination))
	{
		EnemyStats.targetPos = destination;
		EnemyStats.curSpeed = random_range(EnemyStats.minSpeed, EnemyStats.maxSpeed);
		EnemyStats.isMoving = true;
	}
	return EnemyStats.isMoving;
}

function cancel_move()
{
	EnemyStats.targetPos = undefined;
	EnemyStats.isMoving = false;
}

function update_move()
{
	if(is_undefined(EnemyStats.targetPos))
		return;
		
	if (distance_to_point(EnemyStats.targetPos[0], EnemyStats.targetPos[1]) > 50)
	{
		mp_potential_step(EnemyStats.targetPos[0], EnemyStats.targetPos[1], EnemyStats.curSpeed, all);
		if(direction > 90 && direction < 270)
			image_xscale = 1;
		else
			image_xscale = -1;
	}
	else
	{
		enemy_sm.send_input("goal_reached");
		EnemyStats.isMoving = false;
	}
}

/* send damage to the enemy object
 * if the enemy's hp = 0, then enemy statemachien enters the death state (if available)
 * else the enemy enters a hurt state
 */
function take_damage(_damage = 10)
{	
	cancel_move();
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
		var targetY = other.EnemyStats.targetObj.y - sprite_height/2;
		depth = CalcDepthFromY();
		speed = 70;
		var dirX = other.EnemyStats.targetObj.x - posX;
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

/* sets the spawner for this enemy object
 */
function set_spawner(_spawner)
{
	if(is_undefined(_spawner) || _spawner.object_index != cont_spawner)
		return;		
	self.EnemyStats.spawner = _spawner;
}

/* casts a rectangle collision to hit something */
function hit(_attackDist, _height, _offsetx, _offsety, _damage)
{
	if(is_undefined(EnemyStats.targetObj))
		return;
			
	x2 = x + (_offsetx - sprite_get_width(sprite_index) * 0.5) * image_xscale;
	x1 = x2 - (_attackDist * image_xscale);
	y1 = y + _offsety - (sprite_get_height(sprite_index) - _height) * 0.5;
	y2 = y1 + _height;

	var obj = collision_rectangle(x1, y1, x2, y2, EnemyStats.targetObj, 0, 0);
	if(obj != noone)
	{
		with(obj)
		{
			take_damage(10);
		}
	}
}