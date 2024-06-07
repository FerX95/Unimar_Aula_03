if(x > -16){
	hspeed = spd;
}else{
	if(instance_exists(obj_player)){
		obj_controller.game_score += 15;
	}
	instance_destroy();
}