import 'package:bmi_calculator/layout/drawer.dart';
import 'package:bmi_calculator/store/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          title: const Text('Result'),
        ),
        drawer: const NavDrawer(),
        body: StoreConnector<AppState, double>(
            converter: (store) => store.state.bmiState.bmiResult,
            builder: (BuildContext context, double bmiResult) {
              var bmi = bmiResult.toString();
              return Center(child: Text('BMI Result $bmi', style: const TextStyle(fontSize: 30)));
            }));
  }
}
