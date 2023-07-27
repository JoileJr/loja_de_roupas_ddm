import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';

class BarraNavegacao extends StatelessWidget{
  const BarraNavegacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: GlobalColors.mainColor,
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }
}