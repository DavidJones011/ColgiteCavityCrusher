/// @description Insert description here
// You can write your code in this editor

// free state machine memory

//clean up, to help the gc remmove memory more efficiently
destroy_sm(sm);
delete idle_state;
delete run_state;
delete sm;

show_debug_message(sm);
show_debug_message(idle_state);
show_debug_message(run_state);