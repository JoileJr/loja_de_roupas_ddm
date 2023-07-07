import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/produto.dart';
import 'package:loja_de_roupas/app/view/interface/produto_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/barra_navagacao.dart';
import 'package:loja_de_roupas/app/view/widgets/botao_adicionar.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/painel_botoes.dart';
import 'package:loja_de_roupas/database/sqlite/dao/produto_dao_sqlite.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  ProdutoInterfaceDAO dao = ProdutoDAOSQLite();

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
      builder: (context, AsyncSnapshot<List<Produto>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há produtos...');
        List<Produto> listaProdutos = lista.data!;
        return ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context, indice) {
            var produto = listaProdutos[indice];
            return criarItemLista(context, produto);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Produto produto) {
    return ItemLista(
        produto: produto,
        alterar: () {
          Navigator.pushNamed(context, '/adicionarCartao');
        },
        detalhes: () {
          Navigator.pushNamed(context, '/listarCartao');
        },
        excluir: () {
          dao.excluir(produto.id);
        });
  }
}

class ItemLista extends StatelessWidget {
  final Produto produto;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.produto,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${produto.nome}  ${produto.marca}'),
      subtitle: Text(produto.preco),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}

