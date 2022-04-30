/// @description Insert description here
// You can write your code in this editor
if(attacking()){
	with(other){
		if(!bHit)
		{
			image_speed = 1;
			audio_play_sound(snd_trash, 10, false);
			bHit = true;
		}
	}
}