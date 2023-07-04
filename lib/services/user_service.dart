import '../db/database_helper.dart';
import '../models/user.dart';

class UserService {
  static Future<List<User>> getAllUsers() async {
    final db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  static Future<User> getUsers({required int id}) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );

    return User.fromMap(result.first);
  }

  static Future<void> createUser({required String name}) async {
    final db = await DatabaseHelper.instance.database;

    await db.insert(
      'user',
      {'name': name},
    );
  }

  static Future<void> setCurrentUser({required int id}) async {
    final db = await DatabaseHelper.instance.database;

    await db.update(
      'settings',
      {'selected_user_id': id},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  static Future<int> getCurrentUserId() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('settings');

    return result.first['selected_user_id'] as int;
  }
}
