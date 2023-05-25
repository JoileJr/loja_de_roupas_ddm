
import 'package:loja_de_roupas/app/view/dto/cartao.dart';
import 'package:loja_de_roupas/app/view/dto/produto.dart';

List<Produto> produto = [
  Produto(
    id: 1,
    nome: 'Calça Jeans',
    descricao: 'Lorem ipsum',
    preco: '50.0'
  ),
  Produto(
    id: 2,
    nome: 'Jaqueta Jeans',
    descricao: 'Lorem ipsum',
    preco: '50.0'
  ),
  Produto(
    id: 3,
    nome: 'Short Jeans',
    descricao: 'Lorem ipsum',
    preco: '50.0'
  ),
  Produto(
    id: 4,
    nome: 'jaqueta de couro',
    descricao: 'Lorem ipsum',
    preco: '50.0'
  ),
];

List<Cartao> cartoes = [
  Cartao(
    id: 1, 
    nomeNocartao: 'Joile O A Junior', 
    numeroDoCartao: '1111 1111 1111 1111', 
    cvc: '101',
    dataValidade: '01/27'
  ),
];
