import 'package:bmi_calculator/store/actions/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import '../store/model/app_state.dart';

class BmiForm extends StatefulWidget {
  const BmiForm({Key? key}) : super(key: key);

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(children: [
          TextFormField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Height (cm)',
              hintText: 'Enter your height in cm',
            ),
          ),
          const SizedBox(height: 60),
          TextFormField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
              hintText: 'Enter your weight in kg',
            ),
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: const Text(
                    'Clear',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    heightController.clear();
                    weightController.clear();
                  },
                )),
            SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    sendToStore();
                    context.go('/result');
                  },
                )),
          ],
        ),
      ]),
    );
  }

  // TODO: maybe move this to a utils file
  double bmiCalc(double height, double weight) {
    return (weight / ((height / 100) * (height / 100)));
  }

  void sendToStore() {
    // TODO: make sure you need this
    var height = double.parse(heightController.text);
    var weight = double.parse(weightController.text);
    var bmi = bmiCalc(height, weight);

    // TODO: refactor this to be more legible
    StoreProvider.of<AppState>(context).dispatch(SetHeightAction(height));
    StoreProvider.of<AppState>(context).dispatch(SetWeightAction(weight));
    StoreProvider.of<AppState>(context).dispatch(SetBmiResultAction(bmi));
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
