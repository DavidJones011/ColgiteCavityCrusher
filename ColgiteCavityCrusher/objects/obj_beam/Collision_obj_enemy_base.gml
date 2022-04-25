/// @description Insert description here
// You can write your code in this editor
with(other){
	relX = abs(x - obj_beam.x);
	
	if(EnemyStats.hp > 0 && relX < obj_beam._xLength && relX > obj_beam._start){
		take_damage(100);
		if(EnemyStats.hp == 0){
			obj_player.point(50);
			if(EnemyStats.maxHealth == 400){
				obj_player.point(100);	
			}
		}	
		
	}
}