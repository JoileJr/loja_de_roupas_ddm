import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/dto/marca.dart';
import 'package:loja_de_roupas/app/view/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/drawer.global.dart';
import 'package:loja_de_roupas/app/view/widgets/painel_botoes.dart';
import 'package:loja_de_roupas/database/sqlite/dao/marca_dao_sqlite.dart';

class ListarMarcaView extends StatelessWidget {
  ListarMarcaView({Key? key}) : super(key: key);
  MarcaInterfaceDAO dao = marcaDAOSQLite();

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
      builder: (context, AsyncSnapshot<List<Marca>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há marcas...');
        List<Marca> listaMarcas = lista.data!;
        return ListView.builder(
          itemCount: listaMarcas.length,
          itemBuilder: (context, indice) {
            var marca = listaMarcas[indice];
            return criarItemLista(context, marca);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Marca marca){
    return ItemLista(
      marca: marca, 
      alterar: () {
        Navigator.pushNamed(context, '/adicionarMarca'); 
      },
      detalhes: (){
        Navigator.pushNamed(context, '/listarMarca');
      }, 
      excluir: (){
        dao.excluir(marca.id);
      } 
    );
  }
  
}

class ItemLista extends StatelessWidget {
  final Marca marca;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.marca,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(marca.nome),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}


