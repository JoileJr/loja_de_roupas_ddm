import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';

import '../utils/global.colors.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerGlobal().criarDrawer(context),
        body: const Center(
          child: Text('Pagina ainda em construção'),
        ),
      ),
    );
  }
}
