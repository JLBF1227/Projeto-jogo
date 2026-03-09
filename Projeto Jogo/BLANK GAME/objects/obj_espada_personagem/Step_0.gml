if (cooldown > 0) {
    cooldown -= 1;
}

// iniciar ataque
if (mouse_check_button_pressed(mb_left) && cooldown <= 0) {
    atacando = true;
    image_speed = 1;
    cooldown = tempo_cooldown;
}

if (image_index >= 3) {
    image_speed = 0;
    image_index = 0;
    atacando = false;
}

x = obj_personagem.x - 50;
y = obj_personagem.y - 10;

image_xscale = 3;
image_yscale = 3;