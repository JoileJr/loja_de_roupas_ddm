import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/marca.dart';
import 'package:loja_de_roupas/app/view/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/botao.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/marca/marca_nome.dart';
import 'package:loja_de_roupas/database/sqlite/dao/marca_dao_sqlite.dart';


class CadastrarMarcaView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  CadastrarMarcaView({Key? key}) : super(key: key);
  dynamic id;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerGlobal().criarDrawer(context),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              campoMarcaNome,
              const SizedBox(height: 20),
              criarBotao(context),
            ],
          )
        )
      ),
    );
  }

  final campoMarcaNome = MarcaNome(controle: TextEditingController());

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var marca = preencherDTO();
          MarcaInterfaceDAO dao = marcaDAOSQLite();
          dao.salvar(marca);
          Navigator.pop(context);
        }
      },
    );
  }

  Marca preencherDTO() {
    return Marca(
      id: id,
      nome: campoMarcaNome.controle.text,
    );
  }

  void preencherCampos(Marca marca) {
    campoMarcaNome.controle.text = marca.nome;
  }
}