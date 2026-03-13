if keyboard_check_pressed(ord("C")) {
    atr_aberto = !atr_aberto;
}


if atr_aberto {

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    for (var i = 0; i < n_atributos; i++) {

        var y1 = 300 + altura_retangulo_atributo * i;

        if global.xp >= 10 {

            var spr_w = sprite_get_width(spr_mais) * 0.5;
            var spr_h = sprite_get_height(spr_mais) * 0.5;

            var bx1 = 450 - spr_w/2;
            var bx2 = 450 + spr_w/2;
            var by1 = y1 + 50 - spr_h/2;
            var by2 = y1 + 50 + spr_h/2;

            if point_in_rectangle(mx, my, bx1, by1, bx2, by2) {

                if mouse_check_button_pressed(mb_left) {

                    valores[i] += 1;
                    global.xp -= 10;

                }
            }
        }
    }
}