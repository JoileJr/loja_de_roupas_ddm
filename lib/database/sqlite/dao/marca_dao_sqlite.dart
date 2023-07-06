import 'package:loja_de_roupas/app/view/dto/marca.dart';
import 'package:loja_de_roupas/app/view/interface/marca_interface_dao.dart';
import 'package:loja_de_roupas/database/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class marcaDAOSQLite implements MarcaInterfaceDAO {
  
  @override
  Future<Marca> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('marca', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado nenhuma marca com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterMarca(resultado);
  }

  @override
  Future<List<Marca>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Marca> lista = (await db.query('marca')).map<Marca>(converterMarca).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM marca WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Marca> salvar(Marca marca) async {
    Database db = await Conexao.criar();
    String sql;
    if (marca.id == null) {
      sql =
          'INSERT INTO marca (nome) VALUES (?)';
      int id = await db.rawInsert(sql,
          [marca.nome]);
      marca = Marca(
          id: id,
          nome: marca.nome,
          );
    } else {
      sql =
          'UPDATE marca SET nome = ? WHERE id = ?';
      db.rawUpdate(sql, [
        marca.nome,
      ]);
    }
    return marca;
  }

  Marca converterMarca(Map<dynamic, dynamic> resultado) {
    return Marca(
        id: resultado['id'],
        nome: resultado['nome']
      );
  }

}


