import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/marca_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/marca.dart';
import 'package:loja_de_roupas/app/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/BarraNavagacao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/botao_adicionar.dart';

import '../widgets/PainelBotoes.dart';

class MarcaLista extends StatefulWidget {
  const MarcaLista({Key? key}) : super(key: key);

  @override
  State<MarcaLista> createState() => _MarcaListaState();
}

class _MarcaListaState extends State<MarcaLista> {
  MarcaInterfaceDAO dao = MarcaDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(acao: ()=> Navigator.pushNamed(context, '/marca-form').then((value)=>buscarMarcas())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarMarcas(),
      builder: (context,AsyncSnapshot<List<Marca>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há Marcas...');
        List<Marca> listaMarcas = lista.data!;
        return ListView.builder(
          itemCount: listaMarcas.length,
          itemBuilder: (context, indice) {
            var fornecedor = listaMarcas[indice];
            return criarItemLista(context, fornecedor);
          },
        );
      },
    );
  }

  Future<List<Marca>> buscarMarcas(){
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Marca marca){
    return ItemLista(
      marca: marca, 
      alterar: () {
        Navigator.pushNamed(context, '/marca-form', arguments: marca).then((value) => buscarMarcas()); 
      },
      detalhes: (){
        Navigator.pushNamed(context, '/marca-form', arguments: marca);
      }, 
      excluir: (){
        dao.excluir(marca.id);
        buscarMarcas();
      } 
    );
  }
}

class ItemLista extends StatelessWidget {
  final Marca marca;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.marca,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      title: Text(marca.nome),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}