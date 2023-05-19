import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/utils/global.colors.dart';
import 'package:loja_de_roupas/app/view/widgets/text.form.global.dart';

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
                
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: GlobalColors.mainColor // Background color
                            ),
                        child: Text(
                          ' Entrar ',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),            
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                    'Não tem conta ? '
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: GlobalColors.mainColor // Background color
                        ),
                        child: Text(
                          ' Cadastre-se',
                          style: TextStyle(
                            color: Colors.white                        
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },

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
