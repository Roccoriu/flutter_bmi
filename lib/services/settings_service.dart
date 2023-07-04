import 'package:bmi_calculator/models/settings.dart';

import '../db/database_helper.dart';

class SettingsService {
  static Future<Settings> getSettings() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('v_settings');

    return Settings.fromMap(result.first);
  }
}
