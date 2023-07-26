import 'package:loja_de_roupas/app/dto/cidade.dart';

class Fornecedor{
  final dynamic id;
  final String nome;
  final String telefone; 
  final String email; 
  final String urlAvatar;
  final Cidade cidade;

  Fornecedor({
    this.id, 
    required this.nome, 
    required this.telefone, 
    required this.email, 
    required this.urlAvatar,
    required this.cidade
  });

  @override
  bool operator ==(other) => 
    other is Fornecedor && 
    other.nome == nome && 
    other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $telefone 
      $email
      $urlAvatar
    ''';
  }
}