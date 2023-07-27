import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/cidade_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/cidade.dart';
import 'package:loja_de_roupas/app/interface/cidade_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/BarraNavagacao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/PainelBotoes.dart';
import 'package:loja_de_roupas/app/widgets/botao_adicionar.dart';

class CidadeLista extends StatefulWidget {
  const CidadeLista({Key? key}) : super(key: key);

  @override
  State<CidadeLista> createState() => _CidadeListaState();
}

class _CidadeListaState extends State<CidadeLista> {
  CidadeInterfaceDAO dao = CidadeDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(acao: ()=> Navigator.pushNamed(context, '/fornecedor-form').then((value)=>buscarCidades())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarCidades(),
      builder: (context,AsyncSnapshot<List<Cidade>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há Cidades...');
        List<Cidade> listaCidades = lista.data!;
        return ListView.builder(
          itemCount: listaCidades.length,
          itemBuilder: (context, indice) {
            var fornecedor = listaCidades[indice];
            return criarItemLista(context, fornecedor);
          },
        );
      },
    );
  }

  Future<List<Cidade>> buscarCidades(){
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Cidade cidade){
    return ItemLista(
      cidade: cidade, 
      alterar: () {
        Navigator.pushNamed(context, '/cidade-form', arguments: cidade).then((value) => buscarCidades()); 
      },
      detalhes: (){
        Navigator.pushNamed(context, '/cidade-form', arguments: cidade);
      }, 
      excluir: (){
        dao.excluir(cidade.id);
        buscarCidades();
      } 
    );
  }
}

class ItemLista extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.cidade,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      title: Text(cidade.nome),
      subtitle: Text(cidade.estado.nome),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}