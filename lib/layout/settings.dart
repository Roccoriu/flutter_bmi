import 'package:bmi_calculator/components/bmi_form.dart';
import 'package:bmi_calculator/layout/drawer.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          title: const Text('Calculator'),
        ),
        drawer: const NavDrawer(),
        body: const Center(
          child: BmiForm(),
        ));
  }
}
