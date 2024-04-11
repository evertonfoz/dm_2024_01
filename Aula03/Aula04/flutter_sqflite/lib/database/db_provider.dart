import 'package:sqflite/sqflite.dart';

class DbProvider {
  // Database instance
  static Database? _database;
  static final DbProvider dbProvider = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    await initDB();
    return _database!;
  }

  Future<void> initDB() async {
    if (_database != null) {
      return;
    }
    try {
      _database = await openDatabase(
        'utfprDB.db',
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE categories (
              categoryID INTEGER PRIMARY KEY,
              name TEXT
            )
          ''');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> createCategory(String name) async {
    final db = await database;
    await db.insert('categories', {'name': name});
  }

  Future<List<Map<String, dynamic>>> readCategories() async {
    final db = await database;
    return db.query('categories');
  }
}
