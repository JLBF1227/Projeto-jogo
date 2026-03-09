draw_set_font(Font1);

draw_text(213, 100, string(global.vida));

if global.inimigo_vivo = 1 {
draw_text(400, 100, string(obj_inimigo.vida));
}