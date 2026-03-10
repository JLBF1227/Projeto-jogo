var largura = 200;
var altura = 20;

var vida_ratio = global.vida / vida_max;

// Contorno da barra
draw_set_color(c_green);
draw_rectangle(17, 17, 23 + largura, 23 + altura, false);

// fundo
draw_set_color(c_white);
draw_rectangle(20, 20, 20 + largura, 20 + altura, false);

// barra de vida
draw_set_color(c_red);
draw_rectangle(20, 20, 20 + (largura * vida_ratio), 20 + altura, false);