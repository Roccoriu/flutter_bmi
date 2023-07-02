import 'package:sqflite/sqflite.dart';

Future<void> createDbSchema(Database db) async {
  await db.execute('''
    CREATE TABLE User (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );
  ''');

  await db.execute('''
    CREATE TABLE BmiRating (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      min REAL,
      max REAL,
      name TEXT,
      description TEXT
    );
  ''');

  await db.execute('''
    CREATE TABLE BmiHistory (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      bmi REAL,
      date DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(userId) REFERENCES Users(id)
    );
  ''');

  await db.execute('''
    CREATE TABLE Settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      selectedUser INTEGER,
      unitSystem TEXT,
      FOREIGN KEY(selectedUser) REFERENCES User(id)
    );
  ''');
}
