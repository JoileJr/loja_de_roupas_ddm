import 'package:flutter/material.dart';
import 'package:loja_de_roupas/app/dto/fornecedor.dart';

class FotoFornecedor extends StatelessWidget {
  final Fornecedor fornecedor;
  final double? raio;
  const FotoFornecedor({required this.fornecedor,this.raio,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = fornecedor.urlAvatar;
    if (Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: raio,
      );
    }else{
      return const CircleAvatar(child: Icon(Icons.person));
    }  
  }
}