import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/dto/fornecedor.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/foto_fornecedor.dart';

class fornecedorDetalhe extends StatelessWidget {
  const fornecedorDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fornecedor fornecedor = receberfornecedor(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: ListView( 
        padding: const EdgeInsets.all(60),
        children: [
          FotoFornecedor(fornecedor: fornecedor, raio: 150),
          nome(fornecedor),
          telefone(fornecedor),
          email(fornecedor),
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Fornecedor receberfornecedor(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null){
      Fornecedor fornecedor = parametro.settings.arguments as Fornecedor;
      return fornecedor;
    } else {
      throw Exception('Problemas em receber o fornecedor');
    }
  }

  Widget nome(Fornecedor fornecedor){
    return Center( 
      child: Text(
        fornecedor.nome, 
        style: const TextStyle(fontSize: 30)
      )
    );
  }

  Widget telefone(Fornecedor fornecedor){
    return Card( 
      child: ListTile(  
        title: const Text('Telefone:'),
        subtitle: Text(fornecedor.telefone),
        trailing: painelTelefone(fornecedor),
      ),
    );
  }

  Widget email(Fornecedor fornecedor){
    return Card(  
      child: ListTile( 
        title: const Text('E-mail:'),
        onTap: (){},
        subtitle: Text(fornecedor.email),
      ),
    );
  }

  Widget painelTelefone(Fornecedor fornecedor){
    return SizedBox(  
      width: 100,
      child:  Row(  
        children: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.message)
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.phone)
          )
        ],
      ),
    );
  }
  Widget botaoVoltar(BuildContext context){
    return FloatingActionButton( 
      child: const Icon(Icons.arrow_back),
      backgroundColor: GlobalColors.mainColor,
      onPressed: ()=>Navigator.pop(context),
    );
  }
}