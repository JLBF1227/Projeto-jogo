draw_set_font(Font1);

/// Draw GUI Event do Inventário

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if keyboard_check_pressed(ord("I")) {
    inv_aberto = !inv_aberto;
}

if inv_aberto {

    draw_set_alpha(0.7);

    hover_slot = -1;
    hover_extra = -1;

    // INVENTÁRIO NORMAL
    for (var posY = 0; posY < n_linhas; posY++) {
        for (var posX = 0; posX < n_colunas; posX++) {

            var indexArray = posX + (posY * n_colunas);
            var slot_x = inv_x + posX * tamanho_slot;
            var slot_y = inv_y + posY * tamanho_slot;

            var mouse_no_slot = mx > slot_x and mx < slot_x + tamanho_slot and my > slot_y and my < slot_y + tamanho_slot;

            draw_set_color(c_gray);
            draw_rectangle(slot_x, slot_y, slot_x + tamanho_slot, slot_y + tamanho_slot, false);

            draw_set_color(c_white);
            draw_rectangle(slot_x, slot_y, slot_x + tamanho_slot, slot_y + tamanho_slot, true);

            draw_set_alpha(1);
            if inventario[indexArray] != 0 {
                draw_sprite(inventario[indexArray].sprite, 0,
                slot_x + tamanho_slot/2, slot_y + tamanho_slot/2);
            }
            draw_set_alpha(0.7);

            if mouse_no_slot {
                hover_slot = indexArray;

                draw_set_alpha(0.2);
                draw_rectangle(slot_x, slot_y, slot_x + tamanho_slot, slot_y + tamanho_slot, false);
                draw_set_alpha(0.7);
            }

            if mouse_check_button_pressed(mb_left) and mouse_no_slot {
                if inventario[indexArray] != 0 {
                    drag_slot = indexArray;
                    drag_item = inventario[indexArray];
                    inventario[indexArray] = 0;
                }
            }
        }
    }

    /// POSIÇÃO DOS SLOTS EXTRAS
    var extra_x = inv_x + (n_colunas * tamanho_slot) + 20;
    var slot_mao_y = inv_y;
    var slot_arm_y = inv_y + tamanho_slot + 10;

    /// SLOT MÃO

    var mouse_no_slot = mx > extra_x and mx < extra_x + tamanho_slot and my > slot_mao_y and my < slot_mao_y + tamanho_slot;

    draw_set_color(c_gray);
    draw_rectangle(extra_x, slot_mao_y, extra_x + tamanho_slot, slot_mao_y + tamanho_slot, false);

    draw_set_color(c_white);
    draw_rectangle(extra_x, slot_mao_y, extra_x + tamanho_slot, slot_mao_y + tamanho_slot, true);

    draw_set_alpha(1);
    if slot_arma != 0 {
        draw_sprite(slot_arma.sprite, 0,
        extra_x + tamanho_slot/2,
        slot_mao_y + tamanho_slot/2);
    }
    draw_set_alpha(0.7);

    if mouse_no_slot {

        hover_extra = 0;

        draw_set_alpha(0.2);
        draw_rectangle(extra_x, slot_mao_y, extra_x + tamanho_slot, slot_mao_y + tamanho_slot, false);
        draw_set_alpha(0.7);

        if mouse_check_button_pressed(mb_left) and slot_arma != 0 {
            drag_item = slot_arma;
            drag_slot = -2;
            slot_arma = 0;
        }
    }

    /// SLOT ARMADURA

    mouse_no_slot = mx > extra_x and mx < extra_x + tamanho_slot and my > slot_arm_y and my < slot_arm_y + tamanho_slot;

    draw_set_color(c_gray);
    draw_rectangle(extra_x, slot_arm_y, extra_x + tamanho_slot, slot_arm_y + tamanho_slot, false);

    draw_set_color(c_white);
    draw_rectangle(extra_x, slot_arm_y, extra_x + tamanho_slot, slot_arm_y + tamanho_slot, true);

    draw_set_alpha(1);
    if slot_armadura != 0 {
        draw_sprite(slot_armadura.sprite, 0,
        extra_x + tamanho_slot/2,
        slot_arm_y + tamanho_slot/2);
    }
    draw_set_alpha(0.7);

    if mouse_no_slot {

        hover_extra = 1;

        draw_set_alpha(0.2);
        draw_rectangle(extra_x, slot_arm_y, extra_x + tamanho_slot, slot_arm_y + tamanho_slot, false);
        draw_set_alpha(0.7);

        if mouse_check_button_pressed(mb_left) and slot_armadura != 0 {
            drag_item = slot_armadura;
            drag_slot = -3;
            slot_armadura = 0;
        }
    }

    /// SOLTAR ITEM

    if mouse_check_button_released(mb_left) and drag_item != -1 {

        // SOLTOU EM SLOT DO INVENTÁRIO
        if hover_slot != -1 {

            if hover_slot == drag_slot {
                inventario[drag_slot] = drag_item;
            }
            else {

                var aux = inventario[hover_slot];
                inventario[hover_slot] = drag_item;

                if drag_slot >= 0
                    inventario[drag_slot] = aux;
                else if drag_slot == -2
                    slot_arma = aux;
                else if drag_slot == -3
                    slot_armadura = aux;
            }

        }
        // SLOT ARMA
        else if hover_extra == 0 {

            var aux = slot_arma;
            slot_arma = drag_item;

            if drag_slot >= 0
                inventario[drag_slot] = aux;
            else if drag_slot == -3
                slot_armadura = aux;

        }
        // SLOT ARMADURA
        else if hover_extra == 1 {

            var aux = slot_armadura;
            slot_armadura = drag_item;

            if drag_slot >= 0
                inventario[drag_slot] = aux;
            else if drag_slot == -2
                slot_arma = aux;

        }
        // FORA DO INVENTÁRIO
        else {

            if drag_slot >= 0
                inventario[drag_slot] = drag_item;
            else if drag_slot == -2
                slot_arma = drag_item;
            else if drag_slot == -3
                slot_armadura = drag_item;

        }

        drag_item = -1;
        drag_slot = -1;
    }

    /// DESENHAR ITEM ARRASTADO
    if drag_item != -1 {
        draw_set_alpha(1);
        draw_sprite(drag_item.sprite, 0, mx, my);
        draw_set_alpha(0.7);
    }

    /// TOOLTIP
    if hover_slot != -1 and inventario[hover_slot] != 0 {

        draw_set_color(c_white);
        draw_set_alpha(1);

        draw_text_transformed(mx + 16, my + 16,
        inventario[hover_slot].nome,
        1.5, 1.5, 0);

        draw_set_alpha(0.7);
    }

}
else {
    draw_set_alpha(1);
}