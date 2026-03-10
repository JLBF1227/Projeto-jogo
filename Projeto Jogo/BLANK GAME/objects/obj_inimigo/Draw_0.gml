draw_self();

// tamanho da barra
var largura = 40;
var altura = 6;

// posição da barra
var bx = x - largura/2;
var by = y - 40;

// Contorno da barra
draw_set_color(c_green);
draw_rectangle(bx - 3, by - 3, bx + largura + 3, by + altura + 3, false);

// fundo da barra
draw_set_color(c_white);
draw_rectangle(bx, by, bx + largura, by + altura, false);

// vida atual
var hp = vida / vida_max;

// barra de vida
draw_set_color(c_red);
draw_rectangle(bx, by, bx + (largura * hp), by + altura, false);