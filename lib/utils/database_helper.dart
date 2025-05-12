import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE surveys(
            reference_number TEXT PRIMARY KEY,
            institution TEXT,
            location TEXT,
            initiated_date TEXT,
            status TEXT,
            status_color TEXT
          )
        ''');
        await db.execute('''
        CREATE TABLE valid_permits(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        permit_number TEXT,
        date TEXT,
        time TEXT
        )
        ''');
        await db.execute('''
        CREATE TABLE invalid_permits(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        permit_number TEXT,
        date TEXT,
        time TEXT
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

  Future<void> insertValidPermit(String permitNumber, String date, String time) async {
    final db = await database;
    await db.insert('valid_permits', {
      'permit_number': permitNumber,
      'date': date,
      'time': time,
    });
    debugPrint("Inserting valid successfully");
  }

  Future<void> insertInvalidPermit(String permitNumber, String date, String time) async {
    final db = await database;
    await db.insert('invalid_permits', {
      'permit_number': permitNumber,
      'date': date,
      'time': time,
    });
    debugPrint("Inserting invalid successfully");
  }

  Future<int> totalValidPermits() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM valid_permits');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> totalInvalidPermits() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM invalid_permits');
    return Sqflite.firstIntValue(result) ?? 0;
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
      return results.first;
    }
    return null;
  }

  Future<int> totalSurveys() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM surveys');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> totalPendingInspections() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as total FROM surveys WHERE status IN (?, ?)',
      ['Pending Survey', 'Pending Survey Completion'],
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> totalCompleteInspections() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as total FROM surveys WHERE status = ?',
      ['Completed'],
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> totalRejectedInspections() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as total FROM surveys WHERE status = ?',
      ['Rejected'],
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> totalSurveysToday() async {
    final db = await database;
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now()); // Get today's date in YYYY-MM-DD format
    final result = await db.rawQuery("SELECT COUNT(*) as total FROM surveys WHERE DATE(initiated_date) = ?", [today]);
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
