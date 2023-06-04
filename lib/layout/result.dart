import 'package:bmi_calculator/layout/drawer.dart';
import 'package:bmi_calculator/store/model/app_state.dart';
import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Ratings'),
      ),
      drawer: const NavDrawer(),
      body: StoreConnector<AppState, BmiState>(
        converter: (store) => store.state.bmiState,
        builder: (BuildContext context, BmiState bmiState) {
          return ListView.builder(
            itemCount: bmiState.bmiRatings.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(bmiState.bmiRatings[index].description),
                onTap: () => context.go('/result/$index'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RatingDetail extends StatelessWidget {
  final String? id;

  const RatingDetail({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Rating Detail'),
      ),
      body: StoreConnector<AppState, BmiState>(
        converter: (store) => store.state.bmiState,
        builder: (BuildContext context, BmiState bmiState) {
          final rating = bmiState.bmiRatings[int.parse(id!)];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(rating.description, style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                //Text(rating.range, style: const TextStyle(fontSize: 20)),
                //const SizedBox(height: 20),
                //Text(rating.advice, style: const TextStyle(fontSize: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}
