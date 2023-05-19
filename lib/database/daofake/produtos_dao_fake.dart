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
  Produto salvar(Produto contato) {
    if (contato.id == null) {
      contato = Produto(
        id: produto.length,
        nome: contato.nome,
        descricao: contato.descricao,
        preco: contato.preco,
      );
      produto.add(contato);
    } else {
      int i = (contato.id as int) - 1;
      produto[i] = contato;
    }
    print(contato);
    return contato;
  }
}
