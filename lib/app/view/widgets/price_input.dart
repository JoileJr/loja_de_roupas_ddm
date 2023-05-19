import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class PriceInput extends StatelessWidget {
  final TextEditingController controle;
  const PriceInput({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration(
          label: Text('Preço:'), hintText: '00,00'),
    );
  }

  String? ehVazio(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty)
      return 'O campo é obrigatório';
    return null;
  }
}
