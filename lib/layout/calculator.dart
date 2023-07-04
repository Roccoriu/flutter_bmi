import 'package:bmi_calculator/components/bmi_form.dart';
import 'package:bmi_calculator/layout/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          title: Text(AppLocalizations.of(context)!.appBarTitleCalculator),
        ),
        drawer: const NavDrawer(),
        body: const Center(
          child: BmiForm(),
        ));
  }
}
