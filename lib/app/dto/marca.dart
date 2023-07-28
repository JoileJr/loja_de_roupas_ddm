class Marca{
  final dynamic id;
  final String nome;

  Marca({
    required this.id,
    required this.nome,
  });

  @override
  bool operator ==(other) => 
    other is Marca && 
    other.nome == nome && 
    other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
    ''';
  }
}