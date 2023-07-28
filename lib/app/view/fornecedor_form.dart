import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/cidade_dao_sqlite.dart';
import 'package:loja_de_roupas/app/database/dao/fornecedor_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/cidade.dart';
import 'package:loja_de_roupas/app/dto/fornecedor.dart';
import 'package:loja_de_roupas/app/interface/fornecedor_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/Botao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/campo_email.dart';
import 'package:loja_de_roupas/app/widgets/campo_nome.dart';
import 'package:loja_de_roupas/app/widgets/campo_telefone.dart';
import 'package:loja_de_roupas/app/widgets/campo_url.dart';

class FornecedorForm extends StatefulWidget{
  const FornecedorForm({Key? key}) : super(key: key);

  @override
  State<FornecedorForm> createState() => _FornecedorFormState();
}

class _FornecedorFormState extends State<FornecedorForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context){
    Future<List<Cidade>> cidades = CidadeDAOSQLite().consultarTodos();
    receberfornecedorParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: FutureBuilder(
        future: cidades,
        builder: (context,AsyncSnapshot<List<Cidade>> lista){
          if(!lista.hasData || lista.data == null) return const Text('Necessário realizar o cadastro de cidade');
          listaCidades = lista.data!;
          return Form(
            key: formKey,
            child: Column( 
              children: [
                campoNome,
                campoTelefone,
                campoEmail,
                campoURL,
                campoOpcoes = criarCampoOpcoes(listaCidades),
                criarBotao(context),
              ],
            )
          );
        }
      )
    );
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoURL = CampoURL(controle: TextEditingController());
  late DropdownButton<Cidade> campoOpcoes;
  late List<Cidade> listaCidades;
  late Cidade cidadeSelecionada;

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var  fornecedor = preencherDTO();
          FornecedorInterfaceDAO dao = FornecedorDAOSQLite(); 
          dao.salvar(fornecedor);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberfornecedorParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Fornecedor fornecedor = parametro.settings.arguments as Fornecedor;
      id = fornecedor.id;
      preencherCampos(fornecedor);
    }
  }
  
  DropdownButton<Cidade> criarCampoOpcoes(List<Cidade> cidades) {
    return DropdownButton<Cidade>(
      hint: const Text('cidade onde mora'),
      isExpanded: true,
      items: cidades.map(
        (cidade) => DropdownMenuItem(
          value: cidade,
          child: Text(cidade.nome))
      ).toList(),
      onChanged: (value){
        setState(() {
          if(value != null) cidadeSelecionada = value;
        });
      }
    );
  }

  Fornecedor preencherDTO(){
    return Fornecedor(
      id: id,
      nome: campoNome.controle.text,
      email: campoEmail.controle.text,
      telefone: campoTelefone.controle.text,
      urlAvatar: campoURL.controle.text,
      cidade: cidadeSelecionada
    );
  }

  void preencherCampos(Fornecedor fornecedor){
    campoNome.controle.text = fornecedor.nome;
    campoEmail.controle.text = fornecedor.email;
    campoTelefone.controle.text = fornecedor.telefone;
    campoURL.controle.text = fornecedor.urlAvatar;
  }
}