hp = 100;

attack = false;

function take_damage(_damage){
	hp -= _damage;
	if(hp ==0){
		instance_destroy();
		
	}
	else{
		//hurt anim?	
	}
}