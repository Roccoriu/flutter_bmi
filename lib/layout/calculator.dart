import 'package:bmi_calculator/layout/drawer.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
            title: const Text('Calculator')),
        drawer: const NavDrawer(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text('Lorem Ipsum'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Calculate'),
                    onPressed: () => () {},
                  ),
                  ElevatedButton(
                    child: const Text('Clear'),
                    onPressed: () => () {},
                  ),
                ],
              ),
            ])));
  }
}
