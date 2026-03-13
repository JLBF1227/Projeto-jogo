function Item(_nome, _sprite) {
    return {
        nome: _nome,
        sprite: _sprite
    }
}

function add_item(item) {

    for (var i = 0; i < tamanho_inventario; i++) {
        if inventario[i] == 0 {
            inventario[i] = item;

            return true;
        }
    }

    return false;
}

global.item_parede = Item("Parede", spr_parede);
global.item_inimigo = Item("Inimigo", spr_inimigo);
