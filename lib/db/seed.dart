import 'package:sqflite/sqflite.dart';

Future<void> seedDb(Database db) async {
  List<Map<String, dynamic>> defaultBmiRatings = [
    // English
    {
      'min': 0,
      'max': 18.5,
      'name': 'Underweight',
      'description': 'Underweight',
      'rating_key': 'underweight',
      'locale_key': 'en'
    },
    {
      'min': 18.5,
      'max': 25,
      'name': 'Normal',
      'description': 'Normal',
      'rating_key': 'normal',
      'locale_key': 'en'
    },
    {
      'min': 25,
      'max': 30,
      'name': 'Overweight',
      'description': 'Overweight',
      'rating_key': 'overweight',
      'locale_key': 'en'
    },
    {
      'min': 30,
      'max': 35,
      'name': 'Obese',
      'description': 'Obese',
      'rating_key': 'obese',
      'locale_key': 'en'
    },
    {
      'min': 35,
      'max': 40,
      'name': 'Very Obese',
      'description': 'Very Obese',
      'rating_key': 'very_obese',
      'locale_key': 'en'
    },
    {
      'min': 40,
      'max': 100,
      'name': 'Morbidly Obese',
      'description': 'Morbidly Obese',
      'rating_key': 'morbidly_obese',
      'locale_key': 'en'
    },
    // German
    {
      'min': 0,
      'max': 18.5,
      'name': 'Untergewicht',
      'description': 'Untergewicht',
      'rating_key': 'underweight',
      'locale_key': 'de'
    },
    {
      'min': 18.5,
      'max': 25,
      'name': 'Normal',
      'description': 'Normal',
      'rating_key': 'normal',
      'locale_key': 'de'
    },
    {
      'min': 25,
      'max': 30,
      'name': 'Übergewicht',
      'description': 'Übergewicht',
      'rating_key': 'overweight',
      'locale_key': 'de'
    },
    {
      'min': 30,
      'max': 35,
      'name': 'Fettleibig',
      'description': 'Fettleibig',
      'rating_key': 'obese',
      'locale_key': 'de'
    },
    {
      'min': 35,
      'max': 40,
      'name': 'Sehr fettleibig',
      'description': 'Sehr fettleibig',
      'rating_key': 'very_obese',
      'locale_key': 'de'
    },
    {
      'min': 40,
      'max': 100,
      'name': 'Krass fettleibig',
      'description': 'Krass fettleibig',
      'rating_key': 'morbidly_obese',
      'locale_key': 'de'
    },
    // Italian
    {
      'min': 0,
      'max': 18.5,
      'name': 'Sottopeso',
      'description': 'Sottopeso',
      'rating_key': 'underweight',
      'locale_key': 'it'
    },
    {
      'min': 18.5,
      'max': 25,
      'name': 'Normale',
      'description': 'Normale',
      'rating_key': 'normal',
      'locale_key': 'it'
    },
    {
      'min': 25,
      'max': 30,
      'name': 'Sovrappeso',
      'description': 'Sovrappeso',
      'rating_key': 'overweight',
      'locale_key': 'it'
    },
    {
      'min': 30,
      'max': 35,
      'name': 'Obeso',
      'description': 'Obeso',
      'rating_key': 'obese',
      'locale_key': 'it'
    },
    {
      'min': 35,
      'max': 40,
      'name': 'Molto obeso',
      'description': 'Molto obeso',
      'rating_key': 'very_obese',
      'locale_key': 'it'
    },
    {
      'min': 40,
      'max': 100,
      'name': 'Gravemente obeso',
      'description': 'Gravemente obeso',
      'rating_key': 'morbidly_obese',
      'locale_key': 'it'
    },
  ];

  int id = await db.insert(
    'user',
    {'name': 'anonymous'},
  );

  await db.insert(
    'settings',
    {'selected_user_id': id, 'unit_system': 'metric'},
  );

  for (var rating in defaultBmiRatings) {
    await db.insert(
      'bmi_rating',
      rating,
    );
  }
}
