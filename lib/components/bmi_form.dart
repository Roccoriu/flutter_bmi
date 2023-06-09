import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:bmi_calculator/utils/bmi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BmiForm extends StatefulWidget {
  const BmiForm({Key? key}) : super(key: key);

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final _formKey = GlobalKey<FormState>();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  double height = 160.0;
  double weight = 60.0;

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
                _buildSliderFormField(
                  label: AppLocalizations.of(context)!
                      .height, // added localization
                  value: height,
                  min: 100,
                  max: 300,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),
                const SizedBox(height: 60),
                _buildSliderFormField(
                  label: AppLocalizations.of(context)!
                      .weight, // added localization
                  value: weight,
                  min: 30,
                  max: 200,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 190,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: Text(
                      // added localization
                      AppLocalizations.of(context)!.reset,
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      setState(() {
                        height = 160.0;
                        weight = 60.0;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow),
                    label: Text(
                      // added localization
                      AppLocalizations.of(context)!.calculate,
                      style: const TextStyle(fontSize: 16),
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

  Widget _buildSliderFormField({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    final formattedValue = (label == AppLocalizations.of(context)!.height)
        ? value.round().toString()
        : value.toStringAsFixed(1);
    bool isEditing = false;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: (newValue) {
                  if (!isEditing) {
                    onChanged(newValue);
                  }
                },
                divisions: (label == AppLocalizations.of(context)!.height)
                    ? (max - min).toInt()
                    : ((max - min) * 10).toInt(),
                label:
                    '$formattedValue ${(label == AppLocalizations.of(context)!.height) ? 'cm' : 'kg'}',
              ),
            ),
            SizedBox(
              width: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: TextEditingController(text: formattedValue),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.enter,
                  ),
                  onChanged: (text) {
                    if (!isEditing) {
                      final enteredValue = double.tryParse(text) ?? value;
                      onChanged(enteredValue);
                    }
                  },
                  onEditingComplete: () {
                    isEditing = false;
                  },
                  onTap: () {
                    isEditing = true;
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterValue;
                    }
                    final enteredValue = double.tryParse(text);
                    if (enteredValue == null ||
                        enteredValue < min ||
                        enteredValue > max) {
                      return AppLocalizations.of(context)!.invalidValue;
                    }
                    return null;
                  },
                  onFieldSubmitted: (text) {
                    isEditing = false;
                    final enteredValue = double.tryParse(text) ?? value;
                    onChanged(enteredValue);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onCalculate(Function(int) callback) async {
    var bmi = calcBMI(height, weight);

    var id = await BmiService.getBmiRatingIdByResult(
        rating: bmi, localeKey: Localizations.localeOf(context).languageCode);

    callback(id);
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
