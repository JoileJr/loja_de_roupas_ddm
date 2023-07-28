import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';

class Botao extends StatelessWidget {
  final VoidCallback? salvar;
  final BuildContext context;
  const Botao({required this.salvar, required this.context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton( 
      onPressed: salvar,
      style: ElevatedButton.styleFrom(
        primary: GlobalColors.mainColor
      ),
      child: const Text('Salvar', 
      style: TextStyle(color: Colors.white),
      ),
    );
  }
}