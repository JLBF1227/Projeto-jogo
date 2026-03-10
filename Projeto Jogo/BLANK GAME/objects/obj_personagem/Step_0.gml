//Andar
if global.vida > 0{

key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));

var hmove = key_right - key_left;
var vmove = key_down - key_up

if hmove != 0 or vmove != 0 {

    move_direction = point_direction(0, 0, hmove, vmove);

    image_index = move_direction / 45;

    //Colisão

    novo_x = x + lengthdir_x(global.spd, move_direction);
    novo_y = y + lengthdir_y(global.spd,move_direction);
    novo_x_espada = obj_espada_personagem.x + lengthdir_x(global.spd, move_direction);
    novo_y_espada = obj_espada_personagem.y + lengthdir_y(global.spd, move_direction);

    i = 1;
    while (place_meeting(novo_x, novo_y, obj_parede) or place_meeting(novo_x, novo_y, obj_inimigo)) {

        novo_x = x + lengthdir_x(global.spd-i, move_direction);
        novo_y = y + lengthdir_y(global.spd-i, move_direction);
        novo_x_espada = obj_espada_personagem.x + lengthdir_x(global.spd-i, move_direction);
        novo_y_espada = obj_espada_personagem.y+ lengthdir_y(global.spd-i,move_direction);

        if (global.spd - i <= 0) break;
        i++;
    }
    x = novo_x;
    y = novo_y;
    obj_espada_personagem.x = novo_x_espada;
    obj_espada_personagem.y = novo_y_espada;
}

//Dash Rápido
if (mouse_check_button_pressed(mb_right)) and(pode_dash){
    global.spd = 20;
    alarm[0] = tempo_dash_rapido * room_speed;
    pode_dash = 0;
    alarm[1] = cd_dash * room_speed;
}
/*Dash Lento / Imortal
if keyboard_check(ord("Q"))and(pode_dash){
    global.spd = 10;
    global.pode_dar_dano = 0;
    alarm[0] = tempo_dash_lento room_speed;
    pode_dash = 0;
    alarm[1] = cd_dash * room_speed;

}
*/

var ang = point_direction(x, y, mouse_x, mouse_y);
var dir = floor(((ang + 22.5) mod 360) / 45);

image_index = dir;

}

if global.vida <= 0{
    image_index = 8;
    image_speed = 0;
    instance_destroy(obj_espada_personagem);


}

//Tamanho (provisório)
image_xscale = 2;
image_yscale = 2;
