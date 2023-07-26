import 'package:loja_de_roupas/app/dto/estado.dart';

abstract class EstadoInterfaceDAO{
  Future<Estado> salvar(Estado estado);
  Future<bool> excluir(dynamic id);
  Future<Estado> consultar(int id);
  Future<List<Estado>>  consultarTodos();
}