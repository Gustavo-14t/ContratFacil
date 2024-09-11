import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Bancodedados {
  static final Bancodedados _instancia = Bancodedados._internal();

  factory Bancodedados() => _instancia;

  Bancodedados._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'Register.database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade, // Adicione este método se você precisar atualizar o banco de dados no futuro
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
    // Atualize o banco de dados se necessário (opcional)
  }
}

