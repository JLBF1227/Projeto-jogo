//Andar
if global.vida > 0{
	
key_up = keyboard_check(ord("W"));

	if keyboard_check(ord("W")){
		image_index = 0;
	}

key_left = keyboard_check(ord("A"));
	if keyboard_check(ord("A")){
		image_index = 1;
	}

key_down = keyboard_check(ord("S"));
	if keyboard_check(ord("S")){
		image_index = 2;
	}

key_right = keyboard_check(ord("D"));
	if keyboard_check(ord("D")){
		image_index = 3;
	}


var hmove = key_right - key_left;
var vmove = key_down - key_up;
hsp = hmove * global.spd;
vsp = vmove * global.spd;
}

//Colisão
if place_meeting(x + hsp, y, obj_parede) or place_meeting(x + hsp, y, obj_inimigo){
	while (!place_meeting(x+sign(hsp), y, obj_parede) and !place_meeting(x + sign(hsp), y, obj_inimigo))  {
        x += sign(hsp);
    }
	hsp = 0;
}
if place_meeting(x, y + vsp, obj_parede) or place_meeting(x + hsp, y, obj_inimigo){
	while (!place_meeting(x, y + sign(vsp), obj_parede) and !place_meeting(x, y + sign(vsp), obj_inimigo)) {
        y += sign(vsp);
    }
	vsp = 0;
}
x += hsp;
y += vsp;


//Dash Rápido
if keyboard_check(ord("E"))and(pode_dash){
	global.spd = 20;
	alarm[0] = tempo_dash_rapido * room_speed;
	pode_dash = 0;
	alarm[1] = cd_dash * room_speed;
}
/*Dash Lento / Imortal
if keyboard_check(ord("Q"))and(pode_dash){
	global.spd = 10;
	global.pode_dar_dano = 0;
	alarm[0] = tempo_dash_lento * room_speed;
	pode_dash = 0;
	alarm[1] = cd_dash * room_speed;
	
}
*/

if global.vida <= 0{
	image_index = 4;
	image_speed = 0;
	instance_destroy(obj_espada_personagem);
	
	
}

//Tamanho (provisório)
image_xscale = 3;
image_yscale = 3;

