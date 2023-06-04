import 'package:bmi_calculator/store/actions/bmi_actions.dart';
import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:bmi_calculator/utils/bmi.dart';
import 'package:bmi_calculator/utils/validators.dart';
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
  final _formKey = GlobalKey<FormState>();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextFormField(
                  validator: formFieldNotNull,
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    hintText: 'Enter your height in cm',
                  ),
                ),
                const SizedBox(height: 60),
                TextFormField(
                  validator: formFieldNotNull,
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    hintText: 'Enter your weight in kg',
                  ),
                )
              ],
            ),
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
                  ),
                ),
                StoreConnector<AppState, BmiState>(
                  converter: (store) => store.state.bmiState,
                  builder: (BuildContext context, BmiState bmiState) => SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: const Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () => _formKey.currentState!.validate() ? onCalculate(bmiState) : DoNothingAction(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCalculate(BmiState bmiState) {
    var height = double.parse(heightController.text);
    var weight = double.parse(weightController.text);
    var bmi = calcBMI(height, weight);

    StoreProvider.of<AppState>(context).dispatch(SetBmiResultAction(bmi));

    context.go('/result/${bmiState.getBmiRatingIndex(bmi)}');
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
