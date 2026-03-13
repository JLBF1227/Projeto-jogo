draw_set_font(Font1);

altura_tela = display_get_gui_height(); 


if atr_aberto {
    draw_set_colour(c_white);
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, 500, altura_tela, false);

    for (var i = 0 ; i < n_atributos ; i++) {

        var y1 = 300 + altura_retangulo_atributo * i;
        var y2 = y1 + altura_retangulo_atributo;

        draw_set_colour(c_grey);
        draw_set_alpha(0.7);

        draw_rectangle_colour(
            0, y1,
            500, y2,
            c_grey, c_grey, c_grey, c_grey,
            false
        );

        if global.xp >= 10 {
            draw_sprite_ext(spr_mais, -1, 450, y1+50, 0.5, 0.5, 0, c_white, 1);

        }

        draw_set_alpha(1);
        draw_rectangle(0, y1, 500, y2, true);

        draw_set_colour(c_black);
        draw_text_transformed(30, y1 + altura_retangulo_atributo/2 - 8, string(atributos[i])+": "+string(valores[i]), 2, 2, 0);
    }
}

if global.xp >= 10 {
    draw_set_colour(c_blue);
    draw_text_transformed(710, 55, "+", 3.5, 3.5, 0);
}