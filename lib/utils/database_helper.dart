import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'survey.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE surveys(
            reference_number TEXT PRIMARY KEY,
            institution TEXT,
            location TEXT,
            initiated_date TEXT,
            status TEXT,
            status_color TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertSurvey(Map<String, dynamic> survey) async {
    final db = await database;
    await db.insert('surveys', survey, conflictAlgorithm: ConflictAlgorithm.replace);
    print("Tuna insert: $survey");
  }

  Future<List<Map<String, dynamic>>> getSurveys() async {
    final db = await database;
    return await db.query('surveys');
  }

  Future<void> clearSurveys() async {
    final db = await database;
    await db.delete('surveys');
  }

  // Function to get a single survey by reference_number
  Future<Map<String, dynamic>?> getSingleSurvey(String referenceNumber) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'surveys',
      where: 'reference_number = ?',
      whereArgs: [referenceNumber],
    );
    if (results.isNotEmpty) {
      return results.first; // Return the first (and only) result
    }
    return null; // Return null if no survey is found
  }
}
