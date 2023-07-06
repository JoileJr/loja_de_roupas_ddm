import 'package:loja_de_roupas/app/view/dto/cartao.dart';
import 'package:loja_de_roupas/app/view/interface/cartao_interface_dao.dart';
import 'package:loja_de_roupas/database/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class cartaoDAOSQLite implements CartaoInterfaceDAO {
   @override
  Future<Cartao> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('cartao', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado nenhum cartão com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterCartao(resultado);
  }

  @override
  Future<List<Cartao>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Cartao> lista = (await db.query('cartao')).map<Cartao>(converterCartao).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM cartao WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Cartao> salvar(Cartao cartao) async {
    Database db = await Conexao.criar();
    String sql;
    if (cartao.id == null) {
      sql =
          'INSERT INTO cartao (nomeNocartao, numeroDoCartao, cvc, dataValidade) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql,
          [cartao.nomeNocartao, cartao.nomeNocartao, cartao.cvc, cartao.dataValidade]);
      cartao = Cartao(
          id: id,
          nomeNocartao: cartao.nomeNocartao,
          numeroDoCartao: cartao.numeroDoCartao,
          cvc: cartao.cvc,
          dataValidade: cartao.dataValidade);
    } else {
      sql =
          'UPDATE cartao SET nomeNocartao = ?, numeroDoCartao =?, cvc = ?, dataValidade= ? WHERE id = ?';
      db.rawUpdate(sql, [
        cartao.nomeNocartao,
        cartao.numeroDoCartao,
        cartao.cvc,
        cartao.dataValidade,
        cartao.id
      ]);
    }
    return cartao;
  }

  Cartao converterCartao(Map<dynamic, dynamic> resultado) {
    return Cartao(
        id: resultado['id'],
        nomeNocartao: resultado['nomeNocartao'],
        numeroDoCartao: resultado['numeroDoCartao'],
        cvc: resultado['cvc'],
        dataValidade: resultado['dataValidade']);
  }

}


