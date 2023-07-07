import 'package:loja_de_roupas/app/view/dto/marca.dart';

class Produto {
  final dynamic id;
  final String nome;
  final String preco;
  final String quantidade;
  final Marca marca;

  Produto(
      {this.id,
      required this.nome,
      required this.preco,
      required this.quantidade,
      required this.marca
    }
  );

  @override
  String toString() {
    return '''
      $id
      $nome 
      $preco 
      $quantidade
      $marca
    ''';
  }
}
