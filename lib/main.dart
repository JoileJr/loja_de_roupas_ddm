import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/view/%20payment.view.dart';
import 'package:loja_de_roupas/app/view/CadastrarMarca.dart';
import 'package:loja_de_roupas/app/view/CadastrarProduto.dart';
import 'package:loja_de_roupas/app/view/ListarMarca.dart';
import 'package:loja_de_roupas/app/view/about.view.dart';
import 'package:loja_de_roupas/app/view/addcard.vew.dart';
import 'package:loja_de_roupas/app/view/favorite.view.dart';
import 'package:loja_de_roupas/app/view/home.view.dart';
import 'package:loja_de_roupas/app/view/listcard.view.dart';
import 'package:loja_de_roupas/app/view/login.view.dart';
import 'package:loja_de_roupas/app/view/myProducts.view.dart';
import 'package:loja_de_roupas/app/view/profile.view.dart';
import 'package:loja_de_roupas/app/view/register.view.dart';
import 'package:loja_de_roupas/app/view/settings.view.dart';
import 'package:loja_de_roupas/app/view/splash.view.dart';

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
        '/login': (context) => LoginView(),
        '/cadastro': (context) => RegisterView(),
        '/home':(context) => HomeView(),
        '/configuracoes':(context) => SettingsView(),
        '/sobre': (context) => AboutView(),
        '/perfil': (context) => ProfileView(),
        '/meuCarinho': (context) =>  MyProductsView(),
        '/favoritos':(context) => FavoriteView(),
        '/pagamento':(context) => PaymentView(),
        '/adicionarCartao':(context) => AddCardView(),
        '/listarCartao': (context) => ListCardView(),
        '/adicionarMarca':(context) => CadastrarMarcaView(),
        '/listarMarca': (context) => ListarMarcaView(),
        '/cadastrarProduto': (context) => CadastrarProdutoView()
      },
    );
  }
}
