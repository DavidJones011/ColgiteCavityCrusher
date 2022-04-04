/// @description Insert description here
// You can write your code in this editor
if(PlayerStats.hp < 100){
	PlayerStats.hp += 10;
}
with(other){
	audio_play_sound(snd_pickup, 10, false);
	instance_destroy();
}