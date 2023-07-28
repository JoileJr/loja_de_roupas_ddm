import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/database/dao/marca_dao_sqlite.dart';
import 'package:loja_de_roupas/app/database/dao/produto_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/marca.dart';
import 'package:loja_de_roupas/app/dto/produto.dart';
import 'package:loja_de_roupas/app/interface/produto_interface_dao.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/widgets/Botao.dart';
import 'package:loja_de_roupas/app/widgets/Drawer.dart';
import 'package:loja_de_roupas/app/widgets/campo_nome.dart';
import 'package:loja_de_roupas/app/widgets/campo_preco.dart';

class ProdutoForm extends StatefulWidget {
  const ProdutoForm({Key? key}) : super(key: key);

  @override
  State<ProdutoForm> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context) {
    Future<List<Marca>> marcas = MarcaDAOSQLite().consultarTodos();
    receberprodutoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOJA DE ROUPAS'),
          backgroundColor: GlobalColors.mainColor,
        ),
        drawer: DrawerWidget().criarDrawer(context),
        body: FutureBuilder(
            future: marcas,
            builder: (context, AsyncSnapshot<List<Marca>> lista) {
              if (!lista.hasData || lista.data == null)
                return const Text('Necessário realizar o cadastro de marcas');
              listaMarcas = lista.data!;
              return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      campoNome,
                      campoPreco,
                      campoOpcoes = criarCampoOpcoes(listaMarcas),
                      criarBotao(context),
                    ],
                  ));
            }));
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoPreco= CampoPreco(controle: TextEditingController());
  late DropdownButton<Marca> campoOpcoes;
  late List<Marca> listaMarcas;
  late Marca marcaSelecionada;

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var produto = preencherDTO();
          ProdutoInterfaceDAO dao = ProdutoDAOSQLite();
          dao.salvar(produto);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberprodutoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Produto produto = parametro.settings.arguments as Produto;
      id = produto.id;
      preencherCampos(produto);
    }
  }

  DropdownButton<Marca> criarCampoOpcoes(List<Marca> marcas) {
    return DropdownButton<Marca>(
        hint: const Text('marca do produto'),
        isExpanded: true,
        items: marcas
            .map((marca) =>
                DropdownMenuItem(value: marca, child: Text(marca.nome)))
            .toList(),
        onChanged: (value) {
          setState(() {
            if (value != null) marcaSelecionada = value;
          });
        });
  }

  Produto preencherDTO() {
    return Produto(
        id: id,
        nome: campoNome.controle.text,
        preco: campoPreco.controle.text,
        marca: marcaSelecionada);
  }

  void preencherCampos(Produto produto) {
    campoNome.controle.text = produto.nome;
    campoPreco.controle.text = produto.preco;
  }
}
