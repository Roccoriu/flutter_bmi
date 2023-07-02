import 'package:bmi_calculator/db/database_helper.dart';
import 'package:bmi_calculator/routes/router.dart';
import 'package:flutter/material.dart';

void main() {
  //final store = Store<AppState>(appReducer, initialState: initialState);

  DatabaseHelper.instance.database;
  //runApp(StoreProvider(store: store, child: const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
