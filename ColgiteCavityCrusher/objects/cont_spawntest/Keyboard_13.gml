/// @description Insert description here
// You can write your code in this editor

if(current_time - prev_time > 500)
{
	if(!is_undefined(inst))
	{
		instance_destroy(inst);
	}
	else
	{
		inst = instance_create_depth(0,0,0, cont_test);
	}
	
	prev_time = current_time;
}