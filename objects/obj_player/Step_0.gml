// Definindo os controles
var jump_key = keyboard_check_pressed(vk_space);

// Configurando a gravidade
vspeed += grav;

// Programando o pulo do personagem
if(jump_key and is_ground){
	is_ground = false;
	audio_play_sound(sfx_jump, 0, false);
	vspeed = -jump_force;
}

// Máquina de estados para controlar as animações
switch(player_status){
	case "run":
		sprite_index = spr_player_run;
		
		if(vspeed < 0){
			player_status = "jump";
		}
		break;
	case "jump":
		sprite_index = spr_player_jump;
		
		if(vspeed > 0){
			player_status = "fall";
		}
		break;
	case "fall":
		sprite_index = spr_player_fall;
		
		if(is_ground){
			player_status = "run";
		}
		break;
}

// Configurando a colisão do player com o chão
if(place_meeting(x, y+vspeed, obj_collider)){
	while(!place_meeting(x, y+sign(vspeed), obj_collider)){
		y += sign(vspeed);
	}
	vspeed = 0;
	is_ground = true;
}