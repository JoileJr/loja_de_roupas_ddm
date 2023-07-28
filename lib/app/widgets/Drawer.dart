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
          ListTile(
            leading: Icon(Icons.add_location),
            title: const Text('Cadastrar cidade'),
            onTap: () {
              Navigator.pushNamed(context, '/cidade-form');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: const Text('Lista de cidades'),
            onTap: () {
              Navigator.pushNamed(context, '/cidade-lista');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_card),
            title: const Text('Cadastrar marcas'),
            onTap: () {
              Navigator.pushNamed(context, '/marca-form');
            },
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: const Text('Lista de marcas'),
            onTap: () {
              Navigator.pushNamed(context, '/marca-lista');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: const Text('Cadastro de produto'),
            onTap: () {
              Navigator.pushNamed(context, '/produto-form');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: const Text('Lista de produto'),
            onTap: () {
              Navigator.pushNamed(context, '/produto-lista');
            },
          ),
        ],
      ),
    );
  }
}