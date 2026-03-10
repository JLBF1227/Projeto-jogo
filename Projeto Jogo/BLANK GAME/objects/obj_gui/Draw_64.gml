// Morte do personagem
draw_set_font(font_morte);

if global.vida < 1 {
draw_text(930, 540, "Morreu");
}