import 'package:path/path.dart';
import 'package:loja_de_roupas/database/sqlite/scriptdb.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  //definindo o camminho do database
      //deleteDatabase(path);                                    //caso queira apagar tudo antes, descomente esta linha
      _database = await openDatabase(                  //chamando o método que que abre o database
        path,                                          // informando o caminho
        version: 1,                                    // versão
        onCreate: (db, v){                             // criando os elementos (tabelas e registros) do BD
          db.execute(criarCartao);
          db.execute(criarMarca);
          insercoesCartao.forEach(db.execute);
          //insercoesMarca.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
}