import 'package:flutter/material.dart';

import '../../utils/global.colors.dart';

class DrawerGlobal {

  Widget criarDrawer(BuildContext context){
    return Drawer(
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
              onTap: ()=> Navigator.pushNamed(context, 'perfil'),
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
      );
  }
}