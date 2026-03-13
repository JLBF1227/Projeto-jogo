distancia = point_distance(x, y, obj_personagem.x, obj_personagem.y);

if global.vida > 0  { //and distancia < distancia_de_coleta 
    direction = point_direction(x, y, obj_personagem.x, obj_personagem.y);
    speed = spd;
}