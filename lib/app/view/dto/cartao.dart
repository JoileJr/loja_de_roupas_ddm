class Cartao {
  final dynamic id;
  final String nomeNocartao;
  final String numeroDoCartao;
  final String dataValidade;
  final String cvc;

  Cartao(
      {this.id,
      required this.nomeNocartao,
      required this.numeroDoCartao,
      required this.cvc,
      required this.dataValidade
    }
  );

  @override
  String toString() {
    return '''
      $id
      $nomeNocartao 
      $numeroDoCartao
      $cvc
      $dataValidade
    ''';
  }
}
