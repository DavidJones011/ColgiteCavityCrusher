/// @description Insert description here
// You can write your code in this editor
audio_stop_all();
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);
audio_play_sound(song, 1000, true);