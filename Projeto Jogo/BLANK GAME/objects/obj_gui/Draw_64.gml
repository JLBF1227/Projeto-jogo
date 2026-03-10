draw_set_font(Font1);

draw_text(213, 100, string(global.vida));

if global.inimigo_vivo = 1 {
draw_text(400, 100, string(obj_inimigo.vida));
}

draw_set_font(font_morte);

if global.vida < 1 {
draw_text(930, 540, "Morreu");
}