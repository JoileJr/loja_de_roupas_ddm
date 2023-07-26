import 'package:loja_de_roupas/app/database/conexao.dart';
import 'package:loja_de_roupas/app/database/dao/cidade_dao_sqlite.dart';
import 'package:loja_de_roupas/app/dto/cidade.dart';
import 'package:loja_de_roupas/app/dto/fornecedor.dart';
import 'package:loja_de_roupas/app/interface/fornecedor_interface_dao.dart';
import 'package:sqflite/sqflite.dart';

class FornecedorDAOSQLite implements FornecedorInterfaceDAO{
  @override
  Future<Fornecedor> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('Fornecedor',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Fornecedor>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('fornecedor');
    List<Fornecedor> lista = [];
    for(var registro in resultadoBD){
      var fornecedor = await converter(registro);
      lista.add(fornecedor);
    }
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM fornecedor WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Fornecedor> salvar(Fornecedor fornecedor) async {
    print('>>>>>${fornecedor.cidade.id}');
    Database db = await  Conexao.criar();
    String sql;
    if(fornecedor.id == null){
      sql = 'INSERT INTO fornecedor (nome, telefone,email,url_avatar,cidade_id) VALUES (?,?,?,?,?)';
      int id = await db.rawInsert(sql,[fornecedor.nome,fornecedor.telefone,fornecedor.email,fornecedor.urlAvatar,fornecedor.cidade.id]);
      fornecedor = Fornecedor(
        id: id,
        nome: fornecedor.nome, 
        telefone: fornecedor.telefone, 
        email: fornecedor.email, 
        urlAvatar: fornecedor.urlAvatar,
        cidade: fornecedor.cidade);
    }else{
      sql = 'UPDATE fornecedor SET nome = ?, telefone =?, email = ?, url_avatar= ?, cidade_id= ? WHERE id = ?';
      db.rawUpdate(sql,[fornecedor.nome, fornecedor.telefone, fornecedor.email, fornecedor.urlAvatar, fornecedor.cidade.id, fornecedor.id]);
    }
    return fornecedor;
  }

  Future<Fornecedor> converter(Map<dynamic,dynamic> resultado) async{
    Cidade cidade = await CidadeDAOSQLite().consultar(resultado['cidade_id']);
    return Fornecedor(
      id : resultado['id'],
      nome: resultado['nome'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar'],
      cidade: cidade
    );
  }
}