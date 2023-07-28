import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/produto_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/produto.dart';
import 'package:loja_de_roupas/app/interface/produto_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/BarraNavagacao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/PainelBotoes.dart';
import 'package:loja_de_roupas/app/widgets/botao_adicionar.dart';

class ProdutoLista extends StatefulWidget {
  const ProdutoLista({Key? key}) : super(key: key);

  @override
  State<ProdutoLista> createState() => _ProdutoListaState();
}

class _ProdutoListaState extends State<ProdutoLista> {
  ProdutoInterfaceDAO dao = ProdutoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerWidget().criarDrawer(context),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, '/produto-form')
                .then((value) => buscarfornecedors())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarfornecedors(),
      builder: (context, AsyncSnapshot<List<Produto>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há produtos...');
        List<Produto> listaprodutos = lista.data!;
        return ListView.builder(
          itemCount: listaprodutos.length,
          itemBuilder: (context, indice) {
            var fornecedor = listaprodutos[indice];
            return criarItemLista(context, fornecedor);
          },
        );
      },
    );
  }

  Future<List<Produto>> buscarfornecedors() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Produto produto) {
    return ItemLista(
        produto: produto,
        alterar: () {
          Navigator.pushNamed(context, '/produto-form',
                  arguments: produto)
              .then((value) => buscarfornecedors());
        },
        detalhes: () {
          Navigator.pushNamed(context, '/produto-detalhe',
              arguments: produto);
        },
        excluir: () {
          dao.excluir(produto.id);
          buscarfornecedors();
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
      title: Text('${produto.nome} (${produto.marca.nome})'),
      subtitle: Text(produto.preco),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
