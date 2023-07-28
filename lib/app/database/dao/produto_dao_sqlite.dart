import 'package:loja_de_roupas/app/database/conexao.dart';
import 'package:loja_de_roupas/app/database/dao/marca_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/marca.dart';
import 'package:loja_de_roupas/app/dto/produto.dart';
import 'package:loja_de_roupas/app/interface/produto_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ProdutoDAOSQLite implements ProdutoInterfaceDAO {
  @override
  Future<Produto> consultar(int id) async {
    Database db = await Conexao.criar();
    Map resultado =
        (await db.query('produto', where: 'id = ?', whereArgs: [id])).first;
    if (resultado.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Produto>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic, dynamic>> resultadoBD = await db.query('produto');
    List<Produto> lista = [];
    for (var registro in resultadoBD) {
      var produto = await converter(registro);
      lista.add(produto);
    }
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM produto WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Produto> salvar(Produto produto) async {
    print('>>>>>${produto.marca.id}');
    Database db = await Conexao.criar();
    String sql;
    if (produto.id == null) {
      sql =
          'INSERT INTO produto (nome, preco, marca_id) VALUES (?,?,?)';
      int id = await db.rawInsert(sql, [
        produto.nome,
        produto.preco,
        produto.marca.id
      ]);
      produto = Produto(
          id: id,
          nome: produto.nome,
          preco: produto.preco,
          marca: produto.marca);
    } else {
      sql =
          'UPDATE produto SET nome = ?, preco =?, marca_id= ? WHERE id = ?';
      db.rawUpdate(sql, [
        produto.nome,
        produto.preco,
        produto.marca.id,
        produto.id
      ]);
    }
    return produto;
  }

  Future<Produto> converter(Map<dynamic, dynamic> resultado) async {
    Marca marca = await MarcaDAOSQLite().consultar(resultado['marca_id']);
    return Produto(
      id: resultado['id'],
      nome: resultado['nome'],
      preco: resultado['preco'],
      marca: marca
    );
  }
}
