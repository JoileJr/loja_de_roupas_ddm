import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/cartao.dart';
import 'package:loja_de_roupas/app/view/interface/cartao_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/painel_botoes.dart';
import 'package:loja_de_roupas/database/daofake/cartao_dao_fake.dart';
import 'package:loja_de_roupas/database/sqlite/dao/contato_dao_sqlite.dart';

class ListCardView extends StatelessWidget {
  ListCardView({Key? key}) : super(key: key);
  CartaoInterfaceDAO dao = cartaoDAOSQLite();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerGlobal().criarDrawer(context),
        body: criarLista(context),
      ),
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: dao.consultarTodos(),
      builder: (context, AsyncSnapshot<List<Cartao>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há cartaos...');
        List<Cartao> listaCartoes = lista.data!;
        return ListView.builder(
          itemCount: listaCartoes.length,
          itemBuilder: (context, indice) {
            var cartao = listaCartoes[indice];
            return criarItemLista(context, cartao);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Cartao cartao){
    return ItemLista(
      cartao: cartao, 
      alterar: () {
        Navigator.pushNamed(context, '/adicionarCartao'); 
      },
      detalhes: (){
        Navigator.pushNamed(context, '/listarCartao');
      }, 
      excluir: (){
        dao.excluir(cartao.id);
      } 
    );
  }
  
}

class ItemLista extends StatelessWidget {
  final Cartao cartao;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.cartao,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartao.nomeNocartao),
      subtitle: Text(cartao.numeroDoCartao),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}


