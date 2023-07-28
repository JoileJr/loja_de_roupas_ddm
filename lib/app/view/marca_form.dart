import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/marca_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/marca.dart';
import 'package:loja_de_roupas/app/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/Botao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/campo_nome.dart';

class MarcaForm extends StatefulWidget{
  const MarcaForm({Key? key}) : super(key: key);

  @override
  State<MarcaForm> createState() => _MarcaFormFormState();
}

class _MarcaFormFormState extends State<MarcaForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context){
    receberfornecedorParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOJA DE ROUPAS'),
        backgroundColor: GlobalColors.mainColor,
      ),
      drawer: DrawerWidget().criarDrawer(context),
      body: Form(
        key: formKey,
        child: Column( 
        children: [
          campoNome,
          criarBotao(context),
          ],
        )
      )
    );
  }

  final campoNome = CampoNome(controle: TextEditingController());

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var marca = preencherDTO();
          MarcaInterfaceDAO dao = MarcaDAOSQLite(); 
          dao.salvar(marca);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberfornecedorParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Marca marca = parametro.settings.arguments as Marca;
      id = marca.id;
      preencherCampos(marca);
    }
  }

  Marca preencherDTO(){
    return Marca(
      id: id,
      nome: campoNome.controle.text,
    );
  }

  void preencherCampos(Marca marca){
    campoNome.controle.text = marca.nome;
  }
}