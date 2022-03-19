// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum SM_Status
{
	ENTERING,
	EXITING,
	STEPING,
	INITIAL,
	NONE
}


function StateMachine (_owner = undefined) constructor
{
	status = SM_Status.INITIAL;
	default_state_id = undefined;
	pending_state_id = undefined;
	pending_input = undefined;
	current_state = undefined;
	owning_object = _owner;
	states = ds_map_create();
	
	// get owning object of the state machine
	static get_owner = function()
	{
		return owning_object;
	}
	
	// adds a state to the state machine
	static add_state = function (_state = undefined)
	{
		if (is_undefined(_state))
		{
			show_debug_message("StateMachine::add_state(), state was undefined");
			return;
		}
		
		ds_map_add(states, _state.get_state_id(), _state);
	}
	
	// delete the state from the state machine
	static remove_state = function (_id)
	{
		if(is_undefined(_id))
		{
			show_debug_message("StateMachine::remove_state(), state was undefined");
			return;
		}
			
		ds_map_delete(states, _id);
	}
	
	// sets the state machine default state
	static set_default_state = function(_id)
	{
		if(is_undefined(_id))
		{
			show_debug_message("StateMachine::set_default_state(), state was undefined");
			return;
		}
		
		if(!ds_map_exists(states, _id))
		{
			show_debug_message("StateMachine::set_default_state(), state couldn't be found");
			return;
		}
		
		default_state_id = _id;
	}
	
	// send input to the current state
	// if any input is entered before the state handles it, it is overwritten
	// TODO: allow for queued inputs?
	static send_input = function(_input="")
	{
		pending_input = _input;
	}
	
	// get the current state of the state machine
	static get_current_state = function()
	{
		return current_state;
	}
	
	// sets the current state for the state machine, if failes, the current state doesn't change
	static set_state = function(_id)
	{
		if(!is_undefined(pending_state_id))
		{
			//show_debug_message("StateMachine::set_state(), already pending state, ignored.");
			return;
		}	
		
		if(is_undefined(_id))
		{
			show_debug_message("StateMachine::set_state(), state was undefined");
			return;
		}
		
		if(_id == current_state.get_state_id())
		{
			//show_debug_message("StateMachine::set_state(), already in state");
			return;
		}
		
		if(!ds_map_exists(states, _id))
		{
			show_debug_message("StateMachine::set_state(), state couldn't be found");
			return;
		}
		
		pending_state_id = _id;	
	}
	
	// steps the state machine (steps the current state)
	static step_sm = function()
	{
		switch(status)
		{
			case SM_Status.ENTERING:
				pending_input = undefined;
				if(!is_undefined(current_state))
				{
					current_state.enter_state(self);
					status = SM_Status.STEPING;
				}
				else
					status = SM_Status.NONE;
			break;
			case SM_Status.EXITING:
				if(!is_undefined(current_state))
				{
					current_state.exit_state(self);
				}		
				if(!is_undefined(pending_state_id))
				{
					status = SM_Status.ENTERING;
					current_state = ds_map_find_value(states, pending_state_id);
					pending_state_id = undefined;
				}
				else
					status = SM_Status.NONE;	
			break;
			case SM_Status.STEPING:
				if(!is_undefined(current_state))
				{
					if(!is_undefined(pending_input))
					{
						current_state.handle_input(self, pending_input);
						pending_input = undefined;
					}
					current_state.step_state(self);
					if(!is_undefined(pending_state_id))
						status = SM_Status.EXITING;	
				}
				else
					status = SM_Status.NONE;
			break;
			case SM_Status.INITIAL:
				if(!is_undefined(default_state_id))
				{
					status = SM_Status.ENTERING;
					current_state = ds_map_find_value(states, default_state_id);
					pending_state_id = undefined;
				}
			break;
			default:
				break;
		}
	}
}

// free the state machine from memory
// CALL THIS instead of calling delete!!!
function destroy_sm (_sm)
{
	if(is_undefined(_sm))
	{
		show_debug_message("destroy_sm(), state machine was undefined");
		return;
	}
	
	// free memory
	ds_map_destroy(_sm.states);
	delete _sm.current_state;
	delete _sm;
}