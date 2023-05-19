import '../dto/produto.dart';

abstract class ProdutoInterfaceDAO {
  Produto salvar(Produto produto);
  bool excluir(dynamic id);
  Future<Produto> consultar(int id);
  Future<List<Produto>> consultarTodos();
}
