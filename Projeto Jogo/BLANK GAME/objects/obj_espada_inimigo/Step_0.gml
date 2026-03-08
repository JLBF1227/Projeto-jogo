if place_meeting(x, y, obj_personagem) and pode_bater{
	image_speed = 1;
	pode_bater = 0;
	alarm[0] = cd_bater * room_speed;
	
}
if place_meeting(x, y, obj_personagem) and image_index > 1 and pode_dar_dano = 1{
	global.vida--;
	pode_dar_dano = 0;
	alarm[1] = cd_bater * room_speed;
}


if image_index = 4{
	image_speed = 0;
	image_index = 0;
}

image_xscale = 2;
image_yscale = 2;