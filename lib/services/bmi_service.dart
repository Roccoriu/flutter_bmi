import '../../db/database_helper.dart';
import '../../types/bmi.dart';

class BmiService {
  static Future<int> getBmiRatingIdByResult({required double rating}) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'BmiRating',
      where: 'min <= ? AND max >= ?',
      whereArgs: [rating, rating],
    );

    if (result.isEmpty) throw Exception('No rating found');

    return BmiRating.fromMap(result.first).id;
  }

  static Future<List<BmiRating>> getBmiRatings() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('BmiRating');
    return result.map((e) => BmiRating.fromMap(e)).toList();
  }

  static Future<BmiRating> getBmiRatingById({required int id}) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'BmiRating',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isEmpty) throw Exception('No rating found');

    return BmiRating.fromMap(result.first);
  }
}
