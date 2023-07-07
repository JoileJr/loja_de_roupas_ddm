import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/view/dto/marca.dart';
import 'package:loja_de_roupas/app/view/dto/produto.dart';
import 'package:loja_de_roupas/app/view/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/app/view/interface/produto_interface_dao.dart';
import 'package:loja_de_roupas/app/view/widgets/botao.dart';
import 'package:loja_de_roupas/app/view/widgets/produto/produto_nome.dart';
import 'package:loja_de_roupas/app/view/widgets/produto/produto_preco.dart';
import 'package:loja_de_roupas/app/view/widgets/produto/produto_quantidade.dart';
import 'package:loja_de_roupas/database/sqlite/dao/marca_dao_sqlite.dart';
import 'package:loja_de_roupas/database/sqlite/dao/produto_dao_sqlite.dart';


class CadastrarProdutoView extends StatefulWidget {
  const CadastrarProdutoView({Key? key}) : super(key: key);

  @override
  State<CadastrarProdutoView> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<CadastrarProdutoView> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context) {
    Future<List<Marca>> marcas = marcaDAOSQLite().consultarTodos();
    receberProdutoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: FutureBuilder(
            future: marcas,
            builder: (context, AsyncSnapshot<List<Marca>> lista) {
              if (!lista.hasData || lista.data == null)
                return const Text('Necessário realizar o cadastro de marcas');
              listarMarcas = lista.data!;
              return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      campoNome,
                      campoPreco,
                      campoQuantidade,
                      campoOpcoes = criarCampoOpcoes(listarMarcas),
                      criarBotao(context),
                    ],
                  ));
            }));
  }

  final campoNome = ProdutoNome(controle: TextEditingController());
  final campoPreco = ProdutoPreco(controle: TextEditingController());
  final campoQuantidade = ProdutoQuantidade(controle: TextEditingController());
  late DropdownButton<Marca> campoOpcoes;
  late List<Marca> listarMarcas;
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

  void receberProdutoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Produto produto = parametro.settings.arguments as Produto;
      id = produto.id;
      preencherCampos(produto);
    }
  }

  DropdownButton<Marca> criarCampoOpcoes(List<Marca> marcas) {
    return DropdownButton<Marca>(
        hint: const Text('marcas'),
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
        quantidade: campoQuantidade.controle.text,
        marca: marcaSelecionada);
  }

  void preencherCampos(Produto produto) {
    campoNome.controle.text = produto.nome;
    campoPreco.controle.text = produto.preco;
    campoQuantidade.controle.text = produto.quantidade;
  }
}
