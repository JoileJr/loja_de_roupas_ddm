class Produto {
  final dynamic id;
  final String nome;
  final String descricao;
  final String preco;

  Produto({
    this.id,
    required this.nome,
    required this.preco,
    required this.descricao}
  );

  @override
  String toString() {
    return '''
      $id
      $nome 
      $descricao 
      $preco
    ''';
  }
}
