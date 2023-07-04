import '../../db/database_helper.dart';
import '../models/bmi.dart';
import '../models/bmi_history.dart';

class BmiService {
  static Future<int> getBmiRatingIdByResult({
    required double rating,
    required String localeKey,
  }) async {
    final db = await DatabaseHelper.instance.database;
    await addBmiHistory(bmi: rating);

    final result = await db.query(
      'bmi_rating',
      where: 'min <= ? AND max >= ? AND locale_key = ?',
      whereArgs: [rating, rating, localeKey],
    );

    if (result.isEmpty) throw Exception('No rating found');

    return BmiRating.fromMap(result.first).id;
  }

  static Future<List<BmiRating>> getBmiRatings({
    required String localeKey,
  }) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'bmi_rating',
      where: 'locale_key = ?',
      whereArgs: [localeKey],
    );
    return result.map((e) => BmiRating.fromMap(e)).toList();
  }

  static Future<BmiRating> getBmiRatingById({
    required int id,
    required String localeKey,
  }) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'bmi_rating',
      where: 'id = ? AND locale_key = ?',
      whereArgs: [id, localeKey],
    );

    if (result.isEmpty) throw Exception('No rating found');

    return BmiRating.fromMap(result.first);
  }

  static Future<void> addBmiHistory({required double bmi}) async {
    final db = await DatabaseHelper.instance.database;

    final int id = await db
        .query('settings')
        .then((value) => value.first['selected_user_id'] as int);

    await db.insert(
      'bmi_history',
      {
        'user_id': id,
        'bmi': bmi,
      },
    );
  }

  static Future<List<BmiHistory>> getBmiHistory() async {
    final db = await DatabaseHelper.instance.database;

    final String currentUserName =
        await db.query('v_settings').then((val) => val.first['name'] as String);

    final result = await db.query(
      'v_bmi_history',
      where: 'name = ?',
      whereArgs: [currentUserName],
    );

    if (result.isEmpty) {
      BmiHistory(id: 0, bmi: 0, date: DateTime.now(), name: currentUserName);
    }

    return result.map((e) => BmiHistory.fromMap(e)).toList();
  }
}
