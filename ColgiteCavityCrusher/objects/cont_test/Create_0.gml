/// @description Insert description here
// You can write your code in this editor

idle_state = new ExampleState("Example");
run_state = new ExampleState2("Example2");

sm = new StateMachine(self);
sm.add_state(idle_state);
sm.add_state(run_state);
sm.set_default_state("Example");