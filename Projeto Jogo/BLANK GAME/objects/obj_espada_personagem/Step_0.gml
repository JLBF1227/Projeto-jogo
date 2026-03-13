if (cooldown > 0) {
    cooldown -= 1;
}

// iniciar ataque
// Não bater sem stamina
if (mouse_check_button_pressed(mb_left) 
and cooldown <= 0 
and obj_personagem.stamina >= 20) {

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

if obj_personagem.image_index == 0 or obj_personagem.image_index == 1 or obj_personagem.image_index == 7 {
    mao = 1;
}

if obj_personagem.image_index == 3 or obj_personagem.image_index == 4 or obj_personagem.image_index == 5 {
    mao = 0;
}

if (mao == 1) {

    x = obj_personagem.x + 50;
    y = obj_personagem.y + 10;
    image_xscale = -2;
    image_yscale = 2;


}
if (mao == 0) {
    x = obj_personagem.x - 35;
    y = obj_personagem.y + 10;
    image_xscale = 2;
    image_yscale = 2;


}
