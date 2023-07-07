import 'package:flutter/material.dart';

class ProdutoQuantidade extends StatelessWidget {
  final TextEditingController controle;
  const ProdutoQuantidade({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration(label: Text('Quantidade do produto:')),
    );
  }

  String? ehVazio(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty)
      return 'O campo é obrigatório';
    return null;
  }
}
