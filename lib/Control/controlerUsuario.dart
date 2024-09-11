import 'package:flutter_application_1/model/BancoDeDados.dart';
import 'package:flutter_application_1/model/usuario.dart';

class UserController {
  final Bancodedados bancodados = Bancodedados();

  Future<int> addUsuario(Usuario user) async {
    final db = await bancodados.database;
    return await db.insert('Usuario', user.toMap());
  }

  Future<int> deletarUsuario(int id) async {
    final db = await bancodados.database;
    return await db.delete('Usuario', where: 'idUser = ?', whereArgs: [id]);
  }

  Future<int> editUsuario(Usuario user) async {
    final db = await bancodados.database;
    return await db.update(
      'Usuario',
      user.toMap(),
      where: 'idUser = ?',
      whereArgs: [user.idUser],
    );
  }

  Future<List<Usuario>> getUsuario() async {
  final db = await bancodados.database;
  final List<Map<String, dynamic>> listadeUsuario = await db.query('Usuario');
  return List.generate(listadeUsuario.length, (int i) {
    return Usuario.fromMap(listadeUsuario[i]);
  });
}

}
