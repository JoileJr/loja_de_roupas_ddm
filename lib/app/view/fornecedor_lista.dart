import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/fornecedor_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/fornecedor.dart';
import 'package:loja_de_roupas/app/interface/fornecedor_interface_dao.dart';
import 'package:loja_de_roupas/app/widgets/BarraNavagacao.dart';
import 'package:loja_de_roupas/app/widgets/PainelBotoes.dart';
import 'package:loja_de_roupas/app/widgets/botao_adicionar.dart';
import 'package:loja_de_roupas/app/widgets/foto_fornecedor.dart';

class FornecedorLista extends StatefulWidget {
  const FornecedorLista({Key? key}) : super(key: key);

  @override
  State<FornecedorLista> createState() => _FornecedorListaState();
}

class _FornecedorListaState extends State<FornecedorLista> {
  FornecedorInterfaceDAO dao = FornecedorDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista fornecedors')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(acao: ()=> Navigator.pushNamed(context, '/fornecedor-form').then((value)=>buscarfornecedors())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarfornecedors(),
      builder: (context,AsyncSnapshot<List<Fornecedor>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há fornecedors...');
        List<Fornecedor> listafornecedors = lista.data!;
        return ListView.builder(
          itemCount: listafornecedors.length,
          itemBuilder: (context, indice) {
            var fornecedor = listafornecedors[indice];
            return criarItemLista(context, fornecedor);
          },
        );
      },
    );
  }

  Future<List<Fornecedor>> buscarfornecedors(){
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Fornecedor fornecedor){
    return ItemLista(
      fornecedor: fornecedor, 
      alterar: () {
        Navigator.pushNamed(context, '/fornecedor-form', arguments: fornecedor).then((value) => buscarfornecedors()); 
      },
      detalhes: (){
        Navigator.pushNamed(context, '/fornecedor-detalhe', arguments: fornecedor);
      }, 
      excluir: (){
        dao.excluir(fornecedor.id);
        buscarfornecedors();
      } 
    );
  }
}

class ItemLista extends StatelessWidget {
  final Fornecedor fornecedor;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.fornecedor,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      leading: FotoFornecedor(fornecedor: fornecedor),
      title: Text('${fornecedor.nome} (${fornecedor.cidade.nome})'),
      subtitle: Text(fornecedor.telefone),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}