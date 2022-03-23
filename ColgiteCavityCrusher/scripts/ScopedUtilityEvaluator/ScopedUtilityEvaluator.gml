// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScopedUtilityEvaluator() constructor
{
	priority_name = undefined;
	priority_utility = -1.0;
	
	// returns --> score = value/max_value
	static add_utility_linear = function(_name, _value, _max_value, _factor = 1.0)
	{
		if(is_undefined(_name))
			return;
		
		var adj_max = max(_max_value, 0.001);
		var adj_value = clamp(_value, 0, _max_value);
		var utility = adj_value/adj_max * _factor;		
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	// returns --> score = 1 - (value/max_value)
	static add_utility_one_minus_linear = function(_name, _value, _max_value, _factor = 1.0)
	{
		if(is_undefined(_name))
			return;
			
		var adj_max = max(_max_value, 0.001);
		var adj_value = clamp(_value, 0, _max_value);
		var utility = (1.0 - (adj_value/adj_max)) * _factor;
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	// returns --> score = (value/max_value)^2
	static add_utility_squared = function(_name, _value, _max_value, _factor = 1.0)
	{
		if(is_undefined(_name))
			return;
			
		var adj_max = max(_max_value, 0.001);
		var adj_value = clamp(_value, 0, _max_value);
		var utility = power(adj_value/adj_max, 2) * _factor;
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	// returns --> score = 1 - (value/max_value)^2
	static add_utility_one_minus_squared = function(_name, _value, _max_value, _factor = 1.0)
	{
		if(is_undefined(_name))
			return;
			
		var adj_max = max(_max_value, 0.001);
		var adj_value = clamp(_value, 0, _max_value);
		var utility = (1.0 - power((adj_value/adj_max), 2)) * _factor;
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	static add_utility_squared_peak = function(_name, _value, _peak_value, _factor = 1.0)
	{
		if(is_undefined(_name))
			return;
			
		var adj_peak = max(_peak_value, 0.001);
		var adj_value = clamp(_value, 0, _value);	
		var peak_squared = adj_peak * adj_peak;			
		var utility = (((-1.0 / peak_squared) * power(adj_value - adj_peak, 2)) + 1.0) * _factor;
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	/* returns the utility name that has the highest priority as long as it meets the threshold */
	static get_utility_name = function(_required_threshold = 0.0)
	{
		if(priority_utility >= _required_threshold)
			return priority_name;
		else
			return undefined;
	}
	
	static get_utility = function()
	{
		return priority_utility;
	}
}