//Seguir
if global.vida > 0 {

    direcao = point_direction(x, y, obj_personagem.x, obj_personagem.y);

    var i = 0;

    while !place_meeting(x+lengthdir_x(i, direcao), y+lengthdir_y(i, direcao), obj_parede) {

        if place_meeting(x+lengthdir_x(spd+i, direcao), y+lengthdir_y(spd+i, direcao), obj_personagem) {

            seguindo = 1;
            alarm[1] = cldwn_parar_de_seguir * room_speed;
            i = 0;
            break;
        }
        i++; 

    }

    if seguindo and !place_meeting(x+lengthdir_x(spd+2, direcao), y+lengthdir_y(spd+2,direcao), obj_parede)
	and !place_meeting(x+lengthdir_x(spd + global.spd, direcao), y+lengthdir_y(spd + global.spd,direcao), obj_personagem){
        x += lengthdir_x(spd, direcao); 
        y += lengthdir_y(spd, direcao);
		
		obj_espada_inimigo.x += lengthdir_x(spd, direcao); 
        obj_espada_inimigo.y += lengthdir_y(spd, direcao);
		
    }
	
}




