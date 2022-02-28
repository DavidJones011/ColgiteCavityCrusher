/// @description Insert description here
// You can write your code in this editor
if(!_death){
	draw_sprite(spr_health, 10 -PlayerStats.hp/10, 15, 15);
}

draw_text(800, 15, "Point Total: " +  string(points));