var _data = event_data;
var _inst = layer_instance_get_instance(event_data[? "element_id"]);

if(_inst == self.id)
{
	switch(_data[? "message"])
	{
		case "Enemy_Hit":
			hit(300, 400, 100, 0, 10);
			break;
		case "Enemy_Throw":
			spawn_projectile(obj_enemy_projectile);
			break;
		default:
			break;
	}
}