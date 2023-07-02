import 'package:sqflite/sqflite.dart';

Future<void> seedDb(Database db) async {
  List<Map<String, dynamic>> defaultBmiRatings = [
    {'min': 0, 'max': 18.5, 'name': 'Underweight', 'description': 'Underweight'},
    {'min': 18.5, 'max': 25, 'name': 'Normal', 'description': 'Normal'},
    {'min': 25, 'max': 30, 'name': 'Overweight', 'description': 'Overweight'},
    {'min': 30, 'max': 35, 'name': 'Obese', 'description': 'Obese'},
    {'min': 35, 'max': 40, 'name': 'Very Obese', 'description': 'Very Obese'},
    {'min': 40, 'max': 100, 'name': 'Morbidly Obese', 'description': 'Morbidly Obese'},
  ];

  int id = await db.insert(
    'User',
    {'name': 'anonymous'},
  );

  await db.insert(
    'Settings',
    {'selectedUser': id, 'unitSystem': 'metric'},
  );

  for (var rating in defaultBmiRatings) {
    await db.insert(
      'BmiRating',
      rating,
    );
  }
}
