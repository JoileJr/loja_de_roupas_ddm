import 'package:flutter/material.dart';
import 'package:loja_de_roupas/utils/global.colors.dart';
import 'package:loja_de_roupas/view/widgets/button.global.dart';
import 'package:loja_de_roupas/view/widgets/text.form.global.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Loja de roupas',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height:100),
                Text(
                  'Faça o login em sua conta',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                /// Email input
                TextFormGlobal(
                  controller: emailController, 
                  text: 'Email', obscure: false, 
                  textInputType: TextInputType.emailAddress
                ),
                const SizedBox(height: 20),
                /// Senha input
                TextFormGlobal(
                  controller: passwordController, 
                  text: 'Senha', obscure: true, 
                  textInputType: TextInputType.text
                ),
                const SizedBox(height: 20),
                const ButtonGlobal(),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                    'Não tem conta ?'
                      ),
                      InkWell(
                        child: Text(
                          ' Cadastre-se',
                          style: TextStyle(
                            color: GlobalColors.mainColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
