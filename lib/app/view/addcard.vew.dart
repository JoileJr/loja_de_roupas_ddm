import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/cartao.dart';
import 'package:loja_de_roupas/app/view/interface/cartao_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/botao.dart';
import 'package:loja_de_roupas/app/view/widgets/cartao/cartao_CVC.dart';
import 'package:loja_de_roupas/app/view/widgets/cartao/cartao_Nome.dart';
import 'package:loja_de_roupas/app/view/widgets/cartao/cartao_Numero.dart';
import 'package:loja_de_roupas/app/view/widgets/cartao/cartao_dataValidade.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/database/sqlite/dao/cartao_dao_sqlite.dart';

class AddCardView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  AddCardView({Key? key}) : super(key: key);
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
              campoNomeCartao,
              const SizedBox(height: 20),
              campoNumeroCartao,
              const SizedBox(height: 20),
              campoCVC,
              const SizedBox(height: 20),
              campoValidade,
              const SizedBox(height: 20),
              criarBotao(context),
            ],
          )
        )
      ),
    );
  }

  final campoNomeCartao = CartaoNome(controle: TextEditingController());
  final campoNumeroCartao = CartaoNumero(controle: TextEditingController());
  final campoCVC = CartaoCVC(controle: TextEditingController());
  final campoValidade = CartaoValidade(controle: TextEditingController());

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var cartao = preencherDTO();
          CartaoInterfaceDAO dao = cartaoDAOSQLite();
          dao.salvar(cartao);
          Navigator.pop(context);
        }
      },
    );
  }

  Cartao preencherDTO() {
    return Cartao(
      id: id,
      nomeNocartao: campoNomeCartao.controle.text,
      numeroDoCartao: campoNumeroCartao.controle.text,
      cvc: campoCVC.controle.text,
      dataValidade: campoValidade.controle.text
    );
  }

  void preencherCampos(Cartao cartao) {
    campoNomeCartao.controle.text = cartao.nomeNocartao;
    campoNumeroCartao.controle.text = cartao.numeroDoCartao;
    campoCVC.controle.text = cartao.cvc;
    campoValidade.controle.text = cartao.dataValidade;
  }
}