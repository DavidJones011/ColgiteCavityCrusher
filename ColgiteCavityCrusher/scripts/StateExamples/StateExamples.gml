// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// first example state
function ExampleState(_id = "Default") : State(_id) constructor
{
	static enter_state = function(_sm)
	{
		_sm.get_owner().sprite_index = spr_cat_example1;
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "space")
			_sm.set_state("Example2");
	}
}

// second example state
function ExampleState2(_id = "Default") : State(_id) constructor
{
	static enter_state = function(_sm)
	{
		_sm.get_owner().sprite_index = spr_cat_example2;
	}
	
	static handle_input = function(_sm, _input="")
	{
		if(_input == "ctrl")
			_sm.set_state("Example");
	}
}