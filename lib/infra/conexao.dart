
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'interface/iconexao.dart';
import 'script.dart';


class Conexao implements IConexao {
  static Database? _db;

  Future<Database> abrirConexao() async {
    if (_db == null) {
      String caminho = join(await getDatabasesPath(), 'banco.db');
      deleteDatabase(caminho);
      _db = await openDatabase(
        caminho,
        version: 1,
        onCreate: (db, version) {
          for (var comando in criarBanco) {
            db.execute(comando);
          }
        },
      );
    }
    return _db!;
  }
}
