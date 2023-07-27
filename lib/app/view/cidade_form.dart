import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/cidade_dao_sqlite.dart';
import 'package:loja_de_roupas/app/database/dao/estado_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/cidade.dart';
import 'package:loja_de_roupas/app/dto/estado.dart';
import 'package:loja_de_roupas/app/interface/cidade_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/Botao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/campo_nome.dart';

class CidadeForm extends StatefulWidget{
  const CidadeForm({Key? key}) : super(key: key);

  @override
  State<CidadeForm> createState() => _CidadeFormFormState();
}

class _CidadeFormFormState extends State<CidadeForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context){
    Future<List<Estado>> cidades = EstadoDAOSQLite().consultarTodos();
    receberfornecedorParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: FutureBuilder(
        future: cidades,
        builder: (context,AsyncSnapshot<List<Estado>> lista){
          if(!lista.hasData || lista.data == null) return const Text('Necessário realizar o cadastro de estados');
          listaEstados = lista.data!;
          return Form(
            key: formKey,
            child: Column( 
              children: [
                campoNome,
                campoOpcoes = criarCampoOpcoes(listaEstados),
                criarBotao(context),
              ],
            )
          );
        }
      )
    );
  }

  final campoNome = CampoNome(controle: TextEditingController());
  late DropdownButton<Estado> campoOpcoes;
  late List<Estado> listaEstados;
  late Estado estadoSelecionada;

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var fornecedor = preencherDTO();
          CidadeInterfaceDAO dao = CidadeDAOSQLite(); 
          dao.salvar(fornecedor);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberfornecedorParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Cidade fornecedor = parametro.settings.arguments as Cidade;
      id = fornecedor.id;
      preencherCampos(fornecedor);
    }
  }
  
  DropdownButton<Estado> criarCampoOpcoes(List<Estado> cidades) {
    return DropdownButton<Estado>(
      hint: const Text('estado onde mora'),
      isExpanded: true,
      items: cidades.map(
        (cidade) => DropdownMenuItem(
          value: cidade,
          child: Text(cidade.nome))
      ).toList(),
      onChanged: (value){
        setState(() {
          if(value != null) estadoSelecionada = value;
        });
      }
    );
  }

  Cidade preencherDTO(){
    return Cidade(
      id: id,
      nome: campoNome.controle.text,
      estado: estadoSelecionada
    );
  }

  void preencherCampos(Cidade cidade){
    campoNome.controle.text = cidade.nome;
  }
}