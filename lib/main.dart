import 'package:flutter/material.dart';
import 'package:loja_de_roupas/view/%20payment.view.dart';
import 'package:loja_de_roupas/view/about.view.dart';
import 'package:loja_de_roupas/view/favorite.view.dart';
import 'package:loja_de_roupas/view/home.view.dart';
import 'package:loja_de_roupas/view/login.view.dart';
import 'package:loja_de_roupas/view/myProducts.view.dart';
import 'package:loja_de_roupas/view/profile.view.dart';
import 'package:loja_de_roupas/view/register.view.dart';
import 'package:loja_de_roupas/view/settings.view.dart';
import 'package:loja_de_roupas/view/splash.view.dart';

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
      },
    );
  }
}
