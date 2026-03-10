 if (cooldown > 0) {
    cooldown -= 1;
}

// iniciar ataque
	if (mouse_check_button_pressed(mb_left) and cooldown <= 0) {
    atacando = true;
    image_speed = 1;
    cooldown = tempo_cooldown;
}

if (image_index >= 4) {
    image_speed = 0;
    image_index = 0;
    atacando = false;
}

//Seguir o personagem
if (obj_personagem.image_index == 3 or obj_personagem.image_index == 2) {

    x = obj_personagem.x + 50;
    y = obj_personagem.y + 10;
	image_xscale = -3;
	image_yscale = 3;


}
if (obj_personagem.image_index == 1 or obj_personagem.image_index == 0) {
    x = obj_personagem.x - 35;
    y = obj_personagem.y + 10;
	image_xscale = 3;
	image_yscale = 3;


}

//Tamanho da imagem



/*if (cooldown > 0) {
    cooldown -= 1;
}

if (mouse_check_button_pressed(mb_left) && cooldown <= 0) {

    atacando = true;
    pode_dar_dano = false;
    cooldown = tempo_cooldown;

    if (obj_personagem.image_xscale == 1) {
        angulo = -40;
    } else {
        angulo = 220;
    }

}

if (atacando) {

    if (obj_personagem.image_xscale == 1) {

        angulo += vel_ataque;

        if (angulo > -10 && angulo < 20) {
            pode_dar_dano = true;
        } else {
            pode_dar_dano = false;
        }

        if (angulo >= 40) {
            atacando = false;
        }

    } else {

        angulo -= vel_ataque;

        if (angulo < 190 && angulo > 160) {
            pode_dar_dano = true;
        } else {
            pode_dar_dano = false;
        }

        if (angulo <= 140) {
            atacando = false;
        }

    }
}
x = obj_personagem.x + lengthdir_x(dist, angulo);
y = obj_personagem.y + lengthdir_y(dist, angulo);

image_angle = angulo;

image_xscale = 3;
image_yscale = 3;

*/