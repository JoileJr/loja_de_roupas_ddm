import 'package:loja_de_roupas/app/view/dto/cartao.dart';

abstract class CartaoInterfaceDAO {
  Cartao salvar(Cartao cartao);
  bool excluir(dynamic id);
  Future<Cartao> consultar(int id);
  Future<List<Cartao>> consultarTodos();
}
