import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1555685815-ecb20c18aada'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joile Junior',
                        style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'joile@example.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Endereço'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            const ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Métodos de pagamento'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
             const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificações'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Ajuda'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sair'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
