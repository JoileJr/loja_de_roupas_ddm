import 'package:flutter/material.dart';
import 'package:loja_de_roupas/utils/global.colors.dart';
import 'package:loja_de_roupas/view/widgets/text.form.global.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key? key}) : super(key: key);
  final TextEditingController cartaoController = TextEditingController();
  final TextEditingController nomecartaoController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController dataVencimentoController = TextEditingController();

  @override
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Loja de roupas',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Text(
              'Coloque os dados do seu cartão',
              style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            /// Numero do cartão
            TextFormGlobal(
                controller: cartaoController,
                text: 'Numero Cartão',
                obscure: false,
                textInputType: TextInputType.number),
            const SizedBox(height: 20),
            /// Nome mo cartãp
            TextFormGlobal(
                controller: nomecartaoController,
                text: 'Nome no cartão',
                obscure: false,
                textInputType: TextInputType.text),
            const SizedBox(height: 20),
            TextFormGlobal(
                controller: cvcController,
                text: 'CVC',
                obscure: false,
                textInputType: TextInputType.number),
            const SizedBox(height: 20),
            TextFormGlobal(
                controller: dataVencimentoController,
                text: 'Data vencimento',
                obscure: false,
                textInputType: TextInputType.datetime),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Formas de pagamento'),
              trailing: DropdownButton<String>(
                value: 'Cartão',
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Cartão',
                    child: Text('Cartão'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Pix',
                    child: Text('Pix'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Boleto',
                    child: Text('Boleto'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: GlobalColors.mainColor // Background color
                        ),
                    child: const Text(
                      ' Realizar pagamento ',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),        
      ),
    );
  }
}