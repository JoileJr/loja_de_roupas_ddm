import 'package:flutter/material.dart';

class DrawerWidget {
   Widget criarDrawer(BuildContext context){
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Cadastrar Fornecedor'),
            onTap: () {
              Navigator.pushNamed(context, '/fornecedor-form');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: const Text('Listar Fornecedor'),
            onTap: () {
              Navigator.pushNamed(context, '/fornecedor-lista');
            },
          ),
        ],
      ),
    );
  }
}