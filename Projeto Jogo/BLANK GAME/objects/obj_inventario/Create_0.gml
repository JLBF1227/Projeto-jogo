tamanho_slot = 100;
n_colunas = 10;
n_linhas = 5;

hover_slot = -1;
drag_slot = -1;
drag_item = -1;

larguraTela = display_get_gui_width();
alturaTela = display_get_gui_height();

inv_x = (larguraTela - (n_colunas * tamanho_slot)) / 2;
inv_y = (alturaTela - (n_linhas * tamanho_slot)) / 2;

inv_aberto = 0;

tamanho_inventario = n_colunas * n_linhas

inventario = array_create(tamanho_inventario, 0);

add_item(global.item_espada);
add_item(global.item_inimigo);
add_item(global.item_parede);

slot_arma = 0;
slot_armadura = 0;
hover_extra = -1;
drag_item = -1;
drag_slot = -1;