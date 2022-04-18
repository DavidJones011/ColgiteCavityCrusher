/// @description Insert description here
// You can write your code in this editor
with(other){
	relX = x - obj_beam.x;
	if(EnemyStats.hp > 0 && relX < obj_beam._xLength && relX > obj_beam._start){
		take_damage(100);
		obj_player.point(50);
	}
}