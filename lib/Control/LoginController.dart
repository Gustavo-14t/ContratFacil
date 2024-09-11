//import 'package:flutter/services.dart.dart';
import 'package:flutter_application_1/model/BancodeDados.dart';
import 'package:flutter_application_1/model/usuario.dart';

class Logincontroler {
  //chamando o banco de dados
  final Bancodedados _bancodedados = Bancodedados();

  //metodo de autenticaçao login com e-mail e senha
  Future<Usuario?> loginwithEmailPassword(String email, String senha) async {
    final db = await _bancodedados.database;

    //listar os usuarios cadastrados no banco de dados
    // Usuario e o nome da tabela de banco de dados
    final List<Map<String, dynamic>> lista = await db.query(
      'Usuario',
      where: 'email =? AND password=?',
      whereArgs: [email, senha],
    ); //final da verficaçao de email e senha no banco de dados
    if (lista.isNotEmpty) {
      return Usuario.fromMap(lista.first);
      //se lista nao for nula, retorne os dados do usuario
    } else {
      return null;
      //se a lista for nula, retorne null.
    }
  } //fim do metodo de autenticaçao com emal e senha
}
