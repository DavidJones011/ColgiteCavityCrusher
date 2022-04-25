/// @description Insert description here
// You can write your code in this editor
if(!_death){
	draw_sprite(spr_health, 10 -(PlayerStats.hp/10), 15, 15);
	//show_debug_message(PlayerStats.hp);
}
if(powerup > 0){
	draw_sprite(spr_power_up, 0, 100, 150);
}
else{
	draw_sprite(spr_empty_powerup, 0, 100, 150);
}

draw_set_color(c_white);
//draw_rectangle(1045, 15, 1225, 40, false);
draw_sprite(spr_point_b, 0, 1050, 30);
draw_set_color(c_black);
draw_text(1100, 20,  string(points));