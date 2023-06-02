import 'package:loja_de_roupas/app/view/dto/produto.dart';
import 'package:loja_de_roupas/app/view/interface/produto_interface_dao.dart';
import 'package:loja_de_roupas/database/daofake/dadosfake.dart';

class ProdutoDAOFake implements ProdutoInterfaceDAO {
  @override
  Future<Produto> consultar(int id) {
    return Future.value(produto[id - 1]);
  }

  @override
  Future<List<Produto>> consultarTodos() {
    return Future.value(produto);
  }

  @override
  bool excluir(dynamic id) {
    print('excluir ${produto[id - 1]}');
    produto.remove(produto[id - 1]);
    return true;
  }

  @override
  Produto salvar(Produto cartao) {
    if (cartao.id == null) {
      cartao = Produto(
        id: produto.length,
        nome: cartao.nome,
        descricao: cartao.descricao,
        preco: cartao.preco,
      );
      produto.add(cartao);
    } else {
      int i = (cartao.id as int) - 1;
      produto[i] = cartao;
    }
    print(cartao);
    return cartao;
  }
}
