import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';  // Para inicialização FFI
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';  // Para manipulação de caminhos

class Bancodedados {
  static final Bancodedados _instancia = Bancodedados._internal();

  factory Bancodedados() => _instancia;

  Bancodedados._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Inicializa a FFI para SQLite no desktop (Windows, MacOS, Linux)
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();  // Inicializa a biblioteca sqflite_common_ffi
      databaseFactory = databaseFactoryFfi;  // Define a fábrica de banco de dados para FFI
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'Register.database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade, // Se precisar de atualizações no futuro
    );
  }

  Future _onCreate(Database db, int version) async {
    // Criação da tabela Usuario
    await db.execute('''
      CREATE TABLE Usuario (
        idUser INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        email TEXT,
        password TEXT
      )
    ''');

    // Criação da tabela Provider
    await db.execute('''
      CREATE TABLE Provider (
        idProvider INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT,
        specialty TEXT
      )
    ''');

    // Criação da tabela Avaliação
    await db.execute('''
      CREATE TABLE Avaliacao (
        idAvaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        rating REAL,
        idUser INTEGER,
        idProvider INTEGER,
         FOREIGN KEY (idUser) REFERENCES Usuario (idUser),
         FOREIGN KEY (idProvider) REFERENCES Provider (idProvider)
       )
    ''');
  }

  Future _onUpdate(Database db, int version) async {
    // Atualização do banco de dados se necessário
  }

  
}
