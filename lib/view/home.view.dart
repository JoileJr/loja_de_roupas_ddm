import 'package:flutter/material.dart';
import 'package:loja_de_roupas/utils/global.colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

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
                accountName: Text('Joile junior'),
                accountEmail: Text('joile@example.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('https://miro.medium.com/v2/resize:fit:1400/1*g09N-jl7JtVjVZGcd-vL2g.jpeg'),
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
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  'https://static.netshoes.com.br/produtos/calca-sarja-terminal-skinny-masculina/06/MCM-0037-006/MCM-0037-006_zoom1.jpg?ts=1671728755&ims=544x',
                  height: 250,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calça de sarja',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'R\$ 99,99',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Image.network(
                    'https://static.netshoes.com.br/produtos/camiseta-colcci-logo-feminina/10/NFN-7286-010/NFN-7286-010_zoom1.jpg?ts=1678119927&ims=544x',
                    height: 250,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Blusinha',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'R\$ 99,99',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )
      ),
    );
  }
}
