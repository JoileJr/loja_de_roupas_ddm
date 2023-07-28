import 'package:loja_de_roupas/app/database/conexao.dart';
import 'package:loja_de_roupas/app/dto/marca.dart';
import 'package:loja_de_roupas/app/interface/marca_interface_dao.dart';
import 'package:sqflite/sqflite.dart';

class MarcaDAOSQLite implements MarcaInterfaceDAO{
  @override
  Future<Marca> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('marca',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Marca>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Marca> lista = (await db.query('marca')).map<Marca>(converter).toList();
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM marca WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Marca> salvar(Marca marca) async {
    Database db = await  Conexao.criar();
    String sql;
    if(marca.id == null){
      sql = 'INSERT INTO marca (nome) VALUES (?)';
      int id = await db.rawInsert(sql,[marca.nome]);
      marca = Marca(
        id: id,
        nome: marca.nome,);
    }else{
      sql = 'UPDATE marca SET nome = ? WHERE id = ?';
      db.rawUpdate(sql,[marca.nome, marca.id]);
    }
    return marca;
  }

  Marca converter(Map<dynamic,dynamic> resultado){
    return Marca(
      id : resultado['id'],
      nome: resultado['nome'],
    );
  }
}