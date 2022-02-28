/// @description Insert description here
// You can write your code in this editor
with(other){
	var gotPoint = true;
	
	if(self.EnemyStats.hp > 0){
			gotPoint = false;
	}
	show_debug_message(self.EnemyStats.hp);
	if(obj_player._attack && obj_player.counts){
		counts =false;
		
		take_damage();
		
		if(self.EnemyStats.hp == 0 && !gotPoint){
			obj_player.points += 100;	
			gotPoint = true;
		}
	}
	
	
	obj_player._attack = false;
}