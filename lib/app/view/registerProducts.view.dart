import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/produto.dart';
import 'package:loja_de_roupas/app/view/widgets/botao.dart';
import 'package:loja_de_roupas/app/view/widgets/description_input.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/name_input.dart';
import 'package:loja_de_roupas/app/view/widgets/price_input.dart';
import 'package:loja_de_roupas/database/daofake/produtos_dao_fake.dart';

import 'interface/produto_interface_dao.dart';

class RegisterProductView extends StatelessWidget {
  RegisterProductView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  dynamic id;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerGlobal().criarDrawer(context),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              campoNome,
              campoDescricao,
              campoPreco,
              criarBotao(context),
            ],
          )
        )
      ),
    );
  }

  final campoNome = NameInput(controle: TextEditingController());
  final campoDescricao = DescriptionInput(controle: TextEditingController());
  final campoPreco = PriceInput(controle: TextEditingController());

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var produto = preencherDTO();
          ProdutoInterfaceDAO dao = ProdutoDAOFake();
          dao.salvar(produto);
          Navigator.pop(context);
        }
      },
    );
  }

  Produto preencherDTO() {
    return Produto(
      id: id,
      nome: campoNome.controle.text,
      descricao: campoDescricao.controle.text,
      preco: campoPreco.controle.text,
    );
  }

  void preencherCampos(Produto produto) {
    campoNome.controle.text = produto.nome;
    campoDescricao.controle.text = produto.descricao;
    campoPreco.controle.text = produto.preco;
  }
}
