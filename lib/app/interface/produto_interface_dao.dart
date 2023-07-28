import 'package:loja_de_roupas/app/dto/produto.dart';

abstract class ProdutoInterfaceDAO {
  Future<Produto> salvar(Produto produto);
  Future<bool> excluir(dynamic id);
  Future<Produto> consultar(int id);
  Future<List<Produto>> consultarTodos();
}
