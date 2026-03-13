if (global.vida > 0) { 

    // reduzir invencibilidade
    if (invencivel > 0) {
        invencivel -= 1;
    }

    // distância e direção
    var dist = point_distance(x, y, obj_personagem.x, obj_personagem.y);
    var dir_mov = point_direction(x, y, obj_personagem.x, obj_personagem.y);


    // mudança de estado
    if (dist > dist_visao) {
        estado = "idle";
    }
    else if (dist > dist_ataque) {
        estado = "seguir";
    }
    else {
        estado = "atacar";
    }


    // Inimigo olhar (8 direções)
    if (estado != "idle") {

        var ang = point_direction(x, y, obj_personagem.x, obj_personagem.y);
        var dir_sprite = floor(((ang + 22.5) mod 360) / 45);

        image_index = dir_sprite;
    }


    // comportamento por estado
    switch (estado) {

        case "idle":
            // parado
        break;


        case "seguir":

            var nx = x + lengthdir_x(spd, dir_mov);
            var ny = y + lengthdir_y(spd, dir_mov);

            if (!place_meeting(nx, ny, obj_parede)) {

                x = nx;
                y = ny;

                obj_espada_inimigo.x = x;
                obj_espada_inimigo.y = y;
            }

        break;


        case "atacar":
            // aqui você poderá colocar animação ou ataque do inimigo
        break;
    }


    // receber dano da espada do jogador
    if (place_meeting(x, y, obj_espada_personagem)) {

        if (obj_espada_personagem.atacando 
        && obj_espada_personagem.image_index >= 1 
        && invencivel <= 0) {

            vida -= 1;
            invencivel = 60;

        }
    }


    // morte do inimigo
    if (vida <= 0) {

        global.inimigo_vivo = 0;
		// Dropar gold e xp
		instance_create_layer(x, y, "Instances", obj_gold);
        instance_create_layer(x+10, y, "Instances", obj_xp);
		
        instance_destroy(obj_espada_inimigo);
        instance_destroy();

    }

}
