var largura_vida = 200;
var altura_vida = 20;

var vida_ratio = global.vida / vida_max;

// Contorno da barra
draw_set_color(c_green);
draw_rectangle(17, 17, 23 + largura_vida, 23 + altura_vida, false);

// fundo
draw_set_color(c_white);
draw_rectangle(20, 20, 20 + largura_vida, 20 + altura_vida, false);

// barra de vida
draw_set_color(c_red);
draw_rectangle(20, 20, 20 + (largura_vida * vida_ratio), 20 + altura_vida, false);

var largura_stamina = 200;
var altura_stamina = 10;

var ratio = stamina / stamina_max;

// Contorno
draw_set_color(c_green);
draw_rectangle(17, 57, 23 + largura_stamina, 63 + altura_stamina, false);

// Fundo
draw_set_color(c_white);
draw_rectangle(20, 60, 20 + largura_stamina, 60 + altura_stamina, false);

// Barra de stamina
draw_set_color(c_blue);
draw_rectangle(20, 60, 20 + largura_stamina * ratio, 60 + altura_stamina, false);