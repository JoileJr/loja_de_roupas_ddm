import 'package:flutter/material.dart';

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Joile Junior'),
                accountEmail: Text('joile@example.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage(
                      'https://miro.medium.com/v2/resize:fit:1400/1*g09N-jl7JtVjVZGcd-vL2g.jpeg'),
                ),
                decoration: BoxDecoration(
                  color: GlobalColors.mainColor, // definindo a cor de fundo
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text('Perfil'),
                onTap: () {
                  Navigator.pushNamed(context, '/perfil');
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Meu carinho'),
                onTap: () {
                  Navigator.pushNamed(context, '/meuCarinho');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text('Favoritos'),
                onTap: () {
                  Navigator.pushNamed(context, '/favoritos');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {
                  Navigator.pushNamed(context, '/configuracoes');
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning),
                title: Text('Sobre'),
                onTap: () {
                  Navigator.pushNamed(context, '/sobre');
                },
              ),
            ],
          ),
        ),
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
