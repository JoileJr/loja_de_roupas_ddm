class Marca {
  final dynamic id;
  final String nome;

  Marca(
    {
      this.id,
      required this.nome,
    }
  );

  @override
  String toString() {
    return 
    '''
      $id
      $nome
    ''';
  }
}
