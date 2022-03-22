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
		
		adj_max = max(_max_value, 0.001);
		adj_value = clamp(_value, 0, _max_value);
		utility = adj_value/adj_max * _factor;		
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
			
		adj_max = max(_max_value, 0.001);
		adj_value = clamp(_value, 0, _max_value);
		utility = (1.0 - (adj_value/adj_max)) * _factor;
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
			
		adj_max = max(_max_value, 0.001);
		adj_value = clamp(_value, 0, _max_value);
		utility = power(adj_value/adj_max, 2) * _factor;
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
			
		adj_max = max(_max_value, 0.001);
		adj_value = clamp(_value, 0, _max_value);
		utility = (1.0 - power((adj_value/adj_max), 2)) * _factor;
		if(utility > priority_utility)
		{
			priority_utility = utility;
			priority_name = _name;
		}
	}
	
	static get_utility_name = function()
	{
		return priority_name;
	}
	
	static get_utility = function()
	{
		return priority_utility;
	}
}