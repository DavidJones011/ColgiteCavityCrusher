/// @description Insert description here
// You can write your code in this editor
with(other){
	var gotPoint = false;
	if(obj_player._attack && self.EnemyStats.hp != 0){
		take_damage();	
		if(self.EnemyStats.hp == 0 && !gotPoint){
			obj_player.points += 100;	
			gotPoint = true;
		}
	}
	
	obj_player._attack = false;
}