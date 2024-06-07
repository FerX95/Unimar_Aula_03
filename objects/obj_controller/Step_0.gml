var reset_key = keyboard_check_pressed(vk_enter);

if(!instance_exists(obj_player)){
	if(reset_key){
		room_restart();
	}
}