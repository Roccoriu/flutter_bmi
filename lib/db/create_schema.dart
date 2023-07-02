import 'package:sqflite/sqflite.dart';

Future<void> createDbSchema(Database db) async {
  await db.execute('''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );
  ''');

  await db.execute('''
    CREATE TABLE bmi_rating (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      min REAL,
      max REAL,
      name TEXT,
      description TEXT
    );
  ''');

  await db.execute('''
    CREATE TABLE bmi_history (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER,
      bmi REAL,
      date_added DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(user_id) REFERENCES user(id)
    );
  ''');

  await db.execute('''
    CREATE TABLE settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      selected_user_id INTEGER,
      unit_system TEXT,
      FOREIGN KEY(selected_user_id) REFERENCES user(id)
    );
  ''');

  await db.execute('''
    CREATE VIEW v_bmi_history AS
       SELECT bh.id,
              bh.bmi,
              bh.date_added,
              u.name
       FROM bmi_history as bh
       JOIN user as u ON bh.user_id = u.id;
   ''');

  await db.execute('''
    CREATE VIEW v_settings AS
       SELECT s.id,
              s.selected_user_id,
              s.unit_system,
              u.name
       FROM settings as s
       JOIN user as u ON s.selected_user_id = u.id;
  ''');
}
