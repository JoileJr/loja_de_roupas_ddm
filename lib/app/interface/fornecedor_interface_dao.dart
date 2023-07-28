import 'package:loja_de_roupas/app/dto/fornecedor.dart';

abstract class FornecedorInterfaceDAO{
  Future<Fornecedor> salvar(Fornecedor fornecedor);
  Future<bool> excluir(dynamic id);
  Future<Fornecedor> consultar(int id);
  Future<List<Fornecedor>>  consultarTodos();
}