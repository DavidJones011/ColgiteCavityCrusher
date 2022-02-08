// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function State(_id = "Default") constructor
{
	state_id = _id;
	
	// get the state's id
	static get_state_id = function()
	{
		return state_id;	
	}
	
	// implementation for state during steping
	static step_state = function (_sm)
	{
	}
	
	// implementation for when the state has been entered
	// this could be used for setup or functionality that you want to call only at the first frame
	static enter_state = function(_sm)
	{
	}
	
	// implementation for when the state has been exited
	// this could be used for cleanup or functionality that you want to call only at the last frame
	static exit_state = function(_sm)
	{
	}
	
	// implementation for how the state handles input sent to the state machine
	static handle_input = function(_sm, _input="")
	{
	}
}