var cam = view_camera[0];

var alvo_x = obj_personagem.x - camera_get_view_width(cam) / 2;
var alvo_y = obj_personagem.y - camera_get_view_height(cam) / 2;

var atual_x = camera_get_view_x(cam);
var atual_y = camera_get_view_y(cam);

var novo_x = lerp(atual_x, alvo_x, 0.1);
var novo_y = lerp(atual_y, alvo_y, 0.1);

camera_set_view_pos(cam, novo_x, novo_y);