import 'package:loja_de_roupas/app/view/dto/cartao.dart';
import 'package:loja_de_roupas/app/view/interface/cartao_interface_dao.dart';
import 'package:loja_de_roupas/database/daofake/dadosfake.dart';

class CartaoDAOFake implements CartaoInterfaceDAO {
  @override
  Future<Cartao> consultar(int id) {
    return Future.value(cartoes[id - 1]);
  }

  @override
  Future<List<Cartao>> consultarTodos() {
    return Future.value(cartoes);
  }

  @override
  Future<bool> excluir(dynamic id) {
    print('excluir ${cartoes[id - 1]}');
    cartoes.remove(cartoes[id - 1]);
    return Future.value();
  }

  @override
  Future<Cartao> salvar(Cartao cartao) {
    if (cartao.id == null) {
      cartao = Cartao(
        id: cartoes.length,
        nomeNocartao: cartao.nomeNocartao,
        numeroDoCartao: cartao.numeroDoCartao,
        cvc: cartao.cvc,
        dataValidade: cartao.dataValidade
      );
      cartoes.add(cartao);
    } else {
      int i = (cartao.id as int) - 1;
      cartoes[i] = cartao;
    }
    print(cartao);
    return Future.value(cartao);
  }
}