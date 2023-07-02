import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:bmi_calculator/utils/bmi.dart';
import 'package:bmi_calculator/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => _formKey.currentState!.validate()
                        ? onCalculate((id) => context.go('/result/$id'))
                        : DoNothingAction(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCalculate(Function(int) callback) async {
    var height = double.parse(heightController.text);
    var weight = double.parse(weightController.text);
    var bmi = calcBMI(height, weight);

    var id = await BmiService.getBmiRatingIdByResult(rating: bmi);

    callback(id);
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
