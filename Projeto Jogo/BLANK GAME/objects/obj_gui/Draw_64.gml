// Morte do personagem
draw_set_font(font_morte);

if global.vida < 1 {
draw_text(930, 540, "Morreu");
}

draw_set_font(Font1);
draw_set_colour(c_white);

draw_set_colour(c_yellow);
draw_sprite(spr_gold, -1, 420, 60);
draw_text(400, 50, global.gold);

draw_set_color(c_white);
draw_rectangle(600, 80, 700, 90, false);

// Barra de XP
xp_ratio = global.xp / 10;

if xp_ratio > 1 xp_ratio = 1;

draw_set_color(c_blue);
draw_rectangle(600, 80, 600 + 100 * xp_ratio, 90, false); 

draw_set_colour(c_white);
draw_text(600, 50, "Level: " + string(global.level));