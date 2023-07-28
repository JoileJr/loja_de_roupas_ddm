import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';

class BotaoAdicionar extends StatelessWidget {
  final VoidCallback acao;
  const BotaoAdicionar({required this.acao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => acao(),
      tooltip: 'Adicionar Novo',
      child: const Icon(Icons.add),
      backgroundColor: GlobalColors.mainColor,
    );
  }
}