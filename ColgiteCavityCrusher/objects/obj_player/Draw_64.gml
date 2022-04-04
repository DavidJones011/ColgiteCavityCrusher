/// @description Insert description here
// You can write your code in this editor
if(!_death){
	draw_sprite(spr_health, 10 -PlayerStats.hp/10, 15, 15);
}
if(powerup > 0){
	draw_sprite(spr_power_up, 0, 50, 50);
}
else{
	draw_sprite(spr_empty_powerup, 0, 50, 50);
}

draw_text(800, 15, "Point Total: " +  string(points));