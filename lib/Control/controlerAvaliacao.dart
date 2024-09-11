import 'package:flutter_application_1/model/BancoDeDados.dart';
import 'package:flutter_application_1/model/Avaliacoes.dart';

class AvaliacaoController {
  final Bancodedados bancodados = Bancodedados();

  Future<int> addComment(Avaliacao avaliar) async {
    final db = await bancodados.database;
    return await db.insert('Avaliacao', avaliar.toMap());
  }

  Future<int> deletarComment(int id) async {
    final db = await bancodados.database;
    return await db.delete('Avaliacao', where: 'idAvaliacao=?', whereArgs: [id]);
  }

  Future<int> editComment(Avaliacao avaliar) async {
    final db = await bancodados.database;
    return await db.update('Avaliacao', avaliar.toMap(), where: 'idAvaliacao=?', whereArgs: [avaliar.idAvaliacao]);
  }

  Future<List<Avaliacao>> getComment() async {
    final db = await bancodados.database;
    final List<Map<String, dynamic>> listadeAvaliacao = await db.query('Avaliacao');
    return List.generate(listadeAvaliacao.length, (int i) {
      return Avaliacao.fromMap(listadeAvaliacao[i]);
    });
  }

  Future<List<Avaliacao>> listarAvaliacao(int idProvider) async {
    final db = await bancodados.database;
    final List<Map<String, dynamic>> lista = await db.query(
      'Avaliacao',
      where: 'idProvider=?',
      whereArgs: [idProvider],
    );

    return lista.map((map) => Avaliacao.fromMap(map)).toList();
  }
}
