import 'package:loja_de_roupas/app/dto/marca.dart';

class Produto {
  final dynamic id;
  final String nome;
  final String preco;
  final Marca marca;

  Produto(
      {this.id,
      required this.nome,
      required this.preco,
      required this.marca,
      });

  @override
  bool operator ==(other) =>
      other is Produto && other.nome == nome && other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $preco 
      $marca
    ''';
  }
}
