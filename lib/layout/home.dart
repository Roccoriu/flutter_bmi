import 'package:bmi_calculator/layout/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Home'),
      ),
      drawer: const NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('BMI Calculator', style: TextStyle(fontSize: 30)),
            const Text('Lorem Ipsum'),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () => context.go('/calculator'),
            )
          ],
        ),
      ),
    );
  }
}
