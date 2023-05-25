import 'package:flutter/material.dart';

class CartaoNumero extends StatelessWidget {
  final TextEditingController controle;
  const CartaoNumero({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration(
          label: Text('Numero do cartao:'), hintText: '9999 9999 9999 9999'),
    );
  }

  String? ehVazio(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty)
      return 'O campo é obrigatório';
    return null;
  }
}
