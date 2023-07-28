import 'package:loja_de_roupas/app/dto/marca.dart';

abstract class MarcaInterfaceDAO{
  Future<Marca> salvar(Marca marca);
  Future<bool> excluir(dynamic id);
  Future<Marca> consultar(int id);
  Future<List<Marca>> consultarTodos();
}