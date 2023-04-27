import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LOJA DE ROUPAS'),
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Favoritos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                'https://static.netshoes.com.br/produtos/camiseta-colcci-logo-feminina/10/NFN-7286-010/NFN-7286-010_zoom1.jpg?ts=1678119927&ims=544x',
                width: 100,
                height: 100,
                fit: BoxFit.cover,),
              title: Text('Blusa feminina'),
              subtitle: Text('R\$ 49,99'),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remover da lista de favoritos
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                'https://static.netshoes.com.br/produtos/calca-sarja-terminal-skinny-masculina/06/MCM-0037-006/MCM-0037-006_zoom1.jpg?ts=1671728755&ims=544x',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text('Calça masculina'),
              subtitle: Text('R\$ 89,99'),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remover da lista de favoritos
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
