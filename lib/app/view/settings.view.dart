import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';

import '../utils/global.colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerGlobal().criarDrawer(context),
        body: ListView(
          children: [
            ListTile(
              title: Text('Notificações'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text('Idioma'),
              trailing: DropdownButton<String>(
                value: 'Português',
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Português',
                    child: Text('Português'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Inglês',
                    child: Text('Inglês'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Espanhol',
                    child: Text('Espanhol'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Sobre'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {// Navegar para a tela Sobre
                 },
            ),
          ],
        ),
      ),
    );
  }
}
