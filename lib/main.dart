import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/view/cidade_form.dart';
import 'package:loja_de_roupas/app/view/fornecedor_detalhe.dart';
import 'package:loja_de_roupas/app/view/fornecedor_form.dart';
import 'package:loja_de_roupas/app/view/fornecedor_lista.dart';

import 'package:loja_de_roupas/app/view/home.view.dart';
import 'package:loja_de_roupas/app/view/marca_form.dart';
import 'package:loja_de_roupas/app/view/marca_lista.dart';
import 'package:loja_de_roupas/app/view/splash.view.dart';
import 'package:loja_de_roupas/app/view/cidade_lista.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => HomeView(),
        '/fornecedor-lista': (context) => FornecedorLista(),
        '/fornecedor-form': (context) => FornecedorForm(),
        '/fornecedor-detalhe': (context) => fornecedorDetalhe(),
        '/cidade-lista': (context) => CidadeLista(),
        '/cidade-form': (context) => CidadeForm(),
        '/marca-form': (context) => MarcaForm(),
        '/marca-lista': (context) => MarcaLista(),
      },
    );
  }
}
