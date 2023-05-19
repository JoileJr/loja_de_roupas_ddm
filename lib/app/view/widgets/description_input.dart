import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescriptionInput extends StatelessWidget {
  final qtdeMinimaCaracteres = 3;
  final mascara = '[A-Za-z\u00C0-\u00FF]';
  final TextEditingController controle;
  const DescriptionInput({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.text,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(mascara))],
      validator: (valorDigitado) {
        String? msnErro =
            ehVazio(valorDigitado) ?? temMinimoCaracteres(valorDigitado);
        return msnErro;
      },
      decoration: const InputDecoration(
          label: Text('Descrição:'), hintText: 'Informe a descrição'),
    );
  }

  String? ehVazio(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty)
      return 'O campo é obrigatório';
    return null;
  }

  String? temMinimoCaracteres(String? valorDigitado) {
    if (valorDigitado!.length < qtdeMinimaCaracteres)
      return 'O campo deve possuir pelo menos 3 caracteres';
    return null;
  }
}
