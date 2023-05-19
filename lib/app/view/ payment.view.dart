import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/text.form.global.dart';

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
        drawer: DrawerGlobal().criarDrawer(context),
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